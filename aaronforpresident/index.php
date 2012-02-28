<?php

	$url = 'https://graph.facebook.com/me/likes/313057122077593&access_token=AAACEdEose0cBANeai8Q642H0EBt4BDaZAvv58wTSEbPHchZBF53U0q4HHGD2tZCuhlyRSDUrJALwn9CZAXmZAxNQZAjZC0QsBJFbmI9jvjTeQZDZD';

	$ch = curl_init($url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
	$response = json_decode(curl_exec($ch), true);
	print_r($response);	
	if(!empty($response['data'])){
		echo "I Like";
	}else{
		echo '<html><head><title>Aaron McGee for President</title></head><body><img src="aaron.jpg" alt="aaron for president" width ="500px" height="700px"></img></body></head>';
		echo "I Don't Like"
	}
?>
