<?php
// $Id: admin_access.help.inc,v 1.3 2009/04/13 22:18:47 emptyvoid Exp $
/**
 * @file admin_access.help.inc
 * Custom module to override administration access pages to enforce security rights for
 * help pages.
 * 
 */

/**
 * Menu callback; prints a page listing a glossary of Drupal terminology.
 */
function admin_access_help_main() {
  // Add CSS
  drupal_add_css(drupal_get_path('module', 'help') .'/help.css', 'module', 'all', FALSE);
  $output = '<h2>'. t('Help topics') .'</h2><p>'. t('Help is available on the following items:') .'</p>'. admin_access_help_links_as_list();
  return $output;
}


/**
 * Menu callback; prints a page listing general help for a module.
 */
function admin_access_help_page($name) {
  $output = '';
  if (module_hook($name, 'help')) {
    $module = drupal_parse_info_file(drupal_get_path('module', $name) .'/'. $name .'.info');
    drupal_set_title($module['name']);

    $temp = module_invoke($name, 'help', "admin/help#$name", drupal_help_arg());
    if (empty($temp)) {
      $output .= t("No help is available for module %module.", array('%module' => $module['name']));
    }
    else {
      $output .= $temp;
    }

    // Only print list of administration pages if the module in question has
    // any such pages associated to it.
    $admin_tasks = admin_access_get_module_admin_tasks($name);
    if (!empty($admin_tasks)) {
      ksort($admin_tasks);
      $output .= theme('item_list', $admin_tasks, t('@module administration pages', array('@module' => $module['name'])));
    }
  }
  return $output;
}


function admin_access_help_links_as_list() {
  
  $empty_arg = drupal_help_arg();
  $module_info = module_rebuild_cache();

  $modules = array();
  foreach (module_implements('help', TRUE) as $module) {
    // check for module access
    $module_access = count(admin_access_get_module_admin_tasks($module));
    if ($module_access > 0) {
      if (module_invoke($module, 'help', "admin/help#$module", $empty_arg)) {
        $modules[$module] = $module_info[$module]->info['name'];
      }
    }
  }
  asort($modules);
  
  // Output pretty four-column list
  $count = count($modules);
  $break = ceil($count / 4);
  $output = '<div class="clear-block"><div class="help-items"><ul>';
  $i = 0;
  foreach ($modules as $module => $name) {
    $output .= '<li>'. l($name, 'admin/help/'. $module) .'</li>';
    if (($i + 1) % $break == 0 && ($i + 1) != $count) {
      $output .= '</ul></div><div class="help-items'. ($i + 1 == $break * 3 ? ' help-items-last' : '') .'"><ul>';
    }
    $i++;
  }
  $output .= '</ul></div></div>';

  return $output;
}


/**
 * Utility Functions
 */

/**
 * admin_access_get_module_admin_tasks()
 * Override the global Drupal method to include security checks
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
      if (menu_access_check_menu_item_access($item['mlid'])) {
        $items[$item['router_path']] = $item;
      }
    }
  }
  $admin_tasks = array();
  $admin_task_count = 0;
  // Check for permissions.
  /*
  if (module_hook($module, 'perm') && $admin_access) {
    $admin_tasks[-1] = l(t('Configure permissions'), 'admin/user/permissions', array('fragment' => 'module-'. $module));
  }
  */
  
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


