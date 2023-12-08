<?php
require_once('connection.php');
class Student
{
    public $CCCD_number;
    public $CCCD_date;
    public $Fname;
    public $Lname;
    public $DOB;
    public $Sex;
    public $Religion;
    public $Ethnicity;
    public $Phone;
    public $Email;
    public $Avatar;
    public $Bank_name;
    public $Bank_number;
    public $Address;
    public $Status;

    public function __construct($CCCD_number, $CCCD_date, $Fname, $Lname, $DOB, $Sex, $Religion, $Ethnicity, $Phone, $Email, $Avatar, $Bank_name, $Bank_number, $Address, $Status)
    {
        $this->CCCD_number = $CCCD_number;
        $this->CCCD_date = $CCCD_date;
        $this->Fname = $Fname;
        $this->Lname = $Lname;
        $this->DOB = $DOB;
        $this->Sex = $Sex;
        $this->Religion = $Religion;
        $this->Ethnicity = $Ethnicity;
        $this->Phone = $Phone;
        $this->Email = $Email;
        $this->Avatar = $Avatar;
        $this->Bank_name = $Bank_name;
        $this->Bank_number = $Bank_number;
        $this->Address = $Address;
        $this->Status = $Status;
    }

    static function getAll()
    {
        $db = DB::getInstance();
        $req = $db->query("SELECT * FROM student");
        $students = [];
        foreach ($req->fetch_all(MYSQLI_ASSOC) as $student) {
            $students[] = new Student(
                $student['CCCD_number'],
                $student['CCCD_date'],
                $student['Fname'],
                $student['Lname'],
                $student['DOB'],
                $student['Sex'],
                $student['Religion'],
                $student['Ethnicity'],
                $student['Phone'],
                $student['Email'],
                $student['Avatar'],
                $student['Bank_name'],
                $student['Bank_number'],
                $student['Address'],
                $student['Status']
            );
        }
        return $students;
    }

    static function get($CCCD_number)
    {
        $db = DB::getInstance();
        $req = $db->query("SELECT * FROM company WHERE CCCD_number = $CCCD_number");
        $result = $req->fetch_assoc();
        $student = new Student(
            $result['CCCD_number'],
            $result['CCCD_date'],
            $result['Fname'],
            $result['Lname'],
            $result['DOB'],
            $result['Sex'],
            $result['Religion'],
            $result['Ethnicity'],
            $result['Phone'],
            $result['Email'],
            $result['Avatar'],
            $result['Bank_name'],
            $result['Bank_number'],
            $result['Address'],
            $result['Status']
        );
        return $student;
    }

    static function insert($CCCD_number, $CCCD_date, $Fname, $Lname, $DOB, $Sex, $Religion, $Ethnicity, $Phone, $Email, $Avatar, $Bank_name, $Bank_number, $Address, $Status)
    {
        $db = DB::getInstance();
        $req = $db->query(
            "
            INSERT INTO student (CCCD_number, CCCD_date, Fname, Lname, DOB, Sex, Religion, Ethnicity, Phone, Email, Avatar, Bank_name, Bank_number, Address, Status)
            VALUES ('$CCCD_number', '$CCCD_date', '$Fname', '$Lname', '$DOB', '$Sex', '$Religion', '$Ethnicity', '$Phone', '$Email', '$Avatar', '$Bank_name', '$Bank_number', '$Address', '$Status');
            "
        );
        return $req;
    }

    static function delete($CCCD_number)
    {
        $db = DB::getInstance();
        $req = $db->query("DELETE FROM student WHERE CCCD_number = '$CCCD_number';");
        return $req;
    }

    static function update($CCCD_number, $CCCD_date, $Fname, $Lname, $DOB, $Sex, $Religion, $Ethnicity, $Phone, $Email, $Avatar, $Bank_name, $Bank_number, $Address, $Status)
    {
        $db = DB::getInstance();
        $req = $db->query("UPDATE student 
        SET CCCD_date = '$CCCD_date', 
            Fname = '$Fname', 
            Lname = '$Lname', 
            DOB = '$DOB', 
            Sex = '$Sex', 
            Religion = '$Religion', 
            Ethnicity = '$Ethnicity', 
            Phone = '$Phone', 
            Email = '$Email', 
            Avatar = '$Avatar', 
            Bank_name = '$Bank_name', 
            Bank_number = '$Bank_number', 
            Address = '$Address', 
            Status = '$Status' 
        WHERE CCCD_number = '$CCCD_number';");
        return $req;
    }
}