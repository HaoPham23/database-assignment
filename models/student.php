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
        $req = $db->query("
            SELECT * FROM student
        ");
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

    static function get($Fname, $Lname, $Sex)
    {
        $db = DB::getInstance();
        $req = $db->query("
            SELECT * FROM student 
            WHERE Fname LIKE '%$Fname%' AND Lname LIKE '%$Lname%' AND Sex LIKE '%$Sex%'
        ");
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

    static function insert($CCCD_number, $CCCD_date, $Fname, $Lname, $DOB, $Sex, $Religion, $Ethnicity, 
    $Phone, $Email, $Avatar, $Bank_name, $Bank_number, $Address, $Status, $Room_ID)
    {
        $db = DB::getInstance();
        // $query1 = "
        //     INSERT INTO student (CCCD_number, CCCD_date, Fname, Lname, DOB, Sex, Religion, Ethnicity, Phone, Email, Avatar, Bank_name, Bank_number, Address, Status)
        //     VALUES ('$CCCD_number', '$CCCD_date', '$Fname', '$Lname', '$DOB', '$Sex', '$Religion', '$Ethnicity', '$Phone', '$Email', '$Avatar', '$Bank_name', '$Bank_number', '$Address', '$Status')
        // ";
    
        // $query2 = "
        //     INSERT INTO lives_in (Student_ID, Date_in, Date_out, Room_ID)
        //     VALUES ('$CCCD_number', '2023-12-09', '2023-12-10', '$Room_ID')
        // ";
        // $result1 = $db->query($query1);
        // $result2 = $db->query($query2);
        // return $result2;
        $query = "
            CALL InsertStudent('$CCCD_number', '$CCCD_date', '$Fname', '$Lname', '$DOB', '$Sex', '$Religion', '$Ethnicity', '$Phone', '$Email', '$Avatar', '$Bank_name', '$Bank_number', '$Address', '$Status', '$Room_ID');
        ";
        $result = $db->query($query);
        return $result;
    }

    static function delete($id)
    {
        $db = DB::getInstance();
        // $result1 = $db->query("
        //     DELETE FROM lives_in WHERE Student_ID = '$id';
        // ");
        // $result2 = $db->query("
        //     DELETE FROM student WHERE CCCD_number = '$id';
        // ");
        // return $result2;
        $query = "
            CALL DeleteStudent('$id');
        ";
        $result = $db->query($query);
        return $result;
    }

    static function update($CCCD_number, $CCCD_date, $Fname, $Lname, $DOB, $Sex, $Religion, $Ethnicity, $Phone, $Email, $Avatar, $Bank_name, $Bank_number, $Address, $Status, $Room_ID)
    {
        $db = DB::getInstance();
        // $result1 = $db->query("UPDATE student 
        // SET CCCD_date = '$CCCD_date', 
        //     Fname = '$Fname', 
        //     Lname = '$Lname', 
        //     DOB = '$DOB', 
        //     Sex = '$Sex', 
        //     Religion = '$Religion', 
        //     Ethnicity = '$Ethnicity', 
        //     Phone = '$Phone', 
        //     Email = '$Email', 
        //     Avatar = '$Avatar', 
        //     Bank_name = '$Bank_name', 
        //     Bank_number = '$Bank_number', 
        //     Address = '$Address', 
        //     Status = '$Status' 
        // WHERE CCCD_number = '$CCCD_number';");

        // $result2 = $db->query("
        //     UPDATE lives_in
        //     SET Room_ID = '$Room_ID'
        //     WHERE student_id = '$CCCD_number';
        // ");
        // return $result2;
        $query = "
            CALL UpdateStudent('$CCCD_number', '$CCCD_date', '$Fname', '$Lname', '$DOB', '$Sex', '$Religion', '$Ethnicity', '$Phone', '$Email', '$Avatar', '$Bank_name', '$Bank_number', '$Address', '$Status', '$Room_ID');
        ";
        $result = $db->query($query);
        return $result;
    }
}