<?php include("path.php"); ?>
<?php include(ROOT_PATH . '/app/controllers/posts.php');
include(ROOT_PATH . '/app/database/connect_pdo.php');
$valid = true;
$errors1 = array();

if (isset($_GET['id'])) {
  $post = selectOne('posts', ['id' => $_GET['id']]);
}
$topics = selectAll('topics');
$posts = selectAll('posts', ['published' => 1]);

// Check if the form has been posted
if (isset($_POST['comment'])) {
    if (empty($_POST['comment'])) {
        $valid = false;
        $errors1['comment'] = "You must input a comment.";
    }

    if ($valid) {

        $post_id = $post['id'];
        //echo $post_id;
        $username = $_SESSION['username'];
        //echo $username;
        $comment = $_POST['comment'];
        //echo $comment;

        // prepare sql and bind parameters
        $stmt = $cpdo->prepare("INSERT INTO comments (post_id, username, comment)
        VALUES (:post_id, :username, :comment)");
        $stmt->bindParam(':post_id', $post_id);
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':comment', $comment);
        $stmt->execute();

        $id = $_GET['id'];
        //echo $id;

        // select a particular comment by id
        $stmt = $cpdo->prepare("SELECT comments FROM posts WHERE id=?");
        $stmt->execute([$id]); 
        //$comments = $stmt->fetch();
        while ($row = $stmt->fetch()) {
        $comments = $row['comments'];
        }
        if ($comments == 0) {
        $comments = 1;
        $sql = "UPDATE posts SET comments=? WHERE id=?";
        $stmt= $cpdo->prepare($sql);
        $stmt->execute([$comments, $id]);
        // Go to the thank you page
        $_SESSION['message'] = 'Comment added!';
        $_SESSION['type'] = 'success';
        header("location: index.php");
        exit;
        }
        //echo $comments;
        //exit;
        
        $comments = $comments + 1;
        //echo $comments;
        //exit;
        
        $sql = "UPDATE posts SET comments=? WHERE id=?";
        $stmt= $cpdo->prepare($sql);
        $stmt->execute([$comments, $id]);
       
        
        // Go to the thank you page
        $_SESSION['message'] = 'Comment added!';
        $_SESSION['type'] = 'success';
        header("location: index.php");
        exit;

    }
}




?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
    integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Candal|Lora" rel="stylesheet">

  <!-- Custom Styling -->
  <link rel="stylesheet" href="assets/css/style.css">

  <title><?php echo $post['title']; ?> | AMATISTA</title>
<style>
#shell {
 background:#9AFEFF; 
 border-radius: 10px 10px 10px 10px;
 overflow:hidden;
 border-style: solid;
 border-color: #0020C2;
}

#username {
 background:#00BFFF;
 padding:5px;
}

#post {
 padding:5px;
}
</style>
</head>

