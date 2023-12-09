<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
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
													<label>Số CCCD</label>
													<input class="form-control" type="text" placeholder="CCCD" name="CCCD_number" />
												</div>
												<div class="form-group">
													<label>Ngày cấp CCCD</label>
													<input class="form-control" type="date" placeholder="Họ và tên lót" name="CCCD_date" />
												</div>
												<div class="form-group">
													<label>Ảnh</label>
													<input class="form-control" type="text" placeholder="Đường link dẫn đến ảnh" name="Avatar" />
												</div>
												<div class="form-group">
													<label>Họ và tên lót sinh viên</label>
													<input class="form-control" type="text" placeholder="Họ và tên lót" name="Lname" />
												</div>
												<div class="form-group">
													<label>Tên sinh viên</label>
													<input class="form-control" type="text" placeholder="Tên" name="Fname" />
												</div>
												<div class="form-group">
													<label>Ngày sinh</label>
													<input class="form-control" type="date" placeholder="Ngày sinh" name="DOB" />
												</div>
												<div class="form-group">
													<label>Giới tính</label>
													<input class="form-control" type="text" placeholder="Giới tính" name="Sex" />
												</div>
												<div class="form-group">
													<label>Tôn giáo</label>
													<input class="form-control" type="text" placeholder="Tôn giáo" name="Religion" />
												</div>
												<div class="form-group">
													<label>Dân tộc</label>
													<input class="form-control" type="text" placeholder="Dân tộc" name="Ethnicity" />
												</div>
												<div class="form-group">
													<label>Email</label>
													<input class="form-control" type="text" placeholder="Email" name="Email" />
												</div>
												<div class="form-group">
													<label>Số điện thoại</label>
													<input class="form-control" type="text" placeholder="Số điện thoại" name="Phone" />
												</div>
												<div class="form-group">
													<label>Quê quán</label>
													<input class="form-control" type="text" placeholder="Quê quán" name="Address" />
												</div>
												<div class="form-group">
													<label>Tài khoản ngân hàng</label>
													<input class="form-control" type="text" placeholder="Tài khoản ngân hàng" name="Bank_name" />
												</div>
												<div class="form-group">
													<label>Số tài khoản</label>
													<input class="form-control" type="text" placeholder="Số tài khoản" name="Bank_number" />
												</div>
												<div  class="col-6"><label>Chọn phòng</label>
													<select class="form-control" type="text" name="Room_ID" <?php if(isset($_POST['Room_ID'])) echo "placeholder='".$_POST['Room_ID']."'" ?> required>
													<?php
														foreach ($rooms as $room) {
															echo "<option value=\"$room->Room_ID\">$room->Room_ID</option>";
														}
													?>
													</select>
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

							<table id="TAB-student" class="table table-bordered table-striped">
								<thead>
									<tr class="text-center">
										<th><div>STT</div></th>
										<th><div>CCCD</div></th>
										<th><div>Ngày cấp</div></th>
										<th><div>Ảnh</div></th>
										<th><div>Họ và tên lót</div></th>
										<th><div>Tên</div></th>
										<th><div>Ngày sinh</div></th>
										<th><div>Giới tính</div></th>
										<th><div>Tôn giáo</div></th>
										<th><div>Dân tộc</div></th>
										<th><div>Email</div></th>
										<th><div>Số điện thoại</div></th>
										<th><div>Quê quán</div></th>
										<th><div>Tài khoản ngân hàng</div></th>
										<th><div>Số tài khoản</div></th>
										<th><div>Trạng thái</div></th>
										<th><div>Thao tác</div></th>
									</tr>
								</thead>
								<tbody>
									<?php
									$index = 1;
									foreach ($students as $student) {
										echo 
											"<tr class=\"text-center\">
												<td>"
													.$index. 
												"</td>
												<td>
													".$student->CCCD_number."
												</td>
												<td>
													".$student->CCCD_date."
												</td> 
												<td>
												<img class=\"profile-picture\" src=\"".$student->Avatar."\" width=\"57\" height=\"72\">
												</td>  
												<td>
													".$student->Lname."
												</td> 
												<td>
													".$student->Fname."
												</td>
												<td>
													".$student->DOB."
												</td>
												<td>
													".(($student->Sex === 'M') ? 'Nam' : 'Nữ')."
												</td>   
												<td>
													".$student->Religion."
												</td> 
												<td>
													".$student->Ethnicity."
												</td>
												<td>
													".$student->Email."
												</td>   
												<td>
													".$student->Phone."
												</td> 
												<td>
													".$student->Address."
												</td>
												<td>
													".$student->Bank_name."
												</td>    
												<td>
													".$student->Bank_number."
												</td>    
												<td>
													".$student->Status."
												</td>    
										<td>
											<btn class='btn-edit btn btn-primary btn-xs' style='margin-right: 5px' data-id=$student->CCCD_number> <i class='fas fa-edit'></i></btn>
											<btn class='btn-delete btn btn-danger btn-xs' style='margin-right: 5px' data-id=$student->CCCD_number> <i class='fas fa-trash'></i></btn>
										</td>
										</tr>";
										$index++;
									}
									?>
								</tbody>

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
														<input class="form-control" type="text" placeholder="Tòa" name="name" />
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
							</table>
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