require_relative "./add"
require_relative "./subtract"

def multiply(num1, num2)
  return 0 if num1 == 0 || num2 == 0
  base = num1
  until num2 <= 1
    num1 = add(num1, base)
    num2 = subtract(num2, 1)
  end
  num1
end
