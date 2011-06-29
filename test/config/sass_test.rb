require 'test_helper'

class SassTest < ActiveSupport::TestCase
  test "loads Sass" do
    assert_kind_of Module, Sass
  end
  
  test "defines Sass stylesheet locations" do
    assert_equal Sass::Plugin.template_location_array[0][0],
                 File.expand_path("../../../app/sass", __FILE__)
    
    assert_equal Sass::Plugin.template_location_array[1][0],
                 File.expand_path("../../dummy/app/sass", __FILE__)
  end
end
