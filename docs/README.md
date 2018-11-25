# Jekyll Thumbnail
[![Build Status](https://travis-ci.org/superterran/jekyll-thumbnail.svg?branch=master)](https://travis-ci.org/superterran/jekyll-thumbnail)
[![Coverage Status](https://coveralls.io/repos/github/superterran/jekyll-thumbnail/badge.svg?branch=master)](https://coveralls.io/github/superterran/jekyll-thumbnail?branch=master)
[![Gem Version](https://badge.fury.io/rb/jekyll-thumbnail.svg)](https://badge.fury.io/rb/jekyll-thumbnail)

Adds a liquid tag that can generate thumbnails, with watermarks, at any size you dictate.

# Usage

Require the ruby gem in your Gemfile...

```
gem 'jekyll-thumbnail'
```

Then, use it in your Liquid templates as follows:

```
{{ "{% thumbnail path/to/image.jpg 50x50 " }}%}
```
This will pass the image through the thumbnailer, and generate a thumbs/ directory where the image is located.

# Thumbs directory

Images that already exist are not re-generated, so you can save yourself some work by caching these files.

# Unit Tests

Running Rake will work through all the minitest tests for this feature...

```
$ rake
```

# Installation

Inside your gemfile...

```
gem "jekyll-thumbnail"
```

# Building and Releasing

```
$ gem build jekyll-thumbnail.gemspec
$ gem push jekyll-thumbnail-0.1.18.gem
```
