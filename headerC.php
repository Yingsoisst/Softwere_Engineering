<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
	<header>
		<div class="flex">
			<a href="Menu.php" class="logo">@LastSteak</a>

			<?php 
				$select_rows = mysqli_query($conn, "SELECT * FROM `cart`") or die('query failed');
				$row_count = mysqli_num_rows($select_rows);
			?>
			<a href="waitorder.php">My order</a>
			<a href="cart.php" class="cart"><i class="bi bi-cart-check-fill"></i><span><?php echo $row_count; ?></span></a>
		</div>
	</header>
</body>
</html>