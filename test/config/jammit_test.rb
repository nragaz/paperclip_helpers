require 'test_helper'
require 'jammit'

class JammitTest < ActiveSupport::TestCase
  test "loads Jammit" do
    assert_kind_of Module, Jammit
  end
  
  test "defines Jammit options" do
    assert Jammit.configuration[:package_assets]
    assert_equal 'datauri', Jammit.configuration[:embed_assets]
    assert Jammit.configuration[:compress_assets]
    assert Jammit.configuration[:gzip_assets]
  end
  
  test "defines Jammit stylesheets" do
    assert Jammit.configuration[:stylesheets].has_key?(:hms)
    assert Jammit.configuration[:stylesheets].has_key?(:base)
  end
  
  test "defines Jammit javascripts" do
    assert Jammit.configuration[:javascripts].has_key?(:hms)
    assert Jammit.configuration[:javascripts].has_key?(:hms_ie)
    assert Jammit.configuration[:javascripts].has_key?(:base)
  end
end
