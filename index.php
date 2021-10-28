<?php
require_once('partials/navbar.php');
include('config.php');

$news_query = "SELECT news.*, categories.name FROM news JOIN test.categories ON news.category_id = categories.id ORDER BY RAND()";
$news_data = $conn->query($news_query);
$news = $news_data->fetch_all(MYSQLI_ASSOC);

$category_query = "SELECT id,name FROM categories";
$category_data = $conn->query($category_query);
$categories = $category_data->fetch_all(MYSQLI_ASSOC);


if ($_SERVER['REQUEST_METHOD'] === 'POST') {

   $search = $_POST['search'];
   $search_cat = $_POST['search_cat'];

   
   if ($search_cat && $search){
   		$search_query = "SELECT news.*, categories.name FROM news JOIN test.categories ON news.category_id = categories.id
   					WHERE news.category_id = '$search_cat' AND (news.title LIKE '%$search%' OR news.details LIKE '%$search%') 
   					ORDER BY RAND()";
   } elseif ($search_cat) {
   	  $search_query = "SELECT news.*, categories.name FROM news JOIN test.categories ON news.category_id = categories.id
   					WHERE news.category_id = '$search_cat' ORDER BY RAND()";
   } elseif ($search) {
   	  $search_query = "SELECT news.*, categories.name FROM news JOIN test.categories ON news.category_id = categories.id
   					WHERE news.title LIKE '%$search%' OR news.details LIKE '%$search%' ORDER BY RAND()";
   } else {
   	  $search_query = "SELECT news.*, categories.name FROM news JOIN test.categories ON news.category_id = categories.id 
   	  					ORDER BY RAND()";
   }
   $search_data = $conn->query($search_query);
   $news = $search_data->fetch_all(MYSQLI_ASSOC);

}

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>News Portal</title>
</head>
<body>
	<form method="POST" action="">
		<div class="input-group center">
		  <input placeholder="Search here..." type="text" name="search" class="form-control">
		  <div class="input-group-append">
		    <select class="form-control" name="search_cat">                      
			    <option value="">Select a category </option>
			    <?php 
			      foreach ($categories as $category) {
			        echo '<option value="'; echo $category['id'];echo '">';
			        echo $category['name'];
			        echo '</option>';
			      }
			    ?>
			  </select>
		  </div>
		  <div class="input-group-append">
		    <button class="btn btn-primary form-control" style="height:37px; width: 100px;" type="submit" name="confirm"><i class="fas fa-search"></i></button>
		  </div>
		</div>
	</form>
	<?php if($news) {?>
	<div class="container">
	  <div class="row">
	  	<?php foreach ($news as $value) {?>
	  	
		    <div class="col">
		      	<div class="card br-25 mt-3 shadow-lg p-3 bg-body" style="width: 18rem;">
				  <img height="150" width="300" src="/public/img/news/<?php echo $value['image'];?>" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title"><?php echo $value['title'] ?></h5>
				    <p class="card-text hide-text-1"><?php echo $value['details']?></p>
				    <a style="text-decoration: none;" target="_blank" href="/view/singleNews.php?news=<?php echo $value['id'] ?>">
				    	<b class="zoom">Keep Reading  <i class="fas fa-arrow-circle-right"></i></b> 
				    </a>
				    <small style="float:right;opacity: 0.7;"><?php echo $value['name']?></small>
				  </div>
				</div>
		    </div>

	    <?php } ?>
	  </div>
	</div>
	<?php } else {?>
		<figure class="text-center">
		  <blockquote class="blockquote">
		    <h3>News In The Air</h3>
		  </blockquote>
		  <figcaption class="blockquote-footer">
		    <cite title="Coming Soon">Coming Soon</cite>
		  </figcaption>
		</figure>
	<?php }?>

</body>
</html>