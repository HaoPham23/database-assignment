<?php
session_start();
if (!isset($_SESSION["user"])) {
	header("Location: index.php?page=admin&controller=login&action=index");
}
?>
<?php
require_once('views/admin/header.php'); ?>

<!-- Add CSS -->


<?php
require_once('views/admin/content_layouts.php'); ?>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-8">
					<h1>Chào mừng đến với khu vực của quản trị viên</h1>
				</div>
				<div class="col-sm-4">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="index.php?page=admin&controller=layouts&action=index">Home</a></li>
						<li class="breadcrumb-item active"></li>
					</ol>
				</div>
			</div>
		</div><!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="invoice p-3 mb-3">
				<div class="row invoice-info">
					<div class="col-sm-6 invoice-col">
						<ul style="list-style: none;">
							<?php
								if($_SESSION['init'] == 1){
									echo '
									<li>
										<a href="index.php?page=admin&controller=admin&action=index">
											<i class="fas fa-user-graduate"></i>
											Danh sách Admin
										</a>
									</li>
									
									';
								}
							?>
							
							<li>
								<a href="index.php?page=admin&controller=comments&action=index">
									<i class="fas fa-comments"></i>
									Bình luận - Đánh giá
								</a>
							</li>
							<li>
								<a href="index.php?page=admin&controller=user&action=index" > 
									<i class="fas fa-users-cog"></i>
									Liên hệ khách hàng
								</a>
							</li>
						</ul>
					</div>
					<!-- /.col -->
					<div class="col-sm-6 invoice-col">
						<ul style="list-style: none;">
							<li>
								<a href="index.php?page=admin&controller=admin&action=index">
									<i class="fas fa-cube"></i>
									Quản lý Sản phẩm
								</a>
							</li>
							
							<li>
								<a href="index.php?page=admin&controller=admin&action=index">
									<i class="fas fa-file"></i>
									Quản lý tin tức
								</a>
							</li>
							<li>
								<a href="index.php?page=admin&controller=user&action=index" > 
									<i class="fas fa-newspaper"></i>
									Danh sách chi nhánh
								</a>
							</li>
						</ul>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			
		</div><!-- /.container-fluid -->
	</section>
	<!-- /.content -->
</div>
<?php
require_once('views/admin/footer.php'); ?>

<!-- Add Javascripts -->


</body>

</html>