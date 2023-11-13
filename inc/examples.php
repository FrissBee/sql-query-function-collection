<?php

include_once './inc/db_connection.inc.php';
include_once './inc/db_functions.inc.php';

/**
 * COLUMNS & TABLES
 */
echo '<hr><h3>COLUMNS & TABLES</h3>';

echo '<b><br>all_table_names</b><br>';
$results = all_table_names($db);
var_dump($results);

echo '<br><br><h5>all_table_names - output</h5>';
$for_js = [];
foreach($results as $result) {
  echo $result["Tables_in_sql-query-function-collection"] . '<br>';
  array_push($for_js, $result["Tables_in_sql-query-function-collection"]);
}

// For JavaScript - see in the console an "index.php"
$for_javascript = json_encode($for_js);

echo '<br><b>all_column_names_from_table</b><br>';
$results = all_column_names_from_table($db, 'users');
foreach($results as $result) {
  var_dump($result["Field"]);
}

/**
 * AGGREGAT
 */
echo '<hr><h3>AGGREGATE</h3>';

echo '<b><br>count_all_by_id_where (without WHERE parameter)</b><br>';
$result = count_all_by_id_where($db, 'softwares');
var_dump($result);

echo '<br><br><b>count_all_by_id_where</b><br>';
$public = 1;
$where = "`public` = $public";
$result = count_all_by_id_where($db, 'projects', $where);
var_dump($result);

/**
 * SELECT
 */
// one row
echo '<hr><h3>SELECT</h3>';
echo '<h5>one row</h5>';

echo '<b>first_row_of_table_by_id (without $columns parameter)</b><br>';
$result = first_row_of_table_by_id($db, 'softwares');
var_dump($result);

echo '<br><br><b>last_row_of_table_by_id</b><br>';
$result = last_row_of_table_by_id($db, 'softwares', '`name`');
var_dump($result);

echo '<br><br><b>select_by_id</b><br>';
$id = 1;
$result = select_by_id($db, 'softwares', $id);
var_dump($result);

echo '<br><br><b>select_by_id_with_columns</b><br>';
$id = 1;
$columns = '`id`, `name`';
$result = select_by_id_with_columns($db, 'softwares', $columns, $id);
var_dump($result);

// echo '<br><br><b>select_with_columns_where</b><br>';
// $columns = '`name`, `content_page`';
// $public = 1;
// $where = "`public` = $public";
// $result = select_with_columns_where($db, 'projects', $columns, $where);
// var_dump($result);






// all rows
echo '<br><br><h5>all rows</h5>';

echo '<b>query_default</b><br>';
$query = 'SELECT * FROM `softwares`;';
$result = query_default($db, $query);
var_dump($result);

echo '<br><br><b>select_all</b><br>';
$result = select_all($db, 'softwares');
var_dump($result);

echo '<br><br><b>select_all_where</b><br>';
$public = 0;
$where = "`public` = $public";
$result = select_all_where($db, 'projects', $where);
var_dump($result);

echo '<br><br><b>select_all_by_columns_where (without WHERE parameter)</b><br>';
$columns = '`name`';
$result = select_all_with_columns_where($db, 'softwares', $columns);
var_dump($result);

echo '<br><br><b>select_all_by_columns_where</b><br>';
$columns = '`name`';
$name = 'MS Visual Studio Code';
$where = "`name` = '$name'";
$result = select_all_with_columns_where($db, 'softwares', $columns, $where);
var_dump($result);

echo '<br><br><b>select_all_1_to_n_where</b><br>';
$columns = "`technologies`.`id`, `technologies`.`name`";
$id = 1;
$where = "`attributions`.`id` = $id";
$result = select_all_1_to_n_where($db, 'attributions', 'technologies', $columns, $where);
echo '<b>Notice: Name the foreign keys like: <code>[table name] + _id</code></b><br>';
var_dump($result);

echo '<br><br><b>select_all_n_to_m_where</b><br>';
$columns = "`softwares`.`id`, `softwares`.`name`";
$id = 1;
$where = "`projects`.`id` = " . $id;
$result = select_all_n_to_m_where($db, 'projects', 'softwares', 'projects_softwares', $columns, $where);
echo '<b>Notice: Name the foreign keys like: <code>[table name] + _id</code></b><br>';
var_dump($result);

/**
 * INSERT
 */
echo '<hr><h3>INSERT</h3>';
echo '<br><b>insert_into_table (insert one)</b><br>';
// One data set
// $data = [
//   "username" => 'Horst',
//   "password" => password_hash('1234', PASSWORD_BCRYPT),
// ];
// insert_into_table($db, 'users', $data);
echo '<b>Notice: Name array keys, such as column name</b><br>';
echo 'COMMENTED OUT';

// Multiple data records
echo '<br><br><b>insert_into_table (insert several)</b><br>';
// $data = [
//   [
//     "username" => 'Rudi',
//     "password" => password_hash('1234', PASSWORD_BCRYPT),
//   ],
//   [
//     "username" => 'Hilde',
//     "password" => password_hash('1234', PASSWORD_BCRYPT),
//   ]
// ];
// insert_into_table_multi_rows($db, 'users', $data);
echo '<b>Notice: Name array keys, such as column name</b><br>';
echo 'COMMENTED OUT';

/**
 * UPDATE
 */
echo '<hr><h3>UPDATE</h3>';
echo '<br><b>update_where</b><br>';
// $data = [
//   "username" => 'John NEW',
//   "password" => password_hash('123456zsdf', PASSWORD_BCRYPT),
// ];
// $id = 2;
// $where = "`id` = $id";
// update_where($db, 'users', $data, $where);
echo '<b>Notice: Name array keys, such as column name</b><br>';
echo 'COMMENTED OUT';

/**
 * DELETE
 */
echo '<hr><h3>DELETE</h3>';
echo '<br><b>delete_where</b><br>';
// $id = 3;
// $where = "`id` = $id";
// delete_where($db, 'users', $where);
echo 'COMMENTED OUT';

echo '<br><br><b>delete_where_multi_rows</b><br>';
// $data = [ 4, 5 ];
// $where = "`id` = $id";
// delete_where_multi_rows($db, 'users', "`id` = ", $data);
echo 'COMMENTED OUT';

/**
 * PASSWORD
 */
echo '<hr><h3>PASSWORD</h3>';
echo '<br><b>register_new_user</b><br>';
// $data = [
//   'username' => 'Doe',
//   'password' => '1234',
// ];
// register_new_user($db, $data);
echo '<b>Notice: Name array keys, such as column name</b><br>';
echo 'COMMENTED OUT';

echo '<br><br><b>login_user</b><br>';
$data = [
  'username' => 'admin',
  'password' => '1234',
];
$result = login_user($db, $data);
echo '<b>Notice: Name array keys, such as column name</b><br>';
var_dump($result);

echo '<br>';
if ($result['username'] === false) {
  echo 'username is wrong<br>';
  // do something...
}
if ($result['username'] === true) {
  echo 'username is correct <br>';
  // do something...
}
if ($result['verified'] === false) {
  echo 'Password is wrong <br>';
  // do something...
}
if ($result['verified'] === true) {
  echo 'Password is correct <br>';
  // do something...
}


// ===============================
$db = null;

?>

