<?php 
    function generateRandomPassword($length = 5) {
    $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    $Code = '';

    $charLength = strlen($characters) - 1;

    for ($i = 0; $i < $length; $i++) {
        $Code .= $characters[mt_rand(0, $charLength)];
    }

    return $Code;
    }

?>