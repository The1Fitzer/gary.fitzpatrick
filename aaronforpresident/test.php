<?php
	require 'src/facebook.php';

	$facebook = new Facebook(array(
		'appId' => '198588890243186',
		'secret' => '8e870b4559171dad72c5201b7a0d6c4b',
	));

	$user = $facebook->getUser;

	print_r($user);
?>
