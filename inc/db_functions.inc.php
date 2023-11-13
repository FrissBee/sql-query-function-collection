<?php

/**
 * META FUNCTIONs
 */
function purgeCode($input, $encoding = 'UTF-8') {
  return htmlspecialchars(strip_tags($input), ENT_QUOTES | ENT_HTML5, $encoding);
}

function fetch_data($db, $query) {
  $statement = $db->query($query);
  $result = $statement->fetch();
  return $result;
}

function fetch_data_all($db, $query) {
  $statement = $db->query($query);
  $result = $statement->fetchAll();
  return $result;
}

function db_execute($db, $query) {
  $statement = $db->prepare($query);
  $statement->execute();
}

function db_execute_data($db, $query, $data) {
  $statement = $db->prepare($query);
  $statement->execute($data);
}

function db_execute_data_return($db, $query, $data) {
  $statement = $db->prepare($query);
  $statement->execute($data);
  return $statement->fetch();
}

function set_columns_and_values($data) {
  $columnsAndValues = '';
  $i = 0;
  foreach($data as $key => $value) {
    $columnsAndValues .= ($i < sizeof($data) - 1) ? 
    "`$key` = :$key, " : 
    "`$key` = :$key ";
    $i++;
  }
  return $columnsAndValues;
}

/**
 * COLUMNS & TABLES
 */
function all_table_names($db) {
  $query = "SHOW TABLES;";
  return fetch_data_all($db, $query);
}

function all_column_names_from_table($db, $table) {
  $query = "SHOW COLUMNS FROM $table;";
  return fetch_data_all($db, $query);
}

/**
 * AGGREGAT
 */
function count_all_by_id_where($db, $table, $where = 1) {
  $query = "SELECT COUNT('id') AS `count` FROM $table WHERE $where;";
  return fetch_data($db, $query);
}

/**
 * SELECT
 */
// one row
function first_row_of_table_by_id($db, $table) {
  $query = "SELECT * FROM $table ORDER BY `id` ASC LIMIT 1;";
  return fetch_data($db, $query);
}

function last_row_of_table_by_id($db, $table, $columns = '*') {
  $query = "SELECT $columns FROM $table ORDER BY `id` DESC LIMIT 1;";
  return fetch_data($db, $query);
}

function select_by_id($db, $table, $id) {
  $query = "SELECT * FROM $table WHERE id = :id;";
  $data = [ 'id' => $id ];
  return db_execute_data_return($db, $query, $data);
}

function select_by_id_with_columns($db, $table, $columns, $id) {
  $query = "SELECT $columns FROM $table WHERE id = :id;";
  $data = [ 'id' => $id ];
  return db_execute_data_return($db, $query, $data);
}

// all rows
function query_default($db, $query) {
  return fetch_data_all($db, $query);
}

function select_all($db, $table) {
  $query = "SELECT * FROM $table;";
  return fetch_data_all($db, $query);
}

function select_all_where($db, $table, $where = 1) {
  $query = "SELECT * FROM $table WHERE $where;";
  return fetch_data_all($db, $query);
}

function select_all_with_columns_where($db, $table, $columns, $where = 1) {
  $query = "SELECT $columns FROM $table WHERE $where;";
  return fetch_data_all($db, $query);
}

function select_all_1_to_n_where($db, $table_main, $table_fk, $columns, $where) {
  $id_fk = $table_main . '_id';

  $query = "SELECT $columns FROM `$table_main` 
  JOIN `$table_fk` ON `$table_main`.`id` = `$table_fk`.`$id_fk` 
  WHERE $where;";
  return fetch_data_all($db, $query);
}

function select_all_n_to_m_where($db, $table_left, $table_right, $table_helper, $columns, $where) {
  $id_left_fk = $table_left . '_id';
  $id_right_fk = $table_right . '_id';

  $query = "SELECT $columns FROM `$table_left` 
  LEFT JOIN `$table_helper` ON `$table_left`.`id` = `$table_helper`.`$id_left_fk` 
  LEFT JOIN `$table_right` ON `$table_right`.`id` = `$table_helper`.`$id_right_fk` 
  WHERE $where;";
  return fetch_data_all($db, $query);
}

/**
 * INSERT
 */
function insert_into_table($db, $table, $data) {
  $columnsAndValues = set_columns_and_values($data);
  $query = "INSERT INTO $table SET $columnsAndValues;";
  db_execute_data($db, $query, $data);
}

function insert_into_table_multi_rows($db, $table, $data) {
  foreach ($data as $value) {
    insert_into_table($db, $table, $value);
  }
}

/**
 * UPDATE
 */
function update_where($db, $table, $data, $where) {
  $columnsAndValues = set_columns_and_values($data);
  $query = "UPDATE $table SET $columnsAndValues WHERE $where;";
  db_execute_data($db, $query, $data);
}

/**
 * DELETE
 */
function delete_where($db, $table, $where = "id = 0") {
  $query = "DELETE FROM $table WHERE $where;";
  db_execute($db, $query);
}

function delete_where_multi_rows($db, $table, $where, $data) {
  foreach ($data as $value) {
    delete_where($db, $table, $where . $value);
  }
}

/**
 * PASSWORD & LOGIN
 */
function register_new_user($db, $data) {
  $columnsAndValues = set_columns_and_values($data);
  $data['password'] = password_hash($data['password'], PASSWORD_BCRYPT);
  $query = "INSERT INTO `users` SET $columnsAndValues;";
  db_execute_data($db, $query, $data);
}

function login_user($db, $data) {
  $query = 'SELECT `id`, `password` FROM `users` WHERE `username` = :username';
  $check = ['username' => $data['username']];
  $toCheckedData = db_execute_data_return($db, $query, $check);

  if ($toCheckedData === false) {
    $result = [
      "username" => false,
      "verified" => false,
    ];
  } else {
    $verified = password_verify($data['password'], $toCheckedData['password']);
    $result = [
      "username" => true,
      "verified" => $verified,
    ];
  }

  return $result;
}