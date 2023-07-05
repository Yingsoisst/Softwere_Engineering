<?php 
	include 'connection.php';


?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="style.css">
	<title>wait order</title>
</head>
<body>
<?php include 'headerO.php'; ?>
	<div class="cart-container">
		<h1>รายการที่สั่ง</h1>
		<table>
			<thead>
				<th>รูป</th>
				<th>ชื่ออาหาร</th>
				<th>ราคา</th>
				<th>จำนวน</th>
				<th>ราคารวม</th>
	
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
					<td class="quantity">
						<?php echo $fetch_cart['menu_quantity']; ?>
					</td>
					<td><?php echo $sub_total = $fetch_cart['menu_price'] * $fetch_cart['menu_quantity']; ?>  บาท</td>
					
				</tr>
				<?php 
					$grand_total+=$sub_total;
						}
					}
				?>
				<tr class="table-bottom">

					<td colspan="3"><h1>ราคารวมทั้งหมด</h1></td>
					<td style="font-weight: bold;"><?php echo $grand_total; ?>  บาท</td>

				</tr>
			</tbody>
		</table>

	</div>
</body>
</html>