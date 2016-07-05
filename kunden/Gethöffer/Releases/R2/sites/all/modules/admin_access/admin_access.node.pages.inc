<?php
// $Id: admin_access.node.pages.inc,v 1.1 2009/03/25 17:22:28 emptyvoid Exp $
/**
 * @file admin_access.node.pages.inc
 * Custom module to override administration access pages to enforce security rights for
 * node index pages.
 * 
 */

require_once(drupal_get_path('module', 'node') ."/node.pages.inc");
require_once(drupal_get_path('module', 'admin_access') ."/admin_access.admin.inc");




/**
 * Display the list of available node types for node creation.
 *
 * @ingroup themeable
 */
function theme_admin_access_node_add_list($content) {
  $output = '';

  if ($content) {
    $output = '<dl class="node-type-list">';
    foreach ($content as $item) {
      $output .= '<dt>'. l($item['title'], $item['href'], $item['localized_options']) .'</dt>';      
      $output .= '<dd>'. filter_xss_admin($item['description']) .'</dd>';
    }
    $output .= '</dl>';
  }
  return $output;
}

function admin_access_node_add_page() {
  $item = menu_get_item();
  $content = admin_access_admin_menu_block($item);
  return theme('admin_access_node_add_list', $content);
}
