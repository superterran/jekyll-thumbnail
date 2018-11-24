require 'liquid'
require 'jekyll-thumbnail'

# class Meme
#     def i_can_has_cheezburger?
#       "OHAI!"
#     end
  
#     def will_it_blend?
#       "YES!"
#     end
# end

require "minitest/autorun"

class TestJekyllThumbnail < Minitest::Test
  def setup
    @thumbnail = Liquid::Template
  end

  def test_can_generate_a_tag
    template = Liquid::Template.parse('{% thumbnail img/sample.jpg 50x50 %}')
    assert(template.render(), "<img src='img/thumbs/sample_50x50.jpg' />")
  end

#   def test_that_it_will_not_blend
#     refute_match /^no/i, @meme.will_it_blend?
#   end

#   def test_that_will_be_skipped
#     skip "test this later"
#   end
end