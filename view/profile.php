<div class="row">
  <div class="col-md-3">
    <?php
      require_once __DIR__ . "/../partials/sidebar.php";
      // require __DIR__ . "/../partials/type.php";
      $query = "SELECT * FROM users WHERE id={$_SESSION['user_id']}";
      $data = $conn->query($query);
      $user = $data->fetch_assoc();
    ?> 
  </div>
  <div class="mt-5 col-md-8">
    <div class="panel shadow-lg p-3 mb-5 bg-body" style="height: 700px; border-radius: 25px;">
          <div class="graph-heading">
              Profile Details
          </div>
          <div class="panel-body bio-graph-info">
              <h1></h1>
              <div class="row">
                  <div class="bio-row">
                      <p><span>Full Name: </span>
                        <?php echo $user['username']?>
                      </p>
                  </div>
                  <div class="bio-row">
                      <p><span>Email: </span>
                        <?php echo $user['email']?>
                      </p>
                  </div>
                  <div class="bio-row">
                      <p><span>User Type: </span>
                        <?php echo ucwords(USERTYPE::TYPE[$user['type']])?>
                      </p>
                  </div>
                  <div class="bio-row">
                      <p><span>Registerd At:</span>
                        <?php echo date_format(date_create($user['created_at']),"F j, Y")?>
                      </p>
                  </div>
              </div>
          </div>
      </div>
  </div>
</div>
