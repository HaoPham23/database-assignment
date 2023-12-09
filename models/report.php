<?php
require_once('connection.php');

class Report
{
    static function FindStudentsInMonth($month) {
        $db = DB::getInstance();
        $req = $db->query("
            SELECT `FindStudentsInMonth`('$month') AS `FindStudentsInMonth`;
        ");
        $result = ($req->fetch_row())[0];
        return $result;
    }

    static function CalculateExpensesForBuildingMonth($Bname, $month) {
        $db = DB::getInstance();
        $req = $db->query("
            SELECT `CalculateExpensesForBuildingMonth`('$Bname', '$month') AS `CalculateExpensesForBuildingMonth`;
        ");
        $result = ($req->fetch_row())[0];
        return $result;
    }
}