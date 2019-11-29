<?php 
$url2 = $_SERVER['REQUEST_URI']; 
$url2 = explode('/', $url2);
$lastPart2 = array_pop($url2);
?>
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="<?php if($lastPart2!=''){ echo "../"; } ?>dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
                       style="opacity: .8">
      <span class="brand-text font-weight-light">Fluid Coffee</span>
    </a>

<!-- Sidebar -->
<div class="sidebar">
  <!-- Sidebar user panel (optional) -->
  <div class="user-panel mt-3 pb-3 mb-3 d-flex">
    <div class="image">
      <img src="<?php if($lastPart2!=''){ echo "../"; } ?>dist/img/avatar5.png" class="img-circle elevation-2" alt="User Image">
    </div>
    <div class="info">
      <a href="#" class="d-block">Campaign Admin</a>
    </div>
  </div>

                        <!-- Sidebar Menu -->
                        <nav class="mt-2">
                          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Add icons to the links using the .nav-icon class
                                 with font-awesome or any other icon font library -->
                            <li class="nav-item has-treeview menu-open">
                              <a href="<?php if($lastPart2!=''){ echo '../'; } ?>" class="nav-link <?php if($lastPart=''){ echo '/'; } ?>">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>
                                  Dashboard
                                </p>
                              </a>
                            </li>
          <!-- Category Nav -->
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link <?php if($lastPart2=='category.php'){ echo 'active'; } ?>" >
              <i class="nav-icon fas fa-copy"></i>
              <p>
                Campaign Category
                <i class="fas fa-angle-left right"></i>
                <!-- <span class="badge badge-info right">6</span> -->
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<?php if($lastPart2==''){ echo 'pages/category.php'; }else { echo 'category.php'; } ?>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>View Campaign Category</p>
                </a>
              </li>
            </ul>
          </li>
          <!-- Campaign Header Images -->
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link <?php if($lastPart2=='Campaign-images.php'){ echo 'active'; } ?>" >
              <i class="nav-icon far fa-file-image"></i>
              <p>
                Campaign Images
                <i class="fas fa-angle-left right"></i>
                <!-- <span class="badge badge-info right">6</span> -->
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<?php if($lastPart2==''){ echo 'pages/Campaign-images.php'; }else { echo 'Campaign-images.php'; } ?>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>View Campaign Images</p>
                </a>
              </li>
            </ul>
          </li>
          <!-- Banned IP's Nav -->
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link <?php if($lastPart2=='banned-ip.php'){ echo 'active'; } ?>" >
              <i class="nav-icon fas fa-server"></i>
              <p>
                Banned IP's
                <i class="fas fa-angle-left right"></i>
                <!-- <span class="badge badge-info right">6</span> -->
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<?php if($lastPart2==''){ echo 'pages/banned-ip.php'; }else { echo 'banned-ip.php'; } ?>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>View Banned IP's</p>
                </a>
              </li>
            </ul>
          </li>
          <!-- Blacklisted Email Nav -->
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link <?php if($lastPart2=='blacklist-emails.php'){ echo 'active'; } ?>" >
              <i class="nav-icon fas fa-envelope"></i>
              <p>
                Blacklisted Email
                <i class="fas fa-angle-left right"></i>
                <!-- <span class="badge badge-info right">6</span> -->
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<?php if($lastPart2==''){ echo 'pages/blacklist-emails.php'; }else { echo 'blacklist-emails.php'; } ?>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>View Blacklist Emails</p>
                </a>
              </li>
            </ul>
          </li>
          <!-- Blacklisted Phone Number Nav -->
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link <?php if($lastPart2=='blacklist-phone.php'){ echo 'active'; } ?>" >
              <i class="nav-icon fas fa-phone-volume"></i>
              <p>
                Blacklisted Phone
                <i class="fas fa-angle-left right"></i>
                <!-- <span class="badge badge-info right">6</span> -->
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<?php if($lastPart2==''){ echo 'pages/blacklist-phone.php'; }else { echo 'blacklist-phone.php'; } ?>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>View Blacklist Phone</p>
                </a>
              </li>
            </ul>
          </li>
          <!-- Language Nav -->
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link <?php if($lastPart2=='language.php'){ echo 'active'; } ?>" >
              <i class="nav-icon fas fa-language"></i>
              <p>
                Languages
                <i class="fas fa-angle-left right"></i>
                <!-- <span class="badge badge-info right">6</span> -->
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<?php if($lastPart2==''){ echo 'pages/language.php'; }else { echo 'language.php'; } ?>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>View Languages</p>
                </a>
              </li>
            </ul>
          </li>
          <!-- eCrad Campaign Nav -->
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link <?php if($lastPart2=='blacklist-eCard.php' || $lastPart2 == 'eCard-template.php'){ echo 'active'; } ?>" >
              <i class="nav-icon fas fa-credit-card"></i>
              <p>
                eCard Campaign
                <i class="fas fa-angle-left right"></i>
                <!-- <span class="badge badge-info right">6</span> -->
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<?php if($lastPart2==''){ echo 'pages/eCard-Design.php'; }else { echo 'eCard-Design.php'; } ?>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add eCard Campaign</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php if($lastPart2==''){ echo 'pages/eCard-template.php'; }else { echo 'eCard-template.php'; } ?>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>eCard Template Image</p>
                </a>
              </li>
            </ul>
          </li>
          <!-- Logout -->
          <li class="nav-item has-treeview">
            <a href="javascript;" onclick="logout();" class="nav-link <?php if($lastPart2=='logout.php'){ echo 'active'; } ?>" >
              <i class="nav-icon fas fa-sign-out-alt"></i>
              <p>
                Logout
                <!-- <i class="fas fa-angle-left right"></i> -->
                <!-- <span class="badge badge-info right">6</span> -->
              </p>
            </a>
            <!-- <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<?php if($lastPart2==''){ echo 'pages/eCard-Design.php'; }else { echo 'eCard-Design.php'; } ?>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add eCard Campaign</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php if($lastPart2==''){ echo 'pages/eCard-template.php'; }else { echo 'eCard-template.php'; } ?>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>eCard Template Image</p>
                </a>
              </li>
            </ul> -->
          </li>
          

        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
<?php include_once "query.php"; ?>