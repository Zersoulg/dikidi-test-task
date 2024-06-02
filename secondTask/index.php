<?php

$path = __DIR__ . '/';

foreach ($_GET as $get) {
    $path .= $get . '/';
}

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