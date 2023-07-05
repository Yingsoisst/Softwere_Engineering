<?php 
	include 'connection.php';

	if (isset($_POST['update_btn'])) {
		$update_value = $_POST['update_quantity'];
		$update_id = $_POST['update_quantity_id'];

		$update_query = mysqli_query($conn, "UPDATE `cart` SET quantity='$update_value' WHERE id='$update_id'") or die('query failed');
		if ($update_query) {
			header('location:cart.php');
		}
	// if(isset($_POST['order'])) {
	// 	$name_menu = $_POST['menu_name'];
	// 	$price_menu = $_POST['menu_price'];
	// 	$quantity = $_POST['update_quantity'];
	// 	$addtoorder = "INSERT INTO `orders`(`menu_name`,`menu_price`,`menu_quantity`)
	// 					VALUES ('$name_menu','$price_menu','$quantity')";
		
	// 	$result2= mysqli_query($conn,$addtoorder);
	// }


	if (isset($_GET['remove'])) {
		$remove_id = $_GET['remove'];
		mysqli_query($conn, "DELETE FROM `cart` WHERE id='$remove_id'");
		header('location:cart.php');
	}

	if (isset($_GET['remove'])) {
		$remove_id = $_GET['remove'];
		mysqli_query($conn, "DELETE FROM `cart` WHERE id='$remove_id'");
		header('location:cart.php');
	}
	if (isset($_GET['delete_all'])) {
		
		mysqli_query($conn, "DELETE FROM `cart`");
		header('location:cart.php');
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
	<title>add products</title>
</head>
<body>
	<?php include 'headerC.php'; ?>
	<div class="cart-container">
		<h1>shopping cart</h1>
		<table>
			<thead>
				<th>รูปภาพ</th>
				<th>ชื่ออาหาร</th>
				<th>ราคา</th>
				<th>จำนวน</th>
				<th>ราคารวม</th>
				<th>action</th>
			</thead>
			<tbody>
				<?php 
					$select_cart = mysqli_query($conn, "SELECT * FROM `cart`");
					$grand_total=0;
					if (mysqli_num_rows($select_cart)>0) {
						while($fetch_cart=mysqli_fetch_assoc($select_cart)){


				?>
				<tr>
					<td><img src="image/<?php echo $fetch_cart['menu_image']; ?>"></td>
					<td><?php echo $fetch_cart['menu_name']; ?></td>
					<td><?php echo $fetch_cart['menu_price']; ?>  บาท/-</td>
					<td class="menu_quantity">
						<form method="post">
							
							<input type="number" min="1" name="update_quantity" value="<?php echo $fetch_cart['menu_quantity']; ?>">
							
						</form>
					</td>
					<td><?php echo $sub_total = $fetch_cart['menu_price'] * $fetch_cart['menu_quantity']; ?>  บาท</td>
					<td><a href="cart.php?remove=<?php echo $fetch_cart['cart_id']; ?>" onclick="return confirm('remove item from cart');" class="delete-btn">ลบ</a></td>
				</tr>
				<?php 
					$grand_total+=$sub_total;
						}
					}
				?>
				<tr class="table-bottom">
					<td><a href="waitorder.php" name="order" class="option-btn">สั่ง</a></td>
					<td colspan="3"><h1>ราคารวมทั้งหมด</h1></td>
					<td style="font-weight: bold;"><?php echo $grand_total; ?>  บาท</td>
					<td><a href="cart.php?delete_all" onclick="return confirm('are you sure you want to delete all item from cart');" class="delete-btn">ลบทั้งหมด</a></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>