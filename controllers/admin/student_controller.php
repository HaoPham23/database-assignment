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
		$CCCD_number = $_POST['id'];
		$CCCD_date = $_POST['cccddate'];
		$Fname = $_POST['fname'];
		$Lname = $_POST['lname'];
		$DOB = $_POST['dob'];
		$Sex = $_POST['sex'];
		$Religion = $_POST['religion'];
		$Ethnicity = $_POST['ethnicity'];
		$Phone = $_POST['phone'];
		$Email = $_POST['email'];
		$Avatar = $_POST['avatar'];
		$Bank_name = $_POST['bankname'];
		$Bank_number = $_POST['banknumber'];
		$Address = $_POST['address'];
		$Status = 'Dang o';
		$Room_ID = $_POST['Room_ID'];
		$edit_student = Student::update($CCCD_number, $CCCD_date, $Fname, $Lname, $DOB, $Sex, $Religion, $Ethnicity, $Phone, $Email, $Avatar, $Bank_name, $Bank_number, $Address, $Status, $Room_ID);
		header('Location: index.php?page=admin&controller=student&action=index');
	}

	public function delete()
	{
		$id = $_POST['id'];
		$delete_user = Student::delete($id);
		header('Location: index.php?page=admin&controller=student&action=index');
	}

	public function search()
	{
		$Fname = $_POST['fname'];
		$Lname = $_POST['lname'];
		$Sex = $_POST['sex'];
		$students = Student::get($Fname, $Lname, $Sex);
		$rooms = Room::getAll();
		$data = array('students' => $students, "rooms" => $rooms);
		$this->render('index', $data);
		// header('Location: index.php?page=admin&controller=student&action=index');
	}
	public function sort()
	{
		$column = $_POST['column'];
		$students = Student::sort($column);
		$rooms = Room::getAll();
		$data = array('students' => $students, "rooms" => $rooms);
		$this->render('index', $data);
		// header('Location: index.php?page=admin&controller=student&action=index');
	}
}