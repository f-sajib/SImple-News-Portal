<div class="row">
  <div class="col-md-3">
    <?php 
      // require __DIR__ . "/../partials/type.php";
      require_once __DIR__ . "/../partials/sidebar.php"; 
    ?> 
  </div>
  <div class="mt-5 col-md-9">
    <h1>Welcome <?php echo ucwords(USERTYPE::TYPE[$_SESSION['type']]) ?></h1>
  </div>
</div>

