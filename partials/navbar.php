<?php
  error_reporting(E_ALL); 
  session_start();
  $uri = $_SERVER['REQUEST_URI']; 
  $register_url = '/view/register.php';
  $login_url = '/view/login.php';
  $logout_url = '/view/logout.php';
  $dashboard_url = '/view/dashboard.php';
?>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

<link rel="stylesheet" href="/public/style.css">

<nav style="background-color: #0d6efd;" class="navbar navbar-expand-lg navbar-light shadow-lg p-3 mb-5 rounded">
  <div class="container-fluid">
    <a class="navbar-brand text-white" href="/">NP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse float-right" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">


        <?php if(!isset($_SESSION['user_id'])) {?>
        <li class="nav-item">
          <?php $flag = strcmp($uri, $register_url) == 0 ? 'active' : '';?>
          <a class="nav-link text-white <?php echo $flag?>" 
            href=<?php echo $register_url?>>Register</a>
        </li>
        <?php } ?>


        <?php if(!isset($_SESSION['user_id'])) {?>
        <li class="nav-item">
          <?php $flag = strcmp($uri, $login_url) == 0 ? 'active' : '';?>
          <a class="nav-link text-white <?php echo $flag?>" 
          href=<?php echo $login_url?>>Login</a>
        </li>
        <?php } ?>

        <?php if(isset($_SESSION['user_id'])) {?>
          <li class="nav-item">
            <a class="nav-link text-white" 
            href=<?php echo $dashboard_url?>>Dashboard</a>
          </li>
        <?php } ?>

        <?php if(isset($_SESSION['user_id'])) {?>
          <li class="nav-item">
            <a class="nav-link text-white " 
            href=<?php echo $logout_url?>>Log Out</a>
          </li>
        <?php } ?>
      </ul>
      <!-- <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> -->
    </div>
  </div>
</nav>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
