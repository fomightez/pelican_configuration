Wayne's Fomightiest Blog
------------------------
This is a port of my blog to the [Pelican](http://blog.getpelican.com/)
blogging platform.  It doesn't contain the 'output' or '_build' direoctories pelican will generate.

It is based on combining Pythononic Preambulations and the Pelican-Bootstrap 3 theme  <---add the links

Requirements
------------
- Recent version of
  [pelican-plugins](http://github.com/getpelican/pelican-plugins):
  Make sure the path is specified correctly in ``pelicanconf.py``.
  This must include the ``liquid_tags`` plugin from this PR:
  https://github.com/getpelican/pelican-plugins/pull/21

- Recent version of [IPython](http://github.com/ipython/ipython).  The
  liquid_tags plugin above requires IPython 1.0.  Note that previously
  this could be built with the stand-alone nbconvert package.  That
  no longer works with the recent liquid_tags plugin.

- Recent version of [Pelican](http://github.com/getpelican/pelican).  For
  the static paths (downloads, images, figures, etc.) to appear in the right
  place, Pelican 3.3+ must be used.

-The Pelican Boostrap 3 theme <---add links to my variation

MAY NEED DISQUS INFO BELOW BUT REST HAS BEEN INCORPORATED IN MY CONFIGURATION OF PELICAN AND MY FORK OF THE BOOTSTRAP 3 THEME
- Recent version of
  [pelican-octopress-theme](https://github.com/duilio/pelican-octopress-theme),
  with an additional few lines in the header (see ``pelicanconf.py`` for
  a description of what is needed).
  For a few of the options, this requires several additions:

  - https://github.com/duilio/pelican-octopress-theme/pull/11: social media
  - https://github.com/duilio/pelican-octopress-theme/pull/12: disqus specification
  - https://github.com/duilio/pelican-octopress-theme/pull/13: extra header args

