<?php
	require 'src/facebook.php';
	
	$facebook = new Facebook(array(
		'appId' => '198588890243186',
		'secret' => '8e870b4559171dad72c5201b7a0d6c4b'
	));
	
	$user = $facebook->getUser();

	if($user){
		try {
			$likes = $facebook->api("/me/likes/313057122077593");
			if(!empty($likes['data'])){
				echo "I likes!";
			}else{
				echo '<html><head><title>Aaron McGee for President</title></head><body><img src="aaron.jpg" alt="aaron for president" width ="500px" height="700px"></img></body></head>';
			}
		} catch (FacebookApiException $e){
			error_log($e);
			$user = null;
		}
	}
?>