<body>
  

  <?php include(ROOT_PATH . "/app/includes/header.php"); ?>
  

  <!-- Page Wrapper -->
  <div class="page-wrapper">

    <!-- Content -->
    <div class="content clearfix">

      <!-- Main Content Wrapper -->
      <div class="main-content-wrapper">
        <div class="main-content single">
        <?php if (!$valid): ?>
                <div class="msg error">
                    <?php foreach($errors1 as $message1):?>
                        <div><?php echo htmlspecialchars($message1); ?></div>
                    <?php endforeach; ?>
                </div>
            
            <?php endif; ?>
            <?php
           $post_id = $post['id'];
           $stmt = $cpdo->prepare("SELECT username, comment, created_at FROM comments WHERE post_id=:post_id");
           $stmt->execute(['post_id' => $post_id]); 
           $count = $stmt->rowCount();
           //echo $count;
           ?>
           <?php
           if (!empty($_SESSION['admin'])) {
           ?>
            <div id="shell">
           <div id="username">COMMENTS: <?php echo $count; ?></div>
           </div><br>
           <?php
           }
           ?>
          <h1 class="post-title"><?php echo $post['title']; ?></h1>

          <?php
           if (!empty($_SESSION['admin'])) {
           $post_id = $post['id'];
           $stmt = $cpdo->prepare("SELECT username, comment, created_at FROM comments WHERE post_id=:post_id");
           $stmt->execute(['post_id' => $post_id]); 
           $count = $stmt->rowCount();
           //echo $count;
           ?>
           
           <?php
           while ($row = $stmt->fetch()) {
           ?>
           
           <div id="shell">
           <div id="username">Username:
           <?php
           echo $row['username']."<br />\n";
           ?>
           </div>
           <div id="post">Comment:
           <?php
           echo $row['comment']."<br />\n";
           ?>
           </div>
           <div id="post">Date:
           <?php
           //echo $row['created_at']."<br />\n";
           $timeStamp = $row['created_at'];
           $timeStamp = date( "d/m/Y, H:i:s", strtotime($timeStamp));
           echo $timeStamp;
           ?>
           </div>
           </div>
           <?php
           echo "<br />\n";
           }
           }
           ?>
             
        
      

          <div class="post-content">
            <?php echo html_entity_decode($post['body']); ?>
          </div>
          <?php
          if (!$_SESSION['admin']) {
          ?>
                        <form action="single_user_login.php?id=<?php echo $post['id']; ?>" method="post">
                        
                        <input type="hidden" id="id" name="id" value="<?php echo $post['id']; ?>">
                        <input type="hidden" id="title" name="title" value="<?php echo $post['title']; ?>">
                        <input type="hidden" id="body" name="body" value="<?php echo $post['body']; ?>">
                        <input type="hidden" id="username" name="username" value="<?php echo $_SESSION['username']; ?>">
                        <div>
                            <label>Comment:</label><br><br>
                             
                            <input type="text" name="comment" value="<?php echo $comment ?>" class="text-input">
                        </div><br>
                        <div>
                            <button type="submit"  class="btn btn-big">Add Comment</button>
                        </div>
                        </form>
           <?php
           } else {
           ?>
           
           <?php
           /*
           $post_id = $post['id'];
           $stmt = $cpdo->prepare("SELECT username, comment, created_at FROM comments WHERE post_id=:post_id");
           $stmt->execute(['post_id' => $post_id]); 
           $count = $stmt->rowCount();
           //echo $count;
           ?>
           
           <?php
           while ($row = $stmt->fetch()) {
           ?>
           
           <div id="shell">
           <div id="username">Username:
           <?php
           echo $row['username']."<br />\n";
           ?>
           </div>
           <div id="post">Comment:
           <?php
           echo $row['comment']."<br />\n";
           ?>
           </div>
           <div id="post">Date:
           <?php
           //echo $row['created_at']."<br />\n";
           $timeStamp = $row['created_at'];
           $timeStamp = date( "d/m/Y, H:i:s", strtotime($timeStamp));
           echo $timeStamp;
           ?>
           </div>
           </div>
           <?php
           echo "<br />\n";
           
           }
           */
           }
           
           ?> 
        </div>
      
      </div>
      <!-- // Main Content -->

      <!-- Sidebar -->
      <div class="sidebar single">

       


        <div class="section popular">
          <h2 class="section-title">Popular</h2>

          <?php foreach ($posts as $p): ?>
            <div class="post clearfix">
              <img src="<?php echo BASE_URL . '/assets/images/' . $p['image']; ?>" alt="">
              <a href="index.php" class="title">
                <h4><?php echo $p['title'] ?></h4>
              </a>
            </div>
          <?php endforeach; ?>
          

        </div>

        <div class="section topics">
          <h2 class="section-title">Topics</h2>
          <ul>
            <?php foreach ($topics as $topic): ?>
              <li><a href="<?php echo BASE_URL . '/index.php?t_id=' . $topic['id'] . '&name=' . $topic['name'] ?>"><?php echo $topic['name']; ?></a></li>
            <?php endforeach; ?>

          </ul>
        </div>
      </div>
      <!-- // Sidebar -->

    </div>
    <!-- // Content -->

  </div>
  <!-- // Page Wrapper -->

  <?php include(ROOT_PATH . "/app/includes/footer.php"); ?>


  <!-- JQuery -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <!-- Slick Carousel -->
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

  <!-- Custom Script -->
  <script src="assets/js/scripts.js"></script>
  <script src="assets/js/main.js"></script>


</body>

</html>