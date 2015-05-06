def add(num1, num2)
  current = num1
  shifted = num2

  until shifted == 0
    new_shift = current & shifted
    current = current ^ shifted
    shifted = new_shift << 1
  end

  current
end
