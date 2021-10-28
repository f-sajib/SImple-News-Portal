<ul class="pagination" style="float: right;margin-top: -30px;margin-right: 80px;">
	<?php if($page_no > 1){
	echo "<li class='page-item'>
			<a class='page-link' href='?page_no=1'>
				First Page
			</a>
		</li>";
	} ?>
	    
	<li class="page-item <?php if($page_no <= 1){ echo "disabled"; } ?>">
		<a class="page-link" 
			<?php if($page_no > 1){
			echo "href='?page_no=$previous_page'";
			} ?>> <<
		</a>
	</li>
	    
	<li class="page-item <?php if($page_no >= $total_no_of_pages){ echo "disabled";} ?>">
		<a class="page-link" 
			<?php if($page_no < $total_no_of_pages) {
			echo "href='?page_no=$next_page'";
			} ?>> >>
		</a>
	</li>

	<?php if($page_no < $total_no_of_pages){
	echo "<li class='page-item'>
			<a class='page-link' href='?page_no=$total_no_of_pages'>
				Last
			</a>
		</li>";
	} ?>
</ul>