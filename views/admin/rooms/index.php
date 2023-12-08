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
                    <h1>Khu/Nhà/Phòng</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="page=admin&controller=layouts&action=index">Home</a></li>
                        <li class="breadcrumb-item active">Khu/Nhà/Phòng</li>
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
                        <button class="btn btn-secondary" type="button" id="showContent1">Các tòa nhà</button>
                        <button class="btn btn-info ml-2" type="button" id="showContent2">Các phòng</button>
                        <button class="btn btn-primary mt-3" id="addBuildingButton" type="button" data-toggle="modal" data-target="#addBuildingModal">Thêm tòa nhà mới</button>
                        <div class="modal fade" id="addBuildingModal"  aria-labelledby="addBuildingModal" aria-hidden="true">
                            <div class="modal-dialog modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Thêm tòa nhà mới</h5><button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="form-add-building" action="index.php?page=admin&controller=rooms&action=add" enctype="multipart/form-data" method="post">
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

                        <button class="btn btn-primary mt-3" id="addRoomButton" type="button" data-toggle="modal" data-target="#addRoomModal">Thêm phòng mới</button>
                        <div class="modal fade" id="addRoomModal"  aria-labelledby="addRoomModal" aria-hidden="true">
                            <div class="modal-dialog modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Thêm phòng mới</h5><button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="form-add-room" action="index.php?page=admin&controller=rooms&action=add" enctype="multipart/form-data" method="post">
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

                        <div id="content2" class="mt-3">
                        <div class="row"></div>
                                <table id="TAB-room" class="table table-bordered table-striped"> 
                                    <thead>
                                        <tr  class="text-center">
                                            <th scope="col">STT</th>
                                            <th scope="col">Tên phòng</th>
                                            <th scope="col">Trạng thái</th>
                                            <th scope="col">Tòa nhà</th>
                                            <th scope="col">Loại phòng</th>
                                            <th scope="col">Trưởng phòng</th>
                                            <th scope="col">Họ và tên lót trưởng phòng</th>
                                            <th scope="col">Tên trưởng phòng</th>
                                            <th scope="col">Thao tác</th>
                                        </tr>
                                    </thead>
                                   
                                    <tbody> 
                                        <?php
                                            
                                            $index = 1;

                                            foreach ($rooms as $room) {  
                                                                                         
                                                echo 
                                                "<tr class=\"text-center\">
                                                    <td>"
                                                        .$index. 
                                                    "</td>
                                                    <td>
                                                        ".$room->Room_ID."
                                                    </td>
                                                    <td>
                                                        ".$room->Status."
                                                    </td>   
                                                    <td>
                                                        ".$room->Bname."
                                                    </td> 
                                                    <td>
                                                        ".$room->Room_type_ID."
                                                    </td>
                                                    <td>
                                                        ".$room->Leader_ID."
                                                    </td>
                                                    <td>
                                                        ".$room->Leader_Lname."
                                                    </td>
                                                    <td>
                                                        ".$room->Leader_Fname."
                                                    </td>
                                                    <td>
                                                        <button class=\"btn-edit btn btn-primary btn-xs\" style=\"margin-right: 5px;\" data-id='$room->Room_ID'> <i style=\"font-size:17px;\" class=\"fas fa-edit\" ></i></button>
                                                        <button class=\"btn-delete btn btn-danger btn-xs\" style=\"margin-right: 5px\" data-id='$room->Room_ID'> <i style=\"font-size:17px;\" class=\"fas fa-trash\"></i></button> 
                                                    </td>                                                                                                                                                                                      
                                                </tr>";
                                                $index++;
                                            }
                                        ?>
                                    </tbody>
                                    <div class="modal fade" id="EditRoomModal" tabindex="-1" role="dialog" aria-labelledby="EditRoomModal" aria-hidden="true">
                                        <div class="modal-dialog modal-xl" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Chỉnh sửa</h5><button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                </div>
                                                <form id="form-edit-oom" action="index.php?page=admin&controller=rooms&action=edit" enctype="multipart/form-data" method="post">
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
                                    <div class="modal fade" id="DeleteRoomModal" tabindex="-1" role="dialog" aria-labelledby="DeleteRoomModal" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content bg-danger">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Xóa</h5><button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                </div>
                                                <form action="index.php?page=admin&controller=rooms&action=delete" method="post">
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

                        <div id="content1" class="mt-3">
                        <div class="row"></div>
                                <table id="TAB-building" class="table table-bordered table-striped"> 
                                    <thead>
                                        <tr  class="text-center">
                                            <th scope="col">STT</th>
                                            <th scope="col">Tên tòa nhà</th>
                                            <th scope="col">Trạng thái</th>
                                            <th scope="col">Quản lý tòa</th>
                                            <th scope="col">Họ và tên lót quản lý tòa</th>
                                            <th scope="col">Tên quản lý tòa</th>
                                            <th scope="col">Thao tác</th>
                                        </tr>
                                    </thead>
                                   
                                    <tbody> 
                                        <?php
                                            
                                            $index = 1;

                                            foreach ($buildings as $building) {  
                                                                                         
                                                echo 
                                                "<tr class=\"text-center\">
                                                    <td>"
                                                        .$index. 
                                                    "</td>
                                                    <td>
                                                        ".$building->Name."
                                                    </td>
                                                    <td>
                                                        ".$building->Status."
                                                    </td>   
                                                    <td>
                                                        ".$building->Mgr_ID."
                                                    </td>
                                                    <td>
                                                        ".$building->Mgr_Lname."
                                                    </td>
                                                    <td>
                                                        ".$building->Mgr_Fname."
                                                    </td>
                                                    <td>
                                                        <button class=\"btn-edit btn btn-primary btn-xs\" style=\"margin-right: 5px;\" data-id='$building->Name'> <i style=\"font-size:17px;\" class=\"fas fa-edit\" ></i></button>
                                                        <button class=\"btn-delete btn btn-danger btn-xs\" style=\"margin-right: 5px\" data-id='$building->Name'> <i style=\"font-size:17px;\" class=\"fas fa-trash\"></i></button> 
                                                    </td>                                                                                                                                                                                      
                                                </tr>";
                                                $index++;
                                            }
                                        ?>
                                    </tbody>
                                    <div class="modal fade" id="EditBuildingModal" tabindex="-1" role="dialog" aria-labelledby="EditBuildingModal" aria-hidden="true">
                                        <div class="modal-dialog modal-xl" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Chỉnh sửa</h5><button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                </div>
                                                <form id="form-edit-building" action="index.php?page=admin&controller=rooms&action=edit" enctype="multipart/form-data" method="post">
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
                                    <div class="modal fade" id="DeleteBuildingModal" tabindex="-1" role="dialog" aria-labelledby="DeleteBuildingModal" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content bg-danger">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Xóa</h5><button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                </div>
                                                <form action="index.php?page=admin&controller=rooms&action=delete" method="post">
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
<script src="public/js/rooms/index.js"></script>
<script>
    document.getElementById('showContent1').addEventListener('click', function () {
        document.getElementById('content1').style.display = 'block';
        document.getElementById('content2').style.display = 'none';
        document.getElementById('addBuildingButton').style.display = 'block';
        document.getElementById('addRoomButton').style.display = 'none';
    });

    document.getElementById('showContent2').addEventListener('click', function () {
        document.getElementById('content1').style.display = 'none';
        document.getElementById('content2').style.display = 'block';
        document.getElementById('addBuildingButton').style.display = 'none';
        document.getElementById('addRoomButton').style.display = 'block';
    });

    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('addBuildingButton').style.display = 'none';
        document.getElementById('addRoomButton').style.display = 'none';
        document.getElementById('content1').style.display = 'none';
        document.getElementById('content2').style.display = 'none';
    });
</script>


</body>

</html>