<?php
require_once __DIR__ . "/../partials/navbar.php";
if(isset($_SESSION['user_id'])) {
  header('Location: /');
  exit;
}
require __DIR__ . "/../config.php";
if (isset($_POST['login'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];
    $query = "SELECT * FROM users WHERE email='{$email}'";
    $data = $conn->query($query);
    if($data->num_rows == 0) {
      define('alert_error','User Not Found');
    } else {
      $user = $data->fetch_assoc();
      if(password_verify($password, $user['password'])) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['type'] = $user['type'];
        header("Location: /view/dashboard.php");
      } else {
        define('alert_error','Invalid Credential');
      }
    }
}
?>

<?php require_once __DIR__ . "/../partials/alert.php"; ?>
<div class="card center shadow-lg p-3 mb-5 bg-body rounded">
   <div class="card-body">
      <form method="post" action="" name="signin-form">
        <div class="form-group mt-2">
          <label>Email</label>
          <input type="email" class="form-control" name="email" required />
        </div>
        <div class="form-group mt-2">
          <label>Password</label>
          <input type="password" class="form-control" name="password" required />
        </div>
        <button class="btn mt-3 btn-primary" type="submit" name="login">Log In</button>
  </form>
    </div>
</div>