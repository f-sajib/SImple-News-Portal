<?php
require_once __DIR__ . "/../partials/navbar.php";
require __DIR__ . "/../config.php";

if(isset($_SESSION['user_id'])) {
  header('Location: /');
  exit;
}

if (isset($_POST['register'])) {
	if($_POST['password'] != $_POST['c_password']) {
		define('alert_error', 'Password Does Not Match');	
	}
  $username = $_POST['username'];
  $email = $_POST['email'];
  $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
  $type = $_POST['type'];
  $date = date("Y-m-d",time());
  $query = "SELECT * FROM users WHERE email='{$email}'";
  $data = $conn->query($query);
  if ($data->num_rows > 0) {
  		define('alert_error', 'You are already registered!');
  }
  if ($data->num_rows == 0) {
  		$query = "INSERT INTO users(username,password,email,type,created_at) 
  						VALUES ('{$username}','{$password}','{$email}','{$type}','{$date}')";
      if ($conn->query($query)) {
          define('alert_success', 'Successfully Registered!');
  		} else {
          define('alert_error', 'Faild to register!');
      }
   }
}
?>

<?php require_once __DIR__ . "/../partials/alert.php"; ?>
<div class="card center shadow-lg p-3 mb-5 bg-body rounded">
   <div class="card-body">
	    <form method="post" action="">
	    	<div class="form-group mt-2">
	    		<label>Full Name</label>
	    		<input required type="text" name="username" class="form-control">
	  		</div>
	  		<div class="form-group mt-4">
				<select required class="form-control" id="type" name="type">                      
				  <option value="">Register as</option>
				  <option value="1">Admin</option>
				  <option value="2">Viewer</option>
				</select>
	  		</div>
	  		<div class="form-group mt-2">
	    		<label>Email address</label>
	    		<input required type="email" name="email" class="form-control">
	  		</div>
	  		<div class="form-group mt-2">
	    		<label>Password</label>
	    		<input required type="password" name="password" class="form-control">
	  		</div>
			<div class="form-group mt-2">
			    <label>Confirm Password</label>
			    <input required type="password" name="c_password" class="form-control">
			</div>
		 	<button type="submit" name="register" class="btn mt-3 btn-primary">Register</button> 
		</form>
    </div>
</div>
