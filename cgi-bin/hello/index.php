<?php

session_start();

$env = escapeshellarg(json_encode([
    "get" => $_GET,
    "post" => $_POST,
    "server" => $_SERVER,
    "session" => session_id(),
    "pwd" => getcwd()
    ]));

$wren = "../wrenc index.wren $env 2>&1";

passthru($wren);
?>
