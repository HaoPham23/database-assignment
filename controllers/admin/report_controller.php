<?php
require_once('controllers/admin/base_controller.php');
require_once('models/report.php');
require_once('models/building.php');

class ReportController extends BaseController
{
	function __construct()
	{
		$this->folder = 'report';
	}

	public function index()
	{
		$buildings = Building::getAll();
		$data = array("buildings" => $buildings);
        $this->render('index', $data);
	}

	public function FindStudentsInMonth($month) {
		$result = Report::FindStudentsInMonth($month);
		return $result;
	}

	public function CalculateExpensesForBuildingMonth($month, $Bname) {
		$result = Report::CalculateExpensesForBuildingMonth($Bname, $month);
		return $result;
	}
}
