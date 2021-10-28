<div class="row">
  <div class="col-md-3">
    <?php
      require_once __DIR__ . "/../partials/sidebar.php";
      $query = "SELECT * FROM users WHERE id={$_SESSION['user_id']}";
      $data = $conn->query($query);
      $user = $data->fetch_assoc();

      $query = "SELECT id,name FROM categories";
      $data = $conn->query($query);
      $categories = $data->fetch_all(MYSQLI_ASSOC);

      $news_id = $_GET['news'];
      $news_query = "SELECT * FROM news WHERE id={$news_id}";
      $news_data = $conn->query($news_query);
      $news = $news_data->fetch_assoc();

      if(isset($_POST['update'])) {
        $title = $_POST['title'];
        $details = trim($_POST['details']);
        $category_id = $_POST['category'];
        if(!empty($_FILES["image"]['size'])) {
          //image upload
          $digits = 15;
          $filename = rand(pow(10, $digits-1), pow(10, $digits)-1).'.'.pathinfo($_FILES["image"]["name"])['extension'];
          $tempname = $_FILES["image"]["tmp_name"];
          $image = $filename;

          $query = "UPDATE news SET title = '$title', details = '$details', image = '$image', category_id = '$category_id'  
                    WHERE id = '$news_id'";

          if(!in_array(pathinfo($_FILES["image"]["name"])['extension'], ['jpg','jpeg','png'])) {
            define('alert_warning', 'Choose Image (jpg,jpeg,png) File Only!');

          } else {
            if (move_uploaded_file($tempname, __DIR__ . '/../public/img/news/' . $filename))  {

              if ($conn->query($query)) {
                  define('alert_success', 'Updated Successfully!');
                  header("Refresh:0");
              } else {
                  echo mysqli_connect_error();
                  define('alert_error', 'Faild To Update!');
              }
            }else{
              define('alert_error', 'Failed to upload image!');
            }
          } 
        } else {
          $query = "UPDATE news SET title = '$title', details = '$details', category_id = '$category_id' WHERE id = '$news_id'";
          if ($conn->query($query)) {
              define('alert_success', 'Updated Successfully!');
              header("Refresh:0");
          } else {
              echo mysqli_connect_error();
              define('alert_error', 'Faild To Update!');
          }
        }

        
      }
    ?> 
  </div>
  <div class="mt-5 col-md-8">
    <?php require_once __DIR__ . "/../partials/alert.php"; ?>
    <div class="panel shadow-lg p-3 mb-5 bg-body" style="height: 700px; border-radius: 25px;">
      <a style="text-decoration: none;" href="/view/news.php">
        <i class="fas fa-arrow-circle-left"></i> Back To List
      </a>
      <div class="graph-heading">
          <?php echo $news['title'];?>
      </div>

      <div class="panel-body bio-graph-info">
          <form class="mt-5" method="POST" action="" enctype="multipart/form-data">
            <div class="form-group">
              <label>Title</label>
              <input type="text" value="<?php echo $news['title']?>" 
                      class="form-control" name="title" required />
            </div>
            <div class="form-group mt-3">
              <img height="100" width="104" src="/public/img/news/<?php echo $news['image'];?>">
              
              <input class="form-control mt-2" type="file" 
                      accept="image/png, image/jpg, image/jpeg" name="image"/>
            </div>
            <div class="form-group mt-3">
              <label>Details</label>
              <textarea required class="form-control" name="details" rows="5" cols="40"><?php echo trim($news['details'])?></textarea>
            </div>

            <div class="form-group mt-3">
              <select required class="form-control" name="category">                      
                <option  value="">Select a category</option>
                <?php 
                  foreach ($categories as $category) {
                    echo '<option ';
                    if($news['category_id'] == $category['id']) {
                        echo 'selected ';
                    }     
                    echo 'value="'; echo $category['id'];echo '">';
                    echo $category['name'];
                    echo '</option>';
                  }
                ?>
              </select>
            </div>
            
          <div class="mt-2" style="float:right;">
            <button type="submit" name="update" class="btn btn-primary">Update</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
