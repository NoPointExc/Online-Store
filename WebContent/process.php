<?php 
	$emailTo = 'testmail@templatesquare.com';
	if($_REQUEST['subject']!=""){
	$subject =$_REQUEST['subject'];
	}else{
	$subject = 'Lastore Contact Form';
	}
	$name=$_REQUEST['name'];
	$email=$_REQUEST['email'];
	$website=$_REQUEST['website'];
	$msg=$_REQUEST['msg'];
	
	$body = "Name: $name \n\nEmail: $email \n\nwebsite: $website \n\nMessage: $msg";
	$headers = 'From: '.$name.' <'.$email.'>' . "\r\n" . 'Reply-To: ' . $email;
	
	mail($emailTo, $subject, $body, $headers);
?>