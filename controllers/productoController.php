<?php

require_once 'models/productoModels.php';

class productoController{
    public function index(){
        $producto = new Producto();
        $productos = $producto;

        

        require_once 'views/producto/destacados.php';
    }
}

