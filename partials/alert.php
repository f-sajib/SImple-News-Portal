<?php if(defined('alert_error')) { ?>
	<div class="center alert-danger alert alert-dismissible fade show" role="alert">
	    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	    <strong>Error!</strong> <?php echo alert_error?>
	</div>
<?php } ?>

<?php if(defined('alert_success')) { ?>
	<div class="center alert-success alert alert-dismissible fade show" role="alert">
	    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	    <strong>Success!</strong> <?php echo alert_success?>
	</div>
<?php } ?>

<?php if(defined('alert_warning')) { ?>
	<div class="center alert-warning alert alert-dismissible fade show" role="alert">
	    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	    <strong>Success!</strong> <?php echo alert_warning?>
	</div>
<?php } ?>