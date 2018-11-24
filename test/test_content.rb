require 'shoulda'
require 'minitest/test'
require_relative './test_helper'

class TestThumbnailContent < Minitest::Test

  # tests of attributes defined in template
  # ---------------------------------------------

  describe 'content of template' do


    include MockData

    before do
      @test_data = getDefaultData().clone
    end
    before do
      @test_data = getDefaultData().clone
    end

    should 'raises an error if its content is empty' do
      template = "{% swfobject #{@test_data[:swf_url]} %}{% endswfobject %}"
      assert_raises(ScriptError) do
        p = Liquid::Template.parse(template).render()
      end

    end

  end

end