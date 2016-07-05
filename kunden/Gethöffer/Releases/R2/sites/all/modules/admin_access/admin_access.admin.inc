<?php
// $Id: admin_access.admin.inc,v 1.1 2009/03/25 17:22:28 emptyvoid Exp $
/**
 * @file admin_access.admin.inc
 * Admin page callbacks for the admin_access module.
 */


require_once(drupal_get_path('module', 'system') ."/system.admin.inc");



/**
 * Provide a single block from the administration menu as a page.
 * This function is often a destination for these blocks.
 * For example, 'admin/content/types' needs to have a destination to be valid
 * in the Drupal menu system, but too much information there might be
 * hidden, so we supply the contents of the block.
 *
 * @return
 *   The output HTML.
 */
function admin_access_admin_menu_block_page() {
  $item = menu_get_item();
  if ($content = admin_access_admin_menu_block($item)) {
    $output = theme('admin_block_content', $content);
  }
  else {
    $output = t('You do not have any administrative items.');
  }
  return $output;
}




/**
 * Generate a list of tasks offered by a specified module.
 *
 * @param $module
 *   Module name.
 * @return
 *   An array of task links.
 */
function admin_access_get_module_admin_tasks($module) {
  static $items;

  $admin_access = user_access('administer permissions');
  $admin_tasks = array();

  if (!isset($items)) {
    $result = db_query("
       SELECT m.load_functions, m.to_arg_functions, m.access_callback, m.access_arguments, m.page_callback, m.page_arguments, m.title, m.title_callback, m.title_arguments, m.type, ml.*
       FROM {menu_links} ml INNER JOIN {menu_router} m ON ml.router_path = m.path WHERE ml.link_path LIKE 'admin/%' AND hidden >= 0 AND module = 'system' AND m.number_parts > 2");
    $items = array();
    while ($item = db_fetch_array($result)) {
      _menu_link_translate($item);
      if ($item['access'] != 0) {
        $item['access'] = menu_access_check_menu_item_access($item['mlid']);
      }
      if ($item['access']) {
        $items[$item['router_path']] = $item;
      }
    }
  }
  $admin_tasks = array();
  $admin_task_count = 0;
  // Check for permissions.
  if (module_hook($module, 'perm') && $admin_access) {
    $permresult = db_query("SELECT mlid FROM {menu_links} WHERE link_path = '%s'", "admin/user/permissions");
    $perm_item = db_fetch_array($permresult);
    if (menu_access_check_menu_item_access($perm_item['mlid'])) {
      $admin_tasks[-1] = l(t('Configure permissions'), 'admin/user/permissions', array('fragment' => 'module-'. $module));
    }
  }

  // Check for menu items that are admin links.
  if ($menu = module_invoke($module, 'menu')) {
    foreach (array_keys($menu) as $path) {
      if (isset($items[$path])) {
        $admin_tasks[$items[$path]['title'] . $admin_task_count ++] = l($items[$path]['title'], $path);
      }
    }
  }

  return $admin_tasks;
}




/**
 * Provide a single block on the administration overview page.
 *
 * @param $item
 *   The menu item to be displayed.
 */
function admin_access_admin_menu_block($item) {
  $content = array();
  if (!isset($item['mlid'])) {
    $item += db_fetch_array(db_query("SELECT mlid, menu_name FROM {menu_links} ml WHERE ml.router_path = '%s' AND module = 'system'", $item['path']));
  }
  $result = db_query("
    SELECT m.load_functions, m.to_arg_functions, m.access_callback, m.access_arguments, m.page_callback, m.page_arguments, m.title, m.title_callback, m.title_arguments, m.type, m.description, ml.*
    FROM {menu_links} ml
    LEFT JOIN {menu_router} m ON ml.router_path = m.path
    WHERE ml.plid = %d AND ml.menu_name = '%s' AND hidden = 0", $item['mlid'], $item['menu_name']);
  while ($item = db_fetch_array($result)) {
    _menu_link_translate($item);
    if ($item['access'] != 0) {
        $item['access'] = menu_access_check_menu_item_access($item['mlid']);
      }
    if (!$item['access']) {
      continue;
    }
    // The link 'description' either derived from the hook_menu 'description' or
    // entered by the user via menu module is saved as the title attribute.
    if (!empty($item['localized_options']['attributes']['title'])) {
      $item['description'] = $item['localized_options']['attributes']['title'];
    }
    // Prepare for sorting as in function _menu_tree_check_access().
    // The weight is offset so it is always positive, with a uniform 5-digits.
    $content[(50000 + $item['weight']) .' '. $item['title'] .' '. $item['mlid']] = $item;
  }
  ksort($content);
  return $content;
}




/**
 * Menu callback; displays a module's settings page.
 */
function admin_access_settings_overview() {
  // Check database setup if necessary
  if (function_exists('db_check_setup') && empty($_POST)) {
    db_check_setup();
  }

  $item = menu_get_item('admin/settings');
  $content = admin_access_admin_menu_block($item);

  $output = theme('admin_block_content', $content);

  return $output;
}






/**
 * Menu callback; Provide the administration overview page.
 */
function admin_access_main_admin_page($arg = NULL) {
  
  
  
  // If we received an argument, they probably meant some other page.
  // Let's 404 them since the menu system cannot be told we do not
  // accept arguments.
  if (isset($arg) && substr($arg, 0, 3) != 'by-') {
    return drupal_not_found();
  }

  // Check for status report errors.
  if (system_status(TRUE) && user_access('administer site configuration')) {
    drupal_set_message(t('One or more problems were detected with your Drupal installation. Check the <a href="@status">status report</a> for more information.', array('@status' => url('admin/reports/status'))), 'error');
  }
  $blocks = array();
  if ($admin = db_fetch_array(db_query("SELECT menu_name, mlid FROM {menu_links} WHERE link_path = 'admin' AND module = 'system'"))) {
    $result = db_query("
      SELECT m.*, ml.*
      FROM {menu_links} ml
      INNER JOIN {menu_router} m ON ml.router_path = m.path
      WHERE ml.link_path != 'admin/help' AND menu_name = '%s' AND ml.plid = %d AND hidden = 0", $admin);
    while ($item = db_fetch_array($result)) {
      _menu_link_translate($item);
      if ($item['access'] != 0) {
        $item['access'] = menu_access_check_menu_item_access($item['mlid']);
      }
      if (!$item['access']) {
        continue;
      }
      // The link 'description' either derived from the hook_menu 'description'
      // or entered by the user via menu module is saved as the title attribute.
      if (!empty($item['localized_options']['attributes']['title'])) {
        $item['description'] = $item['localized_options']['attributes']['title'];
      }
      $block = $item;
      $block['content'] = '';
      if ($item['block_callback'] && function_exists($item['block_callback'])) {
        $function = $item['block_callback'];
        $block['content'] .= $function();
      }
      $block['content'] .= theme('admin_block_content', admin_access_admin_menu_block($item));
      // Prepare for sorting as in function _menu_tree_check_access().
      // The weight is offset so it is always positive, with a uniform 5-digits.
      $blocks[(50000 + $item['weight']) .' '. $item['title'] .' '. $item['mlid']] = $block;
    }
  }
  if ($blocks) {
    ksort($blocks);
    return theme('admin_page', $blocks);
  }
  else {
    return t('You do not have any administrative items.');
  }
}



/**
 * Menu callback; prints a listing of admin tasks for each installed module.
 */
function admin_access_admin_by_module() {

  $modules = module_rebuild_cache();
  $menu_items = array();
  $help_arg = module_exists('help') ? drupal_help_arg() : FALSE;

  foreach ($modules as $file) {
    $module = $file->name;
    if ($module == 'help') {
      continue;
    }

    $admin_tasks = admin_access_get_module_admin_tasks($module);

    // Only display a section if there are any available tasks.
    if (count($admin_tasks)) {

      // Check for help links.
      if ($help_arg && module_invoke($module, 'help', "admin/help#$module", $help_arg)) {
        $admin_tasks[100] = l(t('Get help'), "admin/help/$module");
      }

      // Sort.
      ksort($admin_tasks);

      $menu_items[$file->info['name']] = array($file->info['description'], $admin_tasks);
    }
  }
  return theme('system_admin_by_module', $menu_items);
}
