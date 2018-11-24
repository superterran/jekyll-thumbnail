# All this based on https://github.com/sectore/jekyll-swfobject/tree/master/test
require 'minitest/test'
require 'minitest/assertions'
require 'jekyll'
require 'liquid.rb'
require_relative '../lib/jekyll-thumbnail'

# Test assertion helper to check template result
# Based on Shopify's test helper
# @see: https://github.com/Shopify/liquid/blob/master/test/test_helper.rb
module MiniTest
  module Assertions
    def assert_template_result(expected, template, assigns = {}, message = nil)
      result = Liquid::Template.parse(template).render(assigns)
      assert_equal expected, result
    end
  end
end

# Simple helper to provide mock data
module MockData
  # default test data
  def getDefaultData
    data = {
        :src => 'etc/sample.jpg'
    }
  end

  # Helper method to create expected output
  def expected_output_by_test_data(data_to_merge=nil)
    # use "raw" test data or merge data into it
    data = (data_to_merge.nil?) ? @test_data : @test_data.merge!(data_to_merge)

    output =
        <<-EOS.gsub /^\s+/, '' # remove whitespaces from heredocs
          <img src="#{data[:src]}">
        EOS
  end
end
