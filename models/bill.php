<?php
require_once('connection.php');
class Bill
{
    public $Bill_ID;
    public $Detail;
    public $Amount;
    public $Date_paid;
    public $Date_issue;
    public $Date_expire;
    public $Mgr_ID;
    public $Mgr_Lname;
    public $Mgr_Fname;
    public $Student_ID;
    public $Student_Lname;
    public $Student_Fname;

    public function __construct($Bill_ID, $Detail, $Amount, $Date_paid, $Date_issue, $Date_expire, 
    $Mgr_ID, $Mgr_Lname, $Mgr_Fname, $Student_ID, $Student_Lname, $Student_Fname)
    {
        $this->Bill_ID = $Bill_ID;
        $this->Detail = $Detail;
        $this->Amount = $Amount;
        $this->Date_paid = $Date_paid;
        $this->Date_issue = $Date_issue;
        $this->Date_expire = $Date_expire;
        $this->Mgr_ID = $Mgr_ID;
        $this->Mgr_Lname = $Mgr_Lname;
        $this->Mgr_Fname = $Mgr_Fname;
        $this->Student_ID = $Student_ID;
        $this->Student_Lname = $Student_Lname;
        $this->Student_Fname = $Student_Fname;
    }

    static function getAll()
    {
        $db = DB::getInstance();
        $req = $db->query("
            SELECT bill.*, 
                employee.Lname as Mgr_Lname, 
                employee.Fname as Mgr_Fname,
                student.Lname as Student_Lname, 
                student.Fname as Student_Fname
            FROM bill
            LEFT JOIN employee ON bill.Mgr_ID = employee.CCCD_number
            LEFT JOIN student ON bill.Student_ID = student.CCCD_number
            ORDER BY Date_issue DESC
        ");
        $bills = [];
        foreach ($req->fetch_all(MYSQLI_ASSOC) as $bill)
        {
            $bills[] = new Bill(
                $bill['Bill_ID'],
                $bill['Detail'],
                $bill['Amount'],
                $bill['Date_paid'],
                $bill['Date_issue'],
                $bill['Date_expire'],
                $bill['Mgr_ID'],
                $bill['Mgr_Lname'],
                $bill['Mgr_Fname'],
                $bill['Student_ID'],
                $bill['Student_Lname'],
                $bill['Student_Fname'],
            );
        }
        return $bills;
    }

    static function getAllShow()
    {
        $db = DB::getInstance();
        $req = $db->query("SELECT * FROM news WHERE status=1 ORDER BY date DESC");
        $lnews = [];
        foreach ($req->fetch_all(MYSQLI_ASSOC) as $news)
        {
            $lnews[] = new News(
                $news['id'],
                $news['status'],
                $news['date'],
                $news['title'],
                $news['description'],
                $news['content']
            );
        }
        return $lnews;
    }

    static function get($id)
    {
        $db = DB::getInstance();
        $req = $db->query("SELECT * FROM news WHERE id = $id");
        $result = $req->fetch_assoc();
        $news = new News(
            $result['id'],
            $result['status'],
            $result['date'],
            $result['title'],
            $result['description'],
            $result['content']
        );
        return $news;
    }

    static function insert($title, $description, $content)
    {
        $status = true;
        $date = date("Y-m-d-h-i-s");
        $db = DB::getInstance();
        $req = $db->query(
            "
            INSERT INTO news (status, date, title, description, content)
            VALUES ($status, '$date', '$title', '$description', '$content')
            ;");
        return $req;
    }

    static function delete($id)
    {
        $db = DB::getInstance();
        $req = $db->query("DELETE FROM news WHERE id = $id;");
        return $req;
    }

    static function update($id, $title, $description, $content)
    {
        $db = DB::getInstance();
        $req = $db->query("UPDATE news SET content = '$content', title = '$title', description = '$description' WHERE id = $id;");
        return $req;
    }

    static function hide($id)
    {   
        $db = DB::getInstance();
        $statuscurrent = News::get($id)->status;
        if ($statuscurrent == 1){
            $req = $db->query("UPDATE news SET status = 0 WHERE id = $id;");
        }
        else{
            $req = $db->query("UPDATE news SET status = 1 WHERE id = $id;");
        }
        return $req;
    }

    static function show($id)
    {
        $db = DB::getInstance();
        $req = $db->query("UPDATE news SET status = 1 WHERE id = $id;");
        return $req;
    }

    static function recentNews()
    {
        $db = DB::getInstance();
        $req = $db->query("SELECT * FROM news ORDER BY date DESC LIMIT 5");
        $lnews = [];
        foreach ($req->fetch_all(MYSQLI_ASSOC) as $news)
        {
            $lnews[] = new News(
                $news['id'],
                $news['status'],
                $news['date'],
                $news['title'],
                $news['description'],
                $news['content']
            );
        }
        return $lnews;
    }
}
?>