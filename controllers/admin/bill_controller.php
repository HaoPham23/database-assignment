<?php
require_once('controllers/admin/base_controller.php');
require_once('models/bill.php');


class BillController extends BaseController
{
	function __construct()
	{
		$this->folder = 'bill';
	}

	public function index()
	{
		$this->render('index');
	}
}
