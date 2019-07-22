=begin
There is a User class and User class has a status attribute.
Now that status attr can have so many values like active, inactive, pending, and so on.

Implement the instance method such that I can call that method like below.
  
@user.active?
@user.inactive?
.
.


The output of the above should be Boolean value i.e true or false.
Create a ruby class to accomplish this and follow the best practices.
=end

class User
  attr_accessor :status
  ["active", "inactive", "pending"].each do |method_name|
    define_method("#{method_name}?") do
      status == method_name
    end
  end
end
