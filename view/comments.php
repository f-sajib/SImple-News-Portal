<?php

require __DIR__ . "/../config.php";
$news_id = $_GET["news"];

$query = "SELECT *, users.username FROM comments JOIN users ON comments.user_id = users.id WHERE news_id={$news_id}";
$data = $conn->query($query);
$comments = $data->fetch_all(MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/public/style.css">
</head>
<body>
	  <div style="width:100%" class="row">
	  	<?php foreach ($comments as $comment): ?>
	  		<div class="col-md-12">
		      	<b><?php echo $comment['username'];?></b>
		      	<p><?php echo $comment['comment'];?></p>
		      	<figcaption style="float:right;" class="blockquote-footer">
				    <cite title="Coming Soon"><?php echo date_format(date_create($comment['created_at']),"M j, Y")?></cite>
				 </figcaption>
		    </div>	
	  	<?php endforeach ?>
	    
	  </div>
</body>
</html>