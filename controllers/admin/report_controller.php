<?php
require_once('controllers/admin/base_controller.php');
require_once('models/report.php');


class ReportController extends BaseController
{
	function __construct()
	{
		$this->folder = 'report';
	}

	public function index()
	{
		$this->render('index');
	}
}
