<?php
    if (!$_POST['email'] || !$_POST['name'] || !$_POST['message'] ) {
        echo 'false';
        exit();
    } else {
        $email   = $_POST['email'];
        $name    = $_POST['name'];
        $subject = $_POST['subject'];
        $message = $_POST['message'];
        $sex     = $_POST['sex'];
        $budget  = $_POST['budget'];
        $site    = $_POST['site'];
        $to      = 'site@terminalpixel.co.uk';

        if ('' == $subject) {
            $subject = 'A New Adventurer Arrived!';
        }
        $headers = 'From: ' . $email . "\r\n";
        $body = $message . '\r\n Budget: ' . $budget . 'Site: ' . $site . " \r\n From " . $name . ' ' . $sex;
        if (mail($to, $subject, $body, $headers)) {
            if (!$site) {
                //contact success
                header('Location: http://www.terminalpixel.co.uk/awesome');
            } else {
                echo 'true';
            }
            exit();
        } else {
            if (!$site) {
                //contact success
                header('Location: http://www.terminalpixel.co.uk/fail');
            } else {
                echo 'false';
            }
            exit();
        }
    }
?>