<?php
require_once('controllers/admin/base_controller.php');
require_once('models/student.php');

class StudentController extends BaseController
{
	function __construct()
	{
		$this->folder = 'student';
	}

	public function index()
	{
		$students = Student::getAll();
		$data = array('students' => $students);
		$this->render('index', $data);
	}

	public function add()
	{
		$name = $_POST['name'];
		$address = $_POST['address'];
		$add_new = Student::insert($name, $address);
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