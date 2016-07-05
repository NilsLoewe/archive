Installation instructions.

1> Buy and download the full FPSS application from http://www.joomlaworks.gr/
2> You'll be using the PHP edition of the FPSS. Copy the contents of the zip file into this FPSS sub-directory.

You're folder structure should look something like this:

  drupal@server ~/website/docs/sites/all/modules/fpss $ ls -l
  total 64
  -rwxr-xr-x 1 drupal drupal     0 Feb  2 20:06 README.TXT
  drwxr-sr-x 7 drupal drupal  4096 Feb  2 20:06 fpss/
  -rwxr-xr-x 1 drupal drupal   322 Feb  2 20:06 fpss.info
  -rwxr-xr-x 1 drupal drupal  7311 Feb  2 20:06 fpss.install
  -rwxr-xr-x 1 drupal drupal 45790 Feb  5 01:33 fpss.module

  drupal@axis ~/website/docs/sites/all/modules/fpss/fpss $ ls -l
  total 36
  drwxr-sr-x  3 drupal drupal 4096 Feb  2 20:06 engines/
  drwxr-sr-x  3 drupal drupal 4096 Feb  2 20:06 language/
  -rwxr-xr-x  1 drupal drupal 9428 Feb  2 20:06 mod_fpslideshow.php
  -rwxr-xr-x  1 drupal drupal 4478 Feb  2 20:06 readme.txt
  drwxr-sr-x  4 drupal drupal 4096 Feb  2 20:06 slideshows/
  drwxr-sr-x 11 drupal drupal 4096 Feb  2 20:06 templates/

N.B.: We're nesting fpss folders here.


e:

fpss
  |__ slideshows
			|_yourslideshowfolder
							|_images
							|_configuration.php
							|_data.php

You can obviously change only the "yourslideshowfolder" to whatever you want.

4. Upload (using FTP) the entire "fpss" folder to the root of your site. If your site is www.mysite.com then you should be able to read this text on www.mysite.com/fpss/readme.txt

5. Find the page where you want to add the slideshow. Let's say this page is the index.php located at the root of your site as well. The code that you will use to call your slideshow is this:

<?php
// START of "Frontpage Slideshow" settings
	$nameOfSlideshowToDisplay = "myslideshow"; 					// Enter the name of your slideshow. Slideshows are in folders inside /fpss/slideshows/.
	$URLofyoursite = "http://www.mysite.com"; 					// Enter your site's URL.
	$AbsoluteServerPathofyoursite = "/home/user/public_html";	// Enter the root path of your site on the server.
	
	// do not edit below this line
	include_once($AbsoluteServerPathofyoursite."/fpss/mod_fpslideshow.php");
// END of "Frontpage Slideshow" settings
?>

Edit the code block to reflect your site's paths.
You may want to check out the supplied demoslideshow.php file that comes with the zip file you unpacked and see how the code is applied.

6. Open your browser and go to www.mysite.com/index.php. You will see the demo slideshow in place as we haven't yet edited our slideshow. This is what we'll do next.

4. First change the CONFIGURATION options of your slideshow. Locate the configuration.php file inside /fpss/slideshows/myslideshow/ and edit it per your needs. Make sure you read carefully what each option does.

5. Add your SLIDES: Edit your slideshow's data.php file (in the same folder) to add/delete slides. Simply copy/paste or delete the data blocks marked with "slide elements" and edit the properties of each block to reflect each slide's contents (slide title, category, tagline, text, image). The demo slideshow has 4 slides in it but you can add as many as you want.

6. When you're done with editing the contents and configuration options of your slideshow, re-open your browser and again navigate to www.mysite.com/index.php. Et voila! Enjoy your Frontpage Slideshow!



-------------------------------------------------------------
INSTRUCTIONS FOR WORDPRESS, DRUPAL and other CMS users...
-------------------------------------------------------------

When using a CMS like Wordpress or Drupal (or any other PHP based CMS), the steps to add Frontpage Slideshow in your template/theme are exactly the same as the above.

- For Drupal users add the FPSS code block inside the page.tpl.php file of your theme, located in themes/yourtheme/

- For Wordpress users add the FPSS code block inside the index.php file of your theme, located in wp-content/themes/yourtheme/

In a similar manner you can add Frontpage Slideshow on other popular CMSs like Textpattern, e107, CMS Made Simple, XOOPS, Magento (e-commerce), Zen Cart (e-commerce), osCommerce (e-commerce), Simple Machines Forum (SMF) (forum), phpBB (forum) and many more.



////////////////////////////////////////////////////////
Last edited: May 4th, 2008
Author: Fotis Evangelou - www.joomlaworks.gr
////////////////////////////////////////////////////////
