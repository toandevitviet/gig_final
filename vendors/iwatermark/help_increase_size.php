<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>How to increase my file upload limit?</title>
<style type="text/css">
body { font-family: Arial, Helvetica, sans-serif; font-size: 14px; }
li { margin-bottom: 5px; }
code { font-size: 15px; }
.bold { font-weight: bold; }
</style>
</head>

<body>
	<h2>How to increase my file upload limit?</h2>
    <p>The maximum upload size is predefined for your server and is different for each hosting provider. If the limit is too low, you can either contact your hosting provider to increase it, or you can try to do it yourself by following one of the methods below.</p>
    
    <h3>Method 1: Modify your php.ini file with the following entries:</h3>
    <code>
    memory_limit = 256M<br />
    upload_max_filesize = 200M<br />
    post_max_size = 201M
    </code>
    
    <h3>Method 2: In your /admin/ folder of OpenCart, create an .htaccess file with the following entries:</h3>
    <code>
    php_value memory_limit 256M<br />
    php_value upload_max_filesize 200M<br />
    php_value post_max_size 201M
    </code>
    <p>You can find additional information in <a href="http://php.net/manual/en/ini.core.php" target="_blank">php.net</a></p>
</body>
</html>
