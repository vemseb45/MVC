<<<<<<< HEAD
<?php
require_once 'autoload.php';
require_once 'config/parameters.php';
require_once 'views/layout/header.php';
require_once 'views/layout/sidebar.php';

function show_error(){
    $error = new errorController();
    $error->index();
}


if(isset($_GET['controller'])){
    $nombre_controlador = $_GET['controller'].'Controller';
}else if(!isset($_GET['controller']) && !isset($_GET['action'])){
        $nombre_controlador = controller_default;
}else{
    show_error();
    exit();
}

if (class_exists($nombre_controlador)){
    $controlador = new $nombre_controlador();

    if(isset($_GET['action']) && method_exists($controlador,$_GET['action'])){
        $action = $_GET['action'];
        $controlador->$action();
    }else if(!isset($_GET['controller']) && !isset($_GET['action'])){
            $action_default = action_default;
            $controlador->$action_default();
    }else{
        show_error();
    }}else{
        show_error();
    }


require_once 'views/layout/footer.php';
=======
<h1>Bienvenidos a mi Web</h1>

<?php

// require_once 'controllers/UsuarioController.php';
// require_once 'controllers/productoController.php';
require_once 'autoload.php';

// var_dump($_GET['controller']);
// var_dump($_GET['action']);

if(isset($_GET['controller'])){
    $nombre_controlador = $_GET['controller'];
    // var_dump($nombre_controlador);
}else{
    echo "La pagina que buscas no existe";
    exit();
}



if(class_exists($nombre_controlador)){
    $controlador = new $nombre_controlador();

    if(isset($_GET['action']) && method_exists($controlador, $_GET['action'])){
    $action = $_GET['action'];
    $controlador->$action();
    }else{
        echo "la pagina que buscas no existe";
    }

}else{
     echo "la pagina que buscas no existe";
}

>>>>>>> f0b4d4178eb5362691c9799d1d0656a2fc41f90c
