require 'test_helper'

class DatabaseTest < ActiveSupport::TestCase
  should "be valid" do
    assert Database.new.valid?
  end
end
