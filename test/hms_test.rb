require 'test_helper'

class HmsTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Hms
  end
  
  test "defines Lockable" do
    assert_kind_of Module, Hms::Concerns::Lockable
  end
  
  test "defines Timely" do
    assert_kind_of Class, Hms::Timely::Report
  end
  
  test "loads Sass" do
    assert_kind_of Module, Sass
  end
  
  test "defines User" do
    assert_kind_of Class, User
  end
end
