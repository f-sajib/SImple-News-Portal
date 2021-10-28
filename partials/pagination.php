<?php 

if (isset($_GET['page_no']) && $_GET['page_no']!="") {
    $page_no = $_GET['page_no'];
} else {
    $page_no = 1;
}

$total_records_per_page = 6;

$offset = ($page_no-1) * $total_records_per_page;
$previous_page = $page_no - 1;
$next_page = $page_no + 1;
$adjacents = "2";

$result = mysqli_query($conn,"SELECT COUNT(*) As total_records FROM {$table_name}");
$result_count = $result->fetch_all(MYSQLI_ASSOC)[0]['total_records'];
$total_no_of_pages = ceil($result_count / $total_records_per_page);
$second_last = $total_no_of_pages - 1;
?>