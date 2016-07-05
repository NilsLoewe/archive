Frontend for Proofler.

# Current sitation

The current setup is quite simple. We've just forked the Angular.js
and Bootstrap libraries and put them as static files in here.  This of
course does not provide a great way to upgrade our libraries, but on
the other hand it's quite simple.

We're also not doing minification/uglyfication at the moment, so the
whole frontend part is quite readable to everyone and very flow to
read for browsers.

# Inspiration for a more advanced setup

If we want to improve our dependency management here are some
interesting articles describing a more advanced setup.

* http://netengine.com.au/blog/gulp-and-angularjs-a-love-story-or-the-old-wheel-was-terrible-check-out-my-new-wheel/
