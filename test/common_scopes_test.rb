require 'test_helper'
require 'pry'

class CommonScopes::Test < ActiveSupport::TestCase
  test "should be a module" do
    assert_kind_of Module, CommonScopes
  end

  test "should have sub-class ByBoolean" do
    assert_not_nil CommonScopes::ByBoolean
  end

  test "should have sub-class ByDate" do
    assert_not_nil CommonScopes::ByDate
  end

  test "should have sub-class ByDatetime" do
    assert_not_nil CommonScopes::ByDatetime
  end

  test "should have sub-class ByInteger" do
    assert_not_nil CommonScopes::ByInteger
  end

  test "should have sub-class ByString" do
    assert_not_nil CommonScopes::ByString
  end

  test "should be included to Actor model" do
    assert Actor.include?(CommonScopes)
    binding.pry
    assert_respond_to Actor, :by_created_at
  end
end
