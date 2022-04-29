<header>
    <nav class="navigation">
			<div class="nav-logo">
                           <a href="<?php echo BASE_URL . '/index.php' ?>" class="logo">
                           <h1 class="logo-text"><span>Amatista</span>Blog</h1>
                           </a>
                        </div>
			<ul class="nav-menu">
				<li><a href="<?php echo BASE_URL . '/index.php' ?>">Home
                                <i class="fa fa-home"></i>
                                </a></li>
                                
				<?php if (isset($_SESSION['id'])): ?>
        <li class="menu-item-has-children">
          <?php if($_SESSION['admin']): ?>
          <a href="<?php echo BASE_URL . '/admin/dashboard.php' ?>">
            <i class="fa fa-user"></i>
            <?php echo $_SESSION['username']; ?> - Dashboard
            <i class="fa fa-cog" style="font-size: .8em;"></i>
          </a>
          </li>
          <li class="menu-item-has-children">
          <a href="<?php echo BASE_URL . '/logout.php' ?>">
            <i class="fa fa-user"></i>
            <?php echo $_SESSION['username']; ?> - Logout
           <i class="fa fa-chevron-circle-right" style="font-size: .8em;"></i>
          </a>
          </li>
          <?php else: ?>
          <a href="<?php echo BASE_URL . '/logout.php' ?>">
            <i class="fa fa-user"></i>
            <?php echo $_SESSION['username']; ?> - Logout
           <i class="fa fa-chevron-circle-right" style="font-size: .8em;"></i>
          </a>
          <?php endif; ?>

       
         
        </li>
      <?php else: ?>

         <li><a href="http://localhost/Amatista_journeys/">Amatista-journeys
        <i class="fa fa-cubes"></i>
        </a></li>


        <li><a href="<?php echo BASE_URL . '/register.php' ?>">Sign Up
        <i class="fa fa-user-plus"></i>
        </a></li>



        <li><a href="<?php echo BASE_URL . '/login.php' ?>">Login
        <i class="fa fa-users"></i>
        </a></li>
      <?php endif; ?>
			</ul>
			<div class="nav-toggle">
	                <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
			</div>
		</nav>
		<div class="nav-overlay"></div>

</header>