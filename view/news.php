<div class="row">
  <div class="col-md-3">
    <?php 
      // require __DIR__ . "/../partials/type.php";
      require_once __DIR__ . "/../partials/sidebar.php";

      if($_SESSION['type'] != USERTYPE::ADMIN) {
        header("location:javascript://history.go(-1)");
      }

      $table_name = 'news';
      require __DIR__ . "/../partials/pagination.php";
      
      $query = "SELECT id,name FROM categories";
      $data = $conn->query($query);
      $categories = $data->fetch_all(MYSQLI_ASSOC);

      $news_query = "SELECT news.id,news.title,news.details,news.image,news.user_id,news.category_id,
                      news.created_at,categories.name FROM news JOIN categories ON news.category_id=categories.id 
                      WHERE news.user_id={$_SESSION['user_id']} ORDER BY news.id DESC 
                      LIMIT {$offset}, {$total_records_per_page}
                      ";
      $news_data = $conn->query($news_query);
      $news = $news_data->fetch_all(MYSQLI_ASSOC);
      

      if(isset($_POST['publish'])) {
          $title = $_POST['title'];
          $details = $_POST['details'];
          $user_id = $_SESSION['user_id'];
          $category_id = $_POST['category'];
          $date = date("Y-m-d",time());

          //image upload
          $digits = 15;
          $filename = rand(pow(10, $digits-1), pow(10, $digits)-1).'.'.pathinfo($_FILES["image"]["name"])['extension'];
          $tempname = $_FILES["image"]["tmp_name"];
          $image = $filename;

          
          if(!in_array(pathinfo($_FILES["image"]["name"])['extension'], ['jpg','jpeg','png'])) {
            define('alert_warning', 'Choose Image (jpg,jpeg,png) File Only!');

          } else {
            if (move_uploaded_file($tempname, __DIR__ . '/../public/img/news/' . $filename))  {

              
              $query = "INSERT INTO news(title,details,image,user_id,category_id,created_at) 
                    VALUES ('$title','$details','$image','$user_id','$category_id','$date')";

              if ($conn->query($query)) {
                  define('alert_success', 'News Published Successfully!');
                  header("Refresh:0");
              } else {
                  echo mysqli_connect_error();
                  define('alert_error', 'Faild To Publish News!');
              }
            }else{
              define('alert_error', 'Failed to upload image!');
            }

          }     
      }

      if(isset($_POST['delete'])) {
          $news_id = $_POST['news_id'];

          $delete_query = "DELETE FROM news WHERE id={$news_id}";

          if ($conn->query($delete_query)) {
              // define('alert_success', 'Deleted Successfully!');
              header("Refresh:0");
          } else {
              echo mysqli_connect_error();
              define('alert_error', 'Faild To Delete!');
          }

      }
    ?> 
  </div>

  <div class="mt-5 col-md-9">
  <!-- Button trigger modal -->
  <button style="float: right; margin-bottom: 25px !important;margin-right: 80px;" type="button" 
          class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Publish News
  </button>
  <?php require_once __DIR__ . "/../partials/alert.php"; ?>

  <!-- Modal -->
  <div class="modal shadow-lg p-3 mb-5 fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Publish News</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form method="POST" action="" enctype="multipart/form-data">
          <div class="modal-body">
            <div class="form-group mt-2">
              <label>Title</label>
              <input type="text" class="form-control" name="title" required />
            </div>
            <div class="form-group mt-2">
              <label>Cover Photo</label>
              <input required class="form-control" type="file" 
                      accept="image/png, image/jpg, image/jpeg" name="image"/>
            </div>
            <div class="form-group mt-2">
              <label>Details</label>
              <textarea required class="form-control" name="details" rows="5" cols="40"></textarea>
            </div>
            <div class="form-group mt-4">
              <select required class="form-control" name="category">                      
                <option value="">Select a category</option>
                <?php 
                  foreach ($categories as $category) {
                    echo '<option value="'; echo $category['id'];echo '">';
                    echo $category['name'];
                    echo '</option>';
                  }
                ?>
              </select>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            <button type="submit" name="publish" class="btn btn-primary">Publish</button>
          </div>
        </form>
      </div>
    </div>
  </div>


  <!--Table-->
  <?php 
    if($news) {?>
  
    <div style="margin-right: 80px;">
      <table id="newsList" class="mt-5 shadow-lg table table-bordered table-striped" style="width:100%;">
          <thead class="graph-heading" style="border-radius: 15px;">
              <tr>
                <th class="p-4">Title</th>
                <th class="p-4">Details</th>
                <th class="p-4">Image</th>
                <th class="p-4">Category</th>
                <th class="p-4">Published</th>
                <th class="p-4">Action</th>
              </tr>
          </thead>
          <tbody>
            <?php
              foreach($news as $value) {
            ?>
              <tr>
                <td style="width:50px"><?php echo $value['title'] ;?></td>

                <td class="hide-text"><?php echo $value['details'];?></td>
                <td style="width:50px">
                  <img height="70" width="70" src="/public/img/news/<?php echo $value['image'];?>">
                </td>
                <td><?php echo $value['name'];?></td>
                <td><?php echo date_format(date_create($value['created_at']),"M j, Y")?></td>
                <td class="d-flex" style="width: 100%">
                  <a style="height:fit-content;" class="btn btn-primary" target="_blank" 
                      href="/view/singleNews.php?news=<?php echo $value['id'] ?>">
                    <i class="far fa-eye"></i>
                  </a>

                  <form method="POST">
                    <input hidden type="number" name="news_id" value="<?php echo $value['id']?>">
                    <button onclick="return clicked();" type="submit" name="delete" class="btn btn-danger">
                      <i class="fas fa-trash"></i>
                    </button>
                  </form>

                  <a style="height:fit-content;" class="btn btn-success" 
                      href="/view/editNews.php?news=<?php echo $value['id'] ?>">
                    <i class="fas fa-edit"></i>
                  </a>
                </td>
              </tr>
            <?php }?>
          </tbody>
      </table>
    </div>
    <!--Pagination-->
    <div>
      <div class="mt-2">
        <strong>Page <?php echo $page_no." of ".$total_no_of_pages; ?></strong>
      </div>

      <div class="mt-2">
        Total Records:<strong> <?php echo $result_count; ?></strong>
      </div>

      <div> 
        <?php require __DIR__ . "/../partials/paginationButton.php";?>
      </div>  
    </div>
      
    
    
<?php } else { ?>
    <div class="center" style="margin-top: 150px;">
      <img height="400" width="400" src="/public/img/not_found.png">
    </div>
<?php } ?>
  </div>
</div>

<script>
  function clicked() {
      return confirm('Are You Sure?');
  }
</script>



