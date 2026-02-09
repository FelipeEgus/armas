<?php

class AuthHelper{

    public function __construct() {
        if (session_status() != PHP_SESSION_ACTIVE) {
            session_start();
        }
    }

    
    
    
    // nuevo ---------------------------------------------------------------------------------------------------
    
    function base64url_decode($data) {
        $b64 = strtr($data, '-_', '+/');
        return base64_decode($b64);
    }
    
    function getToken(){
        $auth = $this->getSessionToken(); 
        
        $token = explode(".", $auth);
        
        if (count($token) != 3) {
            http_response_code(401);                        
            return array();
        }
        
        $header = $token[0];
        $payload = $token[1];
        $signature = $token[2];
        
        $new_signature = hash_hmac('SHA256', "$header.$payload", "Clave1234", true);
        $new_signature = rtrim(strtr(base64_encode($new_signature), '+/', '-_'), '=');
        
        if(!hash_equals($signature, $new_signature)){
            http_response_code(401);
            echo json_encode(['error' => 'Firma inválida']);
            
            return array();
        }
        
        $payload = json_decode(base64_decode($payload));
        if(!isset($payload->exp) || $payload->exp<time()){
            http_response_code(401);
            // echo json_encode(['error' => 'Token expirado']);
            
            return array();
        }    
        
        return $payload;
    }
    
    function isLoggedIn() {
        $payload = $this->getToken();
        
        return isset($payload->ID_USER);
    }
    
    function checkLoggedIn() {
        if (isset($payload->ID_USER)) {
            header("Location: " . BASE_URL);
            die();
        }
    }
    
    function checkAdmin() {
        $payload = $this->getToken();
        $this->checkLoggedIn();
        if(!(isset($payload->ROLE) && ($payload->ROLE == 1 || $payload->ROLE == 4 ))){
            header("Location: " . BASE_URL);
            die();
        }
    }

    function getSessionToken(){
        $token = "" ;
        if(isset($_SESSION['TOKEN'])){
            $token = $_SESSION['TOKEN'];
        } 
        return $token;
    }

}

?>