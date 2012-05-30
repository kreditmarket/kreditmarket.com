require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  test "should_generate_token" do
   @request = FactoryGirl.create(:request)
   assert_not_nil @request.token
  end
end
