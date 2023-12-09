<?php
require_once('controllers/admin/base_controller.php');
require_once('models/student.php');
require_once('models/room.php');

class StudentController extends BaseController
{
	function __construct()
	{
		$this->folder = 'student';
	}

	public function index()
	{
		$students = Student::getAll();
		$rooms = Room::getAll();
		$data = array('students' => $students, "rooms" => $rooms);
		$this->render('index', $data);
	}

	public function add()
	{
		$CCCD_number = $_POST['CCCD_number'];
		$CCCD_date = $_POST['CCCD_date'];
		$Fname = $_POST['Fname'];
		$Lname = $_POST['Lname'];
		$DOB = $_POST['DOB'];
		$Sex = $_POST['Sex'];
		$Religion = $_POST['Religion'];
		$Ethnicity = $_POST['Ethnicity'];
		$Phone = $_POST['Phone'];
		$Email = $_POST['Email'];
		$Avatar = $_POST['Avatar'];
		$Bank_name = $_POST['Bank_name'];
		$Bank_number = $_POST['Bank_number'];
		$Address = $_POST['Address'];
		$Status = 'Đang ở';
		$Room_ID = $_POST['Room_ID'];
		$add_new = Student::insert($CCCD_number, $CCCD_date, $Fname, $Lname, $DOB, $Sex, $Religion, 
			$Ethnicity, $Phone, $Email, $Avatar, $Bank_name, $Bank_number, $Address, $Status, $Room_ID);
		header('Location: index.php?page=admin&controller=student&action=index');
	}

	public function edit()
	{
		$id = $_POST['id'];
		$name = $_POST['name'];
		$address = $_POST['address'];
		$change_pass = Student::update($id, $name, $address);
		header('Location: index.php?page=admin&controller=student&action=index');
	}

	public function delete()
	{
		$id = $_POST['id'];
		$delete_user = Student::delete($id);
		header('Location: index.php?page=admin&controller=student&action=index');
	}
}