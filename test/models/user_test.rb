require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a name" do 
    user = User.new
    assert !user.save
    assert !user.errors[:name].empty?
    
end

  test "a user should have a unique email address" do
    user = User.new
    user.name = users(:aaron).name
  
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

end
