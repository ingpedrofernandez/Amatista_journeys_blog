<header>
<nav class="navigation">
                        <div class="nav-logo">
                           <a href="<?php echo BASE_URL . '/index.php' ?>" class="logo">
                           <h1 class="logo-text"><span>Amatista</span>Blog</h1>
                           </a>
                        </div>
   
    <ul class="nav-menu">
        <?php if (isset($_SESSION['username'])): ?>
            <li class="menu-item-has-children">
                <a href="<?php echo BASE_URL . '/index.php' ?>">
                    <i class="fa fa-user"></i>
                    <?php echo $_SESSION['username']; ?> - Publico
                    <i class="fa fa-globe" style="font-size: .8em;"></i>
                </a>
            </li>
            <li class="menu-item-has-children">
                <a href="<?php echo BASE_URL . '/logout.php' ?>">
                    <i class="fa fa-user"></i>
                    <?php echo $_SESSION['username']; ?> - Logout
                    <i class="fa fa-chevron-circle-right" style="font-size: .8em;"></i>
                </a>
            </li>
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