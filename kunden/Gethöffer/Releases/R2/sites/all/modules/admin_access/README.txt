Module: Admin Access
Author: Robert Foley Jr <www.swipht.com>

Description
===========
The admin access module provides security validation methods for all Drupal
administration indexes that display system services. The module depends on
the Menu Access and Menu Item Access modules to check access rights to services.

By default Drupal does not validate user access rights when displaying links
to administrative functions. It will check only links where permissions are
explicity defined for a link.

This module also checks if a user is assigned to a role or explicitly assigned
to a navigation link. If the user or a role is not assigned the item is not
displayed on any of the administration pages.

This includes:
- Administration Index
- Content management index
- Site building index
- Site configuration index
- User management index
- Help Index
- Help Details

Requirements
============

* Requires Drupal 6.x or above
* Requires the Menu Module
* Requires the Menu Access Module
* Requires the Menu Item Access Module

Installation
============
* Copy the 'admin_access' module directory in to your Drupal
sites/all/modules directory as usual.


Usage
=====
The module is a support module and has no administrative settings screen.
Just enable the module and security rights will be properly enforced.
