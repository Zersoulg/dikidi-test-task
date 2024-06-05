<?php

$path = __DIR__ . '/';

$countInjections = 0;
foreach ($_GET as $get) {
    $get = htmlspecialchars($get);
    $get = str_replace('..', '', $get, $countInjections);
    
    if ($countInjections > 0) {
        echo "ERROR: The injection found."; 
        return;
    }

    $path .= $get . '/';    
}

$newstr = filter_var($str, FILTER_SANITIZE_STRING);

if(file_exists($path) === false && is_dir($path) === false) {
    echo "ERROR: The directory does not exist.";
    return;
}

$files = glob($path ."/*");

if(count($files) === 0){
    echo "ERROR: The directory is empty.";
    return;
}
    
foreach($files as $file){
    if(is_file("$file")){
        if (exif_imagetype($file)) {
            echo basename($file) . '<br>';
        }
    } else if(is_dir("$file")) {
        echo basename($file) . '<br>';
    }
}