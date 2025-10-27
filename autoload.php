<?php
<<<<<<< HEAD
    function controller_autoload($classname){
        include_once 'controllers/'.$classname.'.php';
    }

    spl_autoload_register('controller_autoload');
=======

function autocarga($classname){
    include 'controllers/'. $classname . '.php';
}

spl_autoload_register('autocarga');
>>>>>>> f0b4d4178eb5362691c9799d1d0656a2fc41f90c
