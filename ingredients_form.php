<?php 
	include 'connection.php';

	if (isset($_POST['add_product'])) {
		$name = $_POST['p_name'];
		$price = $_POST['p_price'];
		$p_image = $_FILES['p_image']['name'];
		$p_image_temp_name = $_FILES['p_image']['tmp_name'];
		$p_image_folder = 'image/'.$p_image;

		$query = "INSERT INTO `products`(`name`, `price`,`image`) VALUES ('$name', '$price', '$p_image')";
		$insert_query = mysqli_query($conn, $query);

		if ($insert_query) {
			move_uploaded_file($p_image_temp_name, $p_image_folder);
			$message[] = 'product added sucessfully';
			header('location:admin.php');
		}else{
			$message[] = 'product did not added sucessfully';
		}
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="style.css">
	<title>add ingredients</title>
</head>
<body>
	<?php include 'headerAdmin.php'; ?>
	<div class="form">
		<form method="post" enctype="multipart/form-data">
			<h3>เพิ่มวัตถุดิบใหม่</h3>
			<input type="text" name="in_name" placeholder="ชื่อวัตถุดิบ" required>
			<input type="number" name="in_qu" min="" placeholder="จำนวนวัตถุดิบ" required>
			<input type="submit" name="add_product" value="เพิ่มวัตถุดิบ" class="btn">
		</form>
	</div>
</body>
</html>