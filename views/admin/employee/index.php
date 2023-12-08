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
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Danh sách nhân viên</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="page=admin&controller=layouts&action=index">Home</a></li>
                        <li class="breadcrumb-item active">Danh sách nhân viên</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid-->
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                        <button class="btn btn-secondary" type="button" id="showContent1">Toàn bộ nhân viên</button>
                        <button class="btn btn-info ml-2" type="button" id="showContent2">Các Nhân viên thường</button>
                        <button class="btn btn-primary mt-3" id="addManagerButton" type="button" data-toggle="modal" data-target="#addManagerModal">Thêm Quản lý tòa mới</button>
                        <div class="modal fade" id="addManagerModal"  aria-labelledby="addManagerModal" aria-hidden="true">
                            <div class="modal-dialog modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Thêm Quản lý tòa mới</h5><button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="form-add-student" action="index.php?page=admin&controller=employee&action=add" enctype="multipart/form-data" method="post">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div  class="col-6"><label>Tên tòa nhà</label><input class="form-control" type="text" placeholder="Tên tòa nhà" name="name" /></div>
                                                
                                            </div>
                                            
                                            <div class="form-group"> <label>Mô tả</label> <textarea class="form-control" name="description" rows="5"></textarea></div>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                                        <button class="btn btn-primary" type="submit">Thêm mới</button>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <button class="btn btn-primary mt-3" id="addStaffButton" type="button" data-toggle="modal" data-target="#addStaffModal">Thêm nhân viên mới</button>
                        <div class="modal fade" id="addStaffModal"  aria-labelledby="addStaffModal" aria-hidden="true">
                            <div class="modal-dialog modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Thêm nhân viên mới</h5><button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="form-add-student" action="index.php?page=admin&controller=employee&action=add" enctype="multipart/form-data" method="post">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div  class="col-6"><label>Tên phòng</label><input class="form-control" type="text" placeholder="Tên phòng" name="name" /></div>
                                                
                                            </div>
                                            
                                            <div class="form-group"> <label>Mô tả</label> <textarea class="form-control" name="description" rows="5"></textarea></div>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                                        <button class="btn btn-primary" type="submit">Thêm mới</button>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div id="content1" class="mt-3">
                        <div class="row"></div>
                                <table id="TAB-employee" class="table table-bordered table-striped"> 
                                    <thead>
                                        <tr  class="text-center">
                                            <th scope="col">STT</th>
                                            <th scope="col">...</th>
                                            <th scope="col">...</th>
                                            <th scope="col">...</th>
                                            <th scope="col">...</th>
                                            <th scope="col">...</th>
                                            <th scope="col">...</th>
                                            <th scope="col">...</th>
                                            <th scope="col">...</th>
                                            <th scope="col">...</th>
                                            <th scope="col">...</th>
                                            <th scope="col">...</th>
                                            <th scope="col">...</th>
                                        </tr>
                                    </thead>
                                    <tbody> 
                                        <?php
                                            
                                            $index = 1;
                                            foreach ($employees as $employee) {
                                                echo 
                                                "<tr class=\"text-center\">
                                                    <td>"
                                                        .$index. 
                                                    "</td>
                                                    <td>
                                                        ".$employee->CCCD_number."
                                                    </td>
                                                    <td>
                                                        ".$employee->CCCD_date."
                                                    </td>   
                                                    <td>
                                                        ".$employee->Fname."
                                                    </td> 
                                                    <td>
                                                        ".$employee->Lname."
                                                    </td>
                                                    <td>
                                                        ".$employee->DOB."
                                                    </td>
                                                    <td>
                                                        ".$employee->Sex."
                                                    </td>   
                                                    <td>
                                                        ".$employee->Religion."
                                                    </td> 
                                                    <td>
                                                        ".$employee->Ethnicity."
                                                    </td>
                                                    <td>
                                                        ".$employee->Email."
                                                    </td>   
                                                    <td>
                                                        ".$employee->Phone."
                                                    </td> 
                                                    <td>
                                                        ".$employee->Address."
                                                    </td>
                                                    <td>
                                                        ".$employee->Bname."
                                                    </td>    
                                                    <td>
                                                    <button class=\"btn-edit btn btn-primary btn-xs\" style=\"margin-right: 5px;\" data-id=''> <i style=\"font-size:17px;\" class=\"fas fa-edit\" ></i></button>
                                                    <button class=\"btn-delete btn btn-danger btn-xs\" style=\"margin-right: 5px\" data-id='' ><i style=\"font-size:17px;\" class=\"fas fa-trash\"></i></button> 
                                                </td>                                                                                                                                                                    
                                                </tr>";
                                                $index++;
                                            }
                                        ?>
                                    </tbody>
                                    <div class="modal fade" id="EditStudentModal" tabindex="-1" role="dialog" aria-labelledby="EditStudentModal" aria-hidden="true">
                                        <div class="modal-dialog modal-xl" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Chỉnh sửa</h5><button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                </div>
                                                <form id="form-edit-student" action="index.php?page=admin&controller=employee&action=edit" enctype="multipart/form-data" method="post">
                                                    <div class="modal-body">
                                                         <div  class="col-12"><input class="form-control" type="hidden" placeholder="Name" name="id"  readonly/></div>
                                                        <div class="row">
                                                            <div  class="col-6"><label>Tên sản phẩm</label><input class="form-control" type="text" placeholder="Tên sản phẩm" name="name" /></div>
                                                            
                                                        </div>
                                                        
                                                        <div class="form-group"> <label>Mô tả</label> <textarea class="form-control" name="description" rows="5"></textarea></div>
                                                        <div class="form-group"> <label>Nội dung</label> <textarea class="form-control" name="content" rows="10"></textarea></div>
                                                        
                                                        <div class="form-group"> <label> Hình ảnh </label>&nbsp <input type="file" name="fileToUpload" id="fileToUpload" /></div>

                                                    </div>
                                                    <div class="modal-footer"><button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button><button class="btn btn-primary formedit" type="submit">Cập nhật</button></div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal fade" id="DeleteStudentModal" tabindex="-1" role="dialog" aria-labelledby="DeleteStudentModal" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content bg-danger">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Xóa</h5><button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                </div>
                                                <form action="index.php?page=admin&controller=employee&action=delete" method="post">
                                                    <div class="modal-body"><input type="hidden" name="id" />
                                                        <p>Bạn có chắc chắn muốn xóa sản phẩm này?</p>
                                                    </div>
                                                    <div class="modal-footer"><button class="btn btn-danger btn-outline-light" type="button" data-dismiss="modal">Đóng</button><button class="btn btn-danger btn-outline-light" type="submit">Xóa</button></div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </table>
                            </div>
                        </div>

                        <div id="content2" class="mt-3" style="display: none;">
                            <p>This is content for Button 2.</p>
                        </div>

    <!-- Rest of your code... -->
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
<script src="public/js/employee/index.js"></script>
<script>
    document.getElementById('showContent1').addEventListener('click', function () {
        document.getElementById('content1').style.display = 'block';
        document.getElementById('content2').style.display = 'none';
        document.getElementById('addManagerButton').style.display = 'block';
        document.getElementById('addStaffButton').style.display = 'none';
    });

    document.getElementById('showContent2').addEventListener('click', function () {
        document.getElementById('content1').style.display = 'none';
        document.getElementById('content2').style.display = 'block';
        document.getElementById('addManagerButton').style.display = 'none';
        document.getElementById('addStaffButton').style.display = 'block';
    });

    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('addManagerButton').style.display = 'none';
        document.getElementById('addStaffButton').style.display = 'none';
        document.getElementById('content1').style.display = 'none';
        document.getElementById('content2').style.display = 'none';
    });
</script>


</body>

</html>