<?php


function validateComment($post)
{
    $errors = array();

    if (empty($post['comment'])) {
        array_push($errors, 'Comment is required');
    }

    return $errors;
}
?>