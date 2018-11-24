require 'liquid'
require 'jekyll-thumbnail'
require "minitest/autorun"
require 'coveralls'

Coveralls.wear!

class TestJekyllThumbnail < Minitest::Test
  def setup
    @thumbnail = Liquid::Template
  end

  def test_can_generate_a_tag
    template = Liquid::Template.parse('{% thumbnail img/sample.jpg 50x50 %}')
    assert(template.render(), "<img src='img/thumbs/sample_50x50.jpg' />")
  end

end