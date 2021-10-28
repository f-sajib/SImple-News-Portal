<?php

require __DIR__ . "/../config.php";
session_start();
if(!isset($_SESSION['user_id'])) {
	$disabled = 'disabled';
	$pointer = 'pointer-events: auto;';
	$title = 'Please Log In To comment!';
	$readonly = 'readonly';
	$placeholder = 'Please Log In To Comment Here..';
} else {
	$disabled = '';
	$pointer = '';
	$title = '';
	$readonly = '';
	$placeholder = 'Comment Here...';
}
$news_id = $_GET["news"];

$query = "SELECT news.*,categories.name, users.username FROM news 
			JOIN categories ON news.category_id=categories.id 
			JOIN test.users ON test.news.user_id = test.users.id
			WHERE news.id={$news_id}";
$data = $conn->query($query);
$news = $data->fetch_assoc();

$comments_query = "SELECT COUNT(*) as comment_count FROM comments WHERE news_id={$news_id}";
$comments_data = $conn->query($comments_query);
$comments = $comments_data->fetch_all(MYSQLI_ASSOC);

if(isset($_POST['submit'])) {
  $comment = $_POST['comment'];
  $user_id = $_SESSION['user_id'];
  $date = date("Y-m-d",time());

  $query = "INSERT INTO comments(comment,user_id,news_id,created_at) VALUES ('$comment','$user_id','$news_id','$date')";

  if ($conn->query($query)) {
      // define('alert_success', 'Commented Successfully!');
      header("Refresh:0");
  } else {
      echo mysqli_connect_error();
      define('alert_error', 'Failde To Comment!');
  }
}


?>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="/public/style.css">

<div class="row p-5">
	<div class="col-md-6">
		<h3 class="br-25 shadow-lg p-3 bg-body"><?php echo $news['title'];?></h3>
		<div class="br-25 shadow-lg p-3 bg-body">
			<img class="br-25" height="300" width="720" src="/public/img/news/<?php echo $news['image'];?>">
		</div>

		<div class="br-25 mt-5 shadow-lg p-3 bg-body">
			<?php echo $news['details'];?>
		</div>
	</div>

	<div class="col-md-6">
		<?php require_once __DIR__ . "/../partials/alert.php"; ?>
		<div style="margin-top:100px" class="row">
	        <div class="bio-row">
	            <p><span><b>Published In </b></span>
	                <?php echo date_format(date_create($news['created_at']),"F j, Y")?>
	            </p>
	        </div>
	        <div class="bio-row">
	            <p><span><b>Category</b></span>
	                <?php echo $news['name']?>
	            </p>
	        </div>
	        <div class="bio-row">
	            <p><span><b>Published By</b></span>
	                <?php echo $news['username']?>
	            </p>
	        </div>

      	</div>
      	<div>
      		<?php if(!empty($comments[0]['comment_count'])) {?>
		  		<iframe style="border: 1px solid silver; padding: 10px;" class="br-25" height="330" width="750" 
		  				src="/view/comments.php?news=<?php echo $news_id?>">
		  			
		  		</iframe>
		  	<?php } else {?>
	      		<figure class="text-center">
				  <blockquote class="blockquote">
				    <!-- <h3>News In The Air</h3> -->
				  </blockquote>
				  <figcaption class="blockquote-footer">
				    <cite title="No Comments Yet">No Comments Yet</cite>
				  </figcaption>
				</figure>
			<?php }?>
      		<form method="POST" action="">
	      		<div class="form-group mt-3">
	              <!-- <label>Comment here</label> -->
	              <textarea <?php echo $readonly?>  placeholder="<?php echo $placeholder?>" required class="form-control" 
	              			name="comment" rows="5" cols="40"></textarea>
	            </div>

        		<button <?php echo $disabled?> 
        				style="float:right;<?php echo $pointer?>" 
        				type="submit" name="submit" title="<?php echo $title?>" class="btn btn-primary mt-3"> 
        			Comment 
        		</button>
        	</form>
      	</div>
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>