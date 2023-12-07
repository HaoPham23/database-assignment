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


<!-- Code -->
<div class="content-wrapper">
	<!-- Add Content -->
	<!-- Content Header (Page header)-->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Danh sách Sinh viên</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="page=admin&controller=layouts&action=index">Home</a></li>
						<li class="breadcrumb-item active">Danh sách Sinh viên</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid-->
	</section>
	<!-- Main content-->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<!-- Button trigger modal-->
							<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#addStudentModal">Thêm mới</button>
							<!-- Modal-->
							<div class="modal fade" id="addStudentModal" tabindex="-1" role="dialog" aria-labelledby="addStudentModal" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Thêm mới</h5>
											<button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										</div>
										<form action="index.php?page=admin&controller=student&action=add" method="post">
											<div class="modal-body">
												<div class="form-group">
													<label>Tên sinh viên</label>
													<input class="form-control" type="text" placeholder="Tên sinh viên" name="name" />
												</div>
												<div class="form-group">
													<label>Trường</label>
													<input class="form-control" type="text" placeholder="Trường" name="address" />
												</div>
												<div class="form-group">
													<label>Tòa</label>
													<input class="form-control" type="text" placeholder="Tòa" name="updateAt" />
												</div>
												<div class="form-group">
													<label>Phòng</label>
													<input class="form-control" type="text" placeholder="Phòng" name="updateAt" />
												</div>
											</div>
											<div class="modal-footer">
												<button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng lại</button>
												<button class="btn btn-primary" type="submit">Thêm mới</button>
											</div>
										</form>
									</div>
								</div>
							</div>

							<table class="table table-bordered table-striped" id="tab-student">
								<thead>
									<tr class="text-center">
										<th><div>STT</div></th>
										<th><div>Họ và tên</div></th>
										<th><div>Trường</div></th>
										<th><div>Tòa</div></th>
										<th><div>Phòng</div></th>
										<th><div>Thao tác</div></th>
									</tr>
								</thead>
								<tbody>
									<?php
									foreach ($student as $student) {
										echo "<tr class='text-center'>";
										echo "<td id=\"student_id\">" . $student->id . "</td>";
										echo "<td id=\"student_name\">" . $student->name . "</td>";
										echo "<td id=\"student_address\">" . $student->address . "</td>";
										echo "<td id=\"student_building\">" . $student->updateAt . "</td>";
										echo "<td id=\"student_room\">" . $student->updateAt . "</td>";
										echo "<td>
											<btn class='btn-edit btn btn-primary btn-xs' style='margin-right: 5px' data-id=$student->id data-name='$student->name' data-address='$student->address'> <i class='fas fa-edit'></i></btn>
											<btn class='btn-delete btn btn-danger btn-xs' style='margin-right: 5px' data-id=$student->id> <i class='fas fa-trash'></i></btn>
											</td>";
										echo "</tr>";
									}
									?>
								</tbody>
							</table>

							<div class="modal fade" id="EditStudentModal" tabindex="-1" role="dialog" aria-labelledby="EditStudentModal" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Chỉnh sửa</h5>
											<button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										</div>
										<form action="index.php?page=admin&controller=student&action=edit" method="post">
											<div class="modal-body">
												<input type="hidden" name="id" />
												<div class="form-group">
													<input class="form-control" type="hidden" placeholder="Id" name="id" readonly />
												</div>
												<div class="form-group">
													<label>Trường</label>
													<input class="form-control" type="text" placeholder="Trường" name="address" />
												</div>
												<div class="form-group">
													<label>Tòa</label>
													<input class="form-control" type="text" placeholder="Tòa" name="updateAt" />
												</div>
												<div class="form-group">
													<label>Phòng</label>
													<input class="form-control" type="text" placeholder="Phòng" name="updateAt" />
												</div>
											</div>
											<div class="modal-footer">
												<button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng lại</button>
												<button class="btn btn-primary" type="submit">Cập nhật</button>
											</div>
										</form>
									</div>
								</div>
							</div>

							<div class="modal fade" id="DeleteStudentModal" tabindex="-1" role="dialog" aria-labelledby="DeleteStudentModal" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content bg-danger">
										<div class="modal-header">
											<h5 class="modal-title">Xóa</h5>
											<button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										</div>
										<form action="index.php?page=admin&controller=student&action=delete" method="post">
											<div class="modal-body">
												<input type="hidden" name="id" />
												<p>Bạn chắc chưa ?</p>
											</div>
											<div class="modal-footer">
												<button class="btn btn-danger btn-outline-light" type="button" data-dismiss="modal">Đóng lại</button>
												<button class="btn btn-danger btn-outline-light" type="submit">Xác nhận</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</section>
</div>


<?php
require_once('views/admin/footer.php'); ?>

<!-- Add Javascripts -->
<script src="public/js/student/index.js"></script>
</body>

</html>