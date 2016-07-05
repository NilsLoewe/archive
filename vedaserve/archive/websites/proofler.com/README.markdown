To build this site, you have to install the `jekyll` gem (see Gemfile).
The build can be triggered by running `jekyll build`. The results are stored in the `_site` folder.

To develop this site jekyll can be run in development mode:

    jekyll serve --watch

Jekyll will open a server [on port 4000](http://localhost:4000/).

# Sprites

In order to optimize load time, some images are concatenated together as sprites.
Since jekyll does not support automatic sprite generator they were created manually using ImageMagick:

    http://www.phpied.com/command-line-css-spriting/

The individual images are still contained in the folder `sprites-raw`.
To (re)generate a sprite you can use `convert`.

    rm img/steps-sprite.png
    convert sprites-raw/step-sprites/* -append PNG8:img/steps-sprite.png
    identify -format "%g - %f\n" sprites-raw/step-sprites/*

Remember that you might have to adjust all positions in the css file
when you change the dimensions of one image in a sprite.
