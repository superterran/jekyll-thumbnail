require 'coveralls'
Coveralls.wear!

require 'liquid'
require 'jekyll-thumbnail'
require "minitest/autorun"
require 'fastimage'

class TestJekyllThumbnail < Minitest::Test

  SquareImage = "img/sample_square.jpg"
  SquareImageThumb = "img/thumbs/sample_square_50x50.jpg"

  RectImage = "img/sample_rectangle.jpg"
  RectImageThumb = "img/thumbs/sample_rectangle_50x50.jpg"

  def setup
    @squareTemplate = Liquid::Template.parse('{% thumbnail '+TestJekyllThumbnail::SquareImage+' 50x50 %}').render()
    @rectTemplate = Liquid::Template.parse('{% thumbnail '+TestJekyllThumbnail::RectImage+' 50x50 %}').render()
  end

  def teardown
    File.delete(TestJekyllThumbnail::SquareImageThumb)
    File.delete(TestJekyllThumbnail::RectImageThumb)
  end

  def test_can_generate_a_tag
    assert(@squareTemplate, "<img src='"+TestJekyllThumbnail::SquareImageThumb+"' />")
    assert(@rectTemplate, "<img src='"+TestJekyllThumbnail::RectImageThumb+"' />")
  end

  def test_does_generating_tag_generate_a_file
    assert(File.file?(TestJekyllThumbnail::SquareImageThumb))
    assert(File.file?(TestJekyllThumbnail::RectImageThumb))
  end

  def test_check_size_of_thumbnailed_image
    
    assert(FastImage.size(TestJekyllThumbnail::SquareImageThumb)[0] == 50)
    assert(FastImage.size(TestJekyllThumbnail::SquareImageThumb)[1] == 50)

    assert(FastImage.size(TestJekyllThumbnail::RectImageThumb)[0] == 50)
    assert(FastImage.size(TestJekyllThumbnail::RectImageThumb)[1] == 38)
  end

end