<?php
	require 'src/facebook.php';

	$facebook = new Facebook(array(
		'appId' => '198588890243186',
		'secret' => '8e870b4559171dad72c5201b7a0d6c4b',
	));
	
	$url = 'https://graph.facebook.com/me/likes/313057122077593&access_token=AAACEdEose0cBANeai8Q642H0EBt4BDaZAvv58wTSEbPHchZBF53U0q4HHGD2tZCuhlyRSDUrJALwn9CZAXmZAxNQZAjZC0QsBJFbmI9jvjTeQZDZD';

	$ch = curl_init($url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
	$response = curl_exec($ch);

	print_r($response);
?>
