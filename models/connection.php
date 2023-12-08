<?php
class DB
{
    public static $instance = NULL;
    public static function getInstance($username="root", $password="") 
    {
        if (!isset(self::$instance)) 
        {
            try {
                self::$instance = mysqli_connect("127.0.0.1", $username, $password, "chetcom");
            } catch (mysqli_sql_exception $e) {
                // $e is the exception, you can use it as you wish 
                return 0;
            }
        }

        return self::$instance;
    }
}
