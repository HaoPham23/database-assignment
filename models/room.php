<?php
require_once('connection.php');
class Room
{
    public $id;
    public $name;
    public $price;
    public $description;
    public $content;
    public $img;

    public function __construct($id, $name, $price, $description, $content, $img)
    {
        $this->id = $id;
        $this->name = $name;
        $this->price = $price;
        $this->description = $description;
        $this->content = $content;
        $this->img = $img;
    }

    static function getAll()
    {
        $db = DB::getInstance();
        $req = $db->query("SELECT * FROM product");
        $rooms = [];
        foreach ($req->fetch_all(MYSQLI_ASSOC) as $room)
        {
            $rooms[] = new Room(
                $room['id'],
                $room['name'],
                $room['price'],
                $room['description'],
                $room['content'],
                $room['img']
            );
        }
        return $rooms;
    }

    static function get($id)
    {
        $db = DB::getInstance();
        $req = $db->query("SELECT * FROM product WHERE id = $id");
        $result = $req->fetch_assoc();
        $room = new Room(
            $result['id'],
            $result['name'],
            $result['price'],
            $result['description'],
            $result['content'],
            $result['img']
        );
        return $room;
    }

    static function insert($name, $price, $description, $content, $img)
    {
        $db = DB::getInstance();
        $req = $db->query(
            "INSERT INTO product (name, price, description, content, img)
            VALUES ('$name', $price, '$description', '$content', '$img');");
        return $req;
    }

    static function delete($id)
    {
        $db = DB::getInstance();
        $req = $db->query("DELETE FROM product WHERE id = $id");
        return $req;
    }

    static function update($id, $name, $price, $description, $content, $img)
    {
        $db = DB::getInstance();
        $req = $db->query(
            "
                UPDATE product
                SET name = '$name', price = $price, description = '$description', content = '$content', img = '$img'
                WHERE id = $id
            ;");
    }
}
?>