require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  should "be valid" do
    assert Report.new.valid?
  end
end
