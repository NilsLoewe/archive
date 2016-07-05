<?php

function html_head ($stylefile, $title)
{
	echo "
	<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"
       \"http://www.w3.org/TR/html4/loose.dtd\">
	<html>
	<head>
		<title>$title</title>
		<link rel=\"stylesheet\" type=\"text/css\" href=\"$stylefile\">
		<meta http-equiv=\"content-type\" content=\"text/html; charset=iso-8859-1\">
		<meta http-equiv=\"expires\" content=\"0\">
	</head>
	<body>
	";
}

function html_foot()
{
	return "
	</body>
	</html>";
}

function link_pid($pid, $name, $level)
{
	if ($level == 1)
	{
		$link = "<div class=\"navi1\"><A href=\"index.php?pid=$pid\" class=\"navi\">$name</A></div>";
	}
	elseif($level == 2)
	{
		$link = "<div class=\"navi2\"><A href=\"index.php?pid=$pid\" class=\"navi\">$name</A></div>";
	}
	else $link = -1;
	
	return $link;
}

function local_link($target, $name)
{
	return "<A href=\"$target\">$name</A>";
}
?>
