def subtract(num1, num2)
  current = num1
  shifted = num2

  until shifted == 0
    subtracted = current & shifted

    current = current | shifted
    current = current ^ subtracted

    shifted = shifted ^ subtracted
    shifted = shifted << 1
  end

  current
end
