CONTENTS OF THIS FILE
---------------------

 * Overview
 * Required components
 * More information and licence
 * Requirements
 * Configuration
 * Installation troubleshooting
 * Uploading images and files
 * Help & Contribution
 * Credits 



Overview
--------
This module allows Drupal to use the Frontpage Slideshow applet from
http://www.joomlaworks.gr/. 

The idea is to create a slideshow and add slides as you would add any other story. The slideshow is then set up as a block which can be put anywhere on the site on any page you want.



Required components
-------------------
For the module to work you will have to pay for and download Front Page Slideshow.
http://www.joomlaworks.gr/



More information and licence
----------------------------
FCKeditor - The text editor for internet
Copyright (C) 2003-2008 Frederico Caldeira Knabben

Licensed under the terms of http://www.joomlaworks.gr/content/view/23/33/



Requirements
------------
  - Drupal 6.x
  - PHP 4.3.0 or greater
  - frontpageslideshow-v1.7.2_static.zip or greater
  - Dependency UPLOAD module enabled.


Configuration
-------------------
Note: this instruction assumes that you install FPSS in 
      sites/all/modules directory (recommended).

   1. Unzip the files in the sites/all/modules directory. It should now 
      contain a fpss directory.
   2. Download FPSS from http://www.joomlaworks.gr/. Unzip the 
      contents of the fpss directory in the 
      sites/all/modules/fpss/fpss directory.
   3. Enable the module as usual from Drupal's admin pages.
   4. Grant permissions for use of FPSS in 
   5. Under "Administer > Site configuration > Frontpage Slideshow", adjust 
      the fpss settings.
   6. You'll have to manually create the CSS folder. 
   
   N.B.: Please note, this module will not work unless the CSS folder is created
         and linked in the settings page.



Installation troubleshooting
----------------------------

More to come on this subject.



Uploading images and files
--------------------------

This module currently only accepts images to be uploaded using the File Attachment
section of a node.

Please attach only 1 image. Anything else will be ignored by the module.




Help & Contribution
-------------------
If you are looking for more information, have any troubles in configuration or if 
you found an issue, please visit the official project page:
 http://drupal.org/project/fpss

Having problems? Take a look at list of common problems after installing FPSS:
 http://www.joomlaworks.gr/content/category/2/20/41/



Credits
-------
- FPSS for Drupal 6 Core functionality originally written by:
    William Roboly (http://drupal.org/user/48120)
    
- FCKeditor for Drupal 5.x originally written by:
    James Tombs (http://jamestombs.co.uk/)

