#!/usr/bin/env python
# -*- coding: utf-8 -*- #
import os

AUTHOR = u'Wayne'

SITENAME = u'The Fomightiest Blog'
SITESUBTITLE = u"accompanies Fomightez, Wayne's Bioinformatics Portal"
SITEURL = 'http://localhost:8000' # change in publishconf.py

# Times and dates
DEFAULT_DATE_FORMAT = '%b %d, %Y'
TIMEZONE = 'America/New_York'
DEFAULT_LANG = u'en'

# Set the article URL
ARTICLE_URL = '{date:%Y}/{date:%m}/{date:%d}/{slug}/'
ARTICLE_SAVE_AS = '{date:%Y}/{date:%m}/{date:%d}/{slug}/index.html'
PAGE_URL = '{slug}'
PAGE_SAVE_AS = '{slug}.html'
TAG_URL = 'tags/{slug}'
TAG_SAVE_AS = 'tags/{slug}.html'

# Title menu options
MENUITEMS = [('About', 'blog/about'),
             ('Fomightez', 'http://fomightez.pythonanywhere.com')]
NEWEST_FIRST_ARCHIVES = False

#Github include settings
GITHUB_USER = 'fomightez'
GITHUB_REPO_COUNT = 6 # I noted when I had 0 there (probably from where I had copied it originally had that), it seemed to show as many as could fit and not none. According to https://github.com/DandyDev/pelican-bootstrap3#github, if you don't want any to show, don't provide a user.
GITHUB_SKIP_FORK = True
GITHUB_SHOW_USER_LINK = True

# Blogroll
#LINKS =  (('Pelican', 'http://docs.notmyidea.org/alexis/pelican/'),
#          ('Python.org', 'http://python.org'),
#          ('Jinja2', 'http://jinja.pocoo.org'),
#          ('You can modify those links in your config file', '#'),)

# Social widget
SOCIAL = (('twitter', 'http://twitter.com/fomightez'),
          ('github', 'http://github.com/fomightez'),)

DIRECT_TEMPLATES = ('index', 'categories', 'authors', 'archives', 'search')

DEFAULT_PAGINATION = 10

TAG_CLOUD_MAX_ITEMS = 10

DISPLAY_CATEGORIES_ON_MENU = False

# STATIC_OUT_DIR requires https://github.com/jakevdp/pelican/tree/specify-static
#STATIC_OUT_DIR = ''
#STATIC_PATHS = ['images', 'figures', 'downloads']
#FILES_TO_COPY = [('favicon.png', 'favicon.png')]

# This requires Pelican 3.3+
STATIC_PATHS = ['images', 'figures', 'downloads', 'favicon.ico']

CODE_DIR = 'downloads/code'
NOTEBOOK_DIR = 'downloads/notebooks'

# Theme and plugins
#  Theme requires http://github.com/duilio/pelican-octopress-theme/
#  Plugins require http://github.com/getpelican/pelican-plugins/
THEME = os.path.join(os.environ.get('HOME'),
                     'Opensource/pelican-bootstrap3/')

BOOTSTRAP_THEME = 'spacelab'

BOOTSTRAP_NAVBAR_INVERSE = True

BANNER = 'images/banner.jpg'

PLUGIN_PATHS = [os.path.join(os.environ.get('HOME'),
                           'Opensource/pelican-plugins')]


PLUGINS = ['liquid_tags.img', 'liquid_tags.video',
           'liquid_tags.youtube', 'liquid_tags.vimeo',
           'liquid_tags.include_code', 'tipue_search']


CC_LICENSE = "CC-BY-NC-SA"

# Sharing
TWITTER_USER = 'fomightez'
GOOGLE_PLUS_USER = 'fomightez'
GOOGLE_PLUS_ONE = True
GOOGLE_PLUS_HIDDEN = True
FACEBOOK_LIKE = False
TWITTER_TWEET_BUTTON = True
TWITTER_LATEST_TWEETS = False
TWITTER_FOLLOW_BUTTON = True
TWITTER_TWEET_COUNT = 3
TWITTER_SHOW_REPLIES = 'false'
TWITTER_SHOW_FOLLOWER_COUNT = 'true'


# RSS/Atom feeds
FEED_DOMAIN = SITEURL
FEED_ATOM = 'atom.xml'


# Search
SEARCH_BOX = True
