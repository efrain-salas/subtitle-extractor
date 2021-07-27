<?php

$url = $_POST['url'];

$tempVideoPath = tempnam(sys_get_temp_dir(), 'subextractor_');
file_put_contents($tempVideoPath, file_get_contents($url));

$srtFilePath = $tempVideoPath . '.srt';
exec('ccextractor -o ' . $srtFilePath . ' ' . $tempVideoPath);
$srt = file_get_contents($srtFilePath);
unlink($tempVideoPath);
unlink($srtFilePath);

echo $srt;
