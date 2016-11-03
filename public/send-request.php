<?php
  require 'email.php';

  function handle_request() {
    $text = array("С вашего сайта оставили заявку!");

    if (isset($_POST['contact'])) {
      $text[] = "Контакт: ".$_POST['contact'];
    }

    if (isset($_POST['name'])) {
      $text[] = "Имя: ".$_POST['name'];
    }

    if (isset($_POST['target'])) {
      $text[] = "Источник: ".$_POST['target'];
    }

    $m = new EMail(implode("\r\n", $text)."\r\n");
    $m -> setSubject("Заявка с сайта");
    $m -> from("no-reply@ivan.com");
    $m -> sendTo("vladimir-shalaev22@yandex.ru");
  }

  handle_request();

?>
