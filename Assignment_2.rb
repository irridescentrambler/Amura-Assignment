# Refactor the below example codes.
# Rails code

# Example 1:
def get_addresses
  User.all.inject([]) do |addresses, user| 
    next addresses unless user.address.city
    addresses << user.address
  end
end

# Example 2:
class Greeting
  attr_accessor :name
end

# Example 3:
def sum(*inputs)
  inputs.inject{|result, number| result += number }
end

sum(2, 3) #=> 5
sum(1,2,3,4) # => 10
