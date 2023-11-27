# Setup:
1. Chỉnh đường dẫn của Document Root nằm trong file httpd.conf của XAMPP tới thư mục nơi chứa source code của project.
2. Khởi động XAMPP Control Panel. Chạy 2 service: Apache và MySQL.
3. Vào trang phpMyAdmin, sau đó thực hiện import database (file `web.sql`).
4. Truy cập vào trình duyệt web nào đó như Microsoft Edge hoặc Google Chrome, nhập đường dẫn [http://localhost/index.php?page=admin](http://localhost/index.php?page=admin). Trang web sẽ được hiển thị thành công.