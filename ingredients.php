<?php 
	include 'connection.php';

	//delete product
	if (isset($_GET['delete'])) {
		$delete_id = $_GET['delete'];
		$delete_query = mysqli_query($conn, "DELETE FROM `ingredients` WHERE id=$delete_id") or die('query failed');
		if ($delete_query) {
			$messge[]='product deleted sucessfully';
			
		}else{
			$messge[]='product did not deleted sucessfully';
		}
	}

	//update product
	if (isset($_POST['update_ingredients'])) {
		$update_p_name = $_POST['update_name'];
		$update_p_price = $_POST['update_price'];
		$update_p_img = $_FILES['update_image']['name'];
		$update_p_img_tmp_name = $_FILES['update_image']['tmp_name'];
		$update_p_folder = 'image/'.$update_p_img;

		$update_query = mysqli_query($conn, "UPDATE `products` SET id='$update_p_id', name='$update_p_name', price='$update_p_price', image='$update_p_img' WHERE id = '$update_p_id'") or die('query failed');
		if ($update_query) {
			move_uploaded_file($update_p_img_tmp_name,$update_p_folder);
			$messge[]='product has been updated sucessfully';
			header('location:admin.php');
		}else{
			$messge[]='product could not updated sucessfully';
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
	<title>admin</title>
</head>
<body>
	<?php include 'headerAdmin.php'; ?>
	<?php 
		if (isset($message)) {
			foreach ($message as $message) {
				echo '
					<div class="message">
						<span>'.$messge.'<i class="bi bi-x" onclick="this.parentElement.style.display=`none`"></i></span>
					</div>
				';
			}
		}
	?>
	<a href="ingredients_form.php" class="add">+</a>
	<section class="show-product">
		<table>
			<thead>
				
				<th>ชื่อวัตถุดิบ</th>
				<th>จำนวนวัตถุดิบที่หลือ</th>
				<th>เพิ่ม/ลบ ข้อมูลวัตถุดิบ</th>
			</thead>
			<tbody>
				<?php 
					$select_products = mysqli_query($conn, "SELECT * FROM `ingredients`") or die('query failed');
					if (mysqli_num_rows($select_products) > 0) {
						while ($row = mysqli_fetch_assoc($select_products)) {
							
						
				?>
				<tr>
					<td><?php echo $row['name_ingredients']; ?></td>
					<td><?php echo $row['quantity_quantity']; ?> บาท</td>
					<td>
						<a href="updateproduct.php?delete=<?php echo $row['id']; ?>" class="delete-btn"><i class="bi bi-trash" onclick="return confirm('are you sure you want to delete this item')"></i>ลบ</a>
						<a href="updateproduct.php?edit=<?php echo $row['id']; ?>" class="option-btn"><i class="bi bi-pencil"></i>อัพเดท</a>
					</td>
				</tr>
				<?php 
						}
					}
				?>
			</tbody>
		</table>
	</section>
	<section class="edit-form">
		<?php 
			if (isset($_GET['edit'])) {
				$edit_id = $_GET['edit'];
				$edit_query = mysqli_query($conn, "SELECT * FROM `ingredients` WHERE id=$edit_id") or die('query failed');
				if (mysqli_num_rows($edit_query) > 0) {
					while($fetch_edit = mysqli_fetch_assoc($edit_query)){


		?>
		<form method="post" enctype="multipart/form-data">
			<h3>อัพเดทวัตถุดิบ</h3>
			<input type="text" name="update_name" value="<?php echo $fetch_edit['name_ingredients']; ?>" required>
			<input type="number" name="update_price" min="0" value="<?php echo $fetch_edit['quantity_quantity']; ?>" required>
			<input type="submit" name="update_ingredients" value="อัพเดทวัตถุดิบ" class="btn update">
			<input type="reset" value="ยกเลิก" class="btn cancle" id="close-edit">
		</form>
		<?php 
					}
				}
				echo "<script>document.querySelector('.edit-form').style.display = 'block'</script>";
			}
		?>
	</section>
	
	<script type="text/javascript">
		const closeBtn = document.querySelector('#close-edit');

		closeBtn.addEventListener('click',()=>{
			document.querySelector('.edit-form').style.display = 'none'
		})

	</script>
</body>
</html>