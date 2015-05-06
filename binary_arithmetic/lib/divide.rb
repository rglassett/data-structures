require_relative "./add"
require_relative "./subtract"

def divide(num1, num2)
  raise ZeroDivisionError if num2 == 0
  count = 0
  until num1 < num2
    num1 = subtract(num1, num2)
    count = add(count, 1)
  end
  count
end
