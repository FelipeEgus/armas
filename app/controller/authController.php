<?php

include_once 'app/model/userModel.php';
include_once 'app/helpers/authHelper.php';

function base64url_encode($data) {
    return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
}

class authController{
    private $model;
    private $helper;

    public function __construct() {
      
        $this->model = new userModel();
        $this->helper = new AuthHelper();
    }

    public function getToken(){
    //  session_start();

        $input = file_get_contents('php://input');
        $data = json_decode($input, true); // decodificamos a array asociativo

        // Validamos que se hayan recibido los campos necesarios
        if (!isset($data['mail']) || !isset($data['password'])) {
            http_response_code(400);
            echo json_encode(['error' => 'Datos incompletos']);
            return;
        }

        $mail = $data['mail'];
        $password = $data['password'];

        $user = $this->model->getUserMail($mail);

        if ($user && password_verify($password, $user->password)) {
            $header = base64url_encode(json_encode(['alg' => 'HS256', 'typ' => 'JWT']));
            $payload = base64url_encode(json_encode([
                'ID_USER' => $user->id,
                'MAIL' => $user->mail,
                'USUARIO' => $user->usuario,
                'ROLE' => $user->rol,
                'exp' => time() + 3600
            ]));
            $signature = base64url_encode(
                hash_hmac('SHA256', "$header.$payload", "Clave1234", true)
            );     

            $token = "$header.$payload.$signature";
            
            $_SESSION['TOKEN'] = $token ;            
        
        } else {

            header('Content-Type: application/json');

            $response = [
                // 'usuario' => $user,
                'mail' => $mail,
                'password_recibido' => $password,
                'password_guardado' => $user ? $user->password : null,
                'usuario_existe' => $user ? true : false,
                'verificado' => password_verify($password, $user->password)
            ];
            echo json_encode($response);
        
            // http_response_code(401);
            // header('Content-Type: application/json');
            // echo json_encode(['error' => 'No autorizado']);
        }
    }

}

?>