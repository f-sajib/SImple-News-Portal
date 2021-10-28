<?php
error_reporting(E_ALL); 
session_start(); 
if(!isset($_SESSION['user_id'])) {
  header('Location: /view/login.php');
  exit;
}
require __DIR__ . "/../config.php";
require __DIR__ . "/../partials/type.php";
$uri = $_SERVER['REQUEST_URI']; 
$dashbaord_url = '/view/dashboard.php';
$profile_url = '/view/profile.php';
$news_url = '/view/news.php';
?>

<link rel="stylesheet" href="/public/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">


<link href="/public/sidebars.css" rel="stylesheet">

<main class="shadow-lg p-3 bg-body" style="width:300px">

  <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px; height: 800px !important">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <span class="fs-4">NEWS PORTAL</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="<?php echo $dashbaord_url?>" 
          class="nav-link <?php echo strcmp($uri, $dashbaord_url) == 0 ? 'active' : ''; ?>" aria-current="page">
          <i class="fas fa-tachometer-alt"></i>
          Dashboard
        </a>
      </li>
      <li class="nav-item">
        <a href="<?php echo $profile_url?>" 
          class="nav-link <?php echo strcmp($uri, $profile_url) == 0 ? 'active' : ''; ?>" aria-current="page">
          <i class="fas fa-user"></i>
          Profile
        </a>
      </li>
      <?php if($_SESSION['type'] == USERTYPE::ADMIN){?>
        <li class="nav-item">
          <a href="<?php echo $news_url?>" 
            class="nav-link <?php echo strcmp($uri, $news_url) == 0 ? 'active' : ''; ?>" aria-current="page">
            <i class="far fa-newspaper"></i>
            News
          </a>
        </li>
      <?php }?>
      <!-- <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
          Dashboard
        </a>
      </li> -->
     <!--  <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"/></svg>
          Orders
        </a>
      </li> -->
      <!-- <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
          Products
        </a>
      </li> -->
     <!--  <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
          Customers
        </a>
      </li> -->
    </ul>
    <hr>
    <div class="dropdown">
      <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
        <img style="border-radius: 50px; height: 40px;"
              src="https://ui-avatars.com/api/?name=<?php echo $_SESSION['username'] ?>&color=ffffff&background=0d6efd" 
              alt="<?php echo $_SESSION['username'] ?>"
        >
        <strong class="ms-3"><?php echo $_SESSION['username'] ?></strong>
      </a>
      <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
        <li><a class="dropdown-item" href="/view/logout.php">Sign out</a></li>
      </ul>
    </div>
  </div>
  
  
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/public/sidebars.js"></script><!-- 
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script> -->