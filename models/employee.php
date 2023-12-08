<?php
require_once('connection.php');
class Employee
{
    public $CCCD_number;
    public $CCCD_date;
    public $Fname;
    public $Lname;
    public $DOB;
    public $Sex;
    public $Religion;
    public $Ethnicity;
    public $Email;
    public $Phone;
    public $Address;
    public $Bname;

    public function __construct($CCCD_number, $CCCD_date, $Fname, $Lname, $DOB, $Sex, $Religion, $Ethnicity, $Email, $Phone, $Address, $Bname)
    {
        $this->CCCD_number = $CCCD_number;
        $this->CCCD_date = $CCCD_date;
        $this->Fname = $Fname;
        $this->Lname = $Lname;
        $this->DOB = $DOB;
        $this->Sex = $Sex;
        $this->Religion = $Religion;
        $this->Ethnicity = $Ethnicity;
        $this->Email = $Email;
        $this->Phone = $Phone;
        $this->Address = $Address;
        $this->Bname = $Bname;
    }

    static function getAll()
    {
        $db = DB::getInstance();
        $req = $db->query("SELECT * FROM employee");
        $employees = [];
        foreach ($req->fetch_all(MYSQLI_ASSOC) as $employee)
        {
            $employees[] = new Employee(
                $employee['CCCD_number'],
                $employee['CCCD_date'],
                $employee['Fname'],
                $employee['Lname'],
                $employee['DOB'],
                $employee['Sex'],
                $employee['Religion'],
                $employee['Ethnicity'],
                $employee['Email'],
                $employee['Phone'],
                $employee['Address'],
                $employee['Bname']
            );
        }
        return $employees;
    }

    static function get($CCCD_number)
    {
        $db = DB::getInstance();
        $req = $db->query("SELECT * FROM employee WHERE CCCD_number = $CCCD_number");
        $result = $req->fetch_assoc();
        $employee = new Employee(
            $result['CCCD_number'],
            $result['CCCD_date'],
            $result['Fname'],
            $result['Lname'],
            $result['DOB'],
            $result['Sex'],
            $result['Religion'],
            $result['Ethnicity'],
            $result['Email'],
            $result['Phone'],
            $result['Address'],
            $result['Bname']
        );
        return $Employee;
    }

    static function insert($CCCD_number, $CCCD_date, $Fname, $Lname, $DOB, $Sex, $Religion, $Ethnicity, $Email, $Phone, $Address, $Bname)
    {
        $db = DB::getInstance();
        $req = $db->query(
            "INSERT INTO employee (CCCD_number, CCCD_date, Fname, Lname, DOB, Sex, Religion, Ethnicity, Email, Phone, Address, Bname)
            VALUES ('$CCCD_number', '$CCCD_date', '$Fname', '$Lname', '$DOB', '$Sex', '$Religion', '$Ethnicity', '$Email', '$Phone', '$Address', '$Bname');");
        return $req;
    }

    static function delete($CCCD_number)
    {
        $db = DB::getInstance();
        $req = $db->query("DELETE FROM employee WHERE CCCD_number = $CCCD_number");
        return $req;
    }

    static function update($CCCD_number, $CCCD_date, $Fname, $Lname, $DOB, $Sex, $Religion, $Ethnicity, $Email, $Phone, $Address, $Bname)
    {
        $db = DB::getInstance();
        $req = $db->query(
            "
                UPDATE employee
                SET CCCD_date = '$CCCD_date', Fname = '$Fname', Lname = '$Lname', DOB = '$DOB', Sex = '$Sex', Ethnicity = '$Ethnicity', Email = '$Email', Phone = '$Phone', Address = '$Address', Bname = '$Bname'
                WHERE CCCD_number = $CCCD_number
            ;");
    }
}
?>