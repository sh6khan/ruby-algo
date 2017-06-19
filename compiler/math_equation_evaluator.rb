require "set"


def evaluate(expression)
  values = []
  ops = []
  index = 0
  operations = Set.new ["+", "-", "*", "/"]

  while (index < expression.length)
    # Skip blank spaces
    if expression[index] == " "
      index += 1
      next
    end

    # extract number from String and place into values stack
    if (expression[index] >= "0" && expression[index] <= "9")
      num = ""
      while (index < expression.length && expression[index] >= "0" && expression[index] <= "9")
        num += expression[index]
        index += 1
      end

      values.push(num.to_i)
    end

    # place opening bracket into stack
    if (expression[index] == "(")
      ops.push(expression[index])
      index +=1
      next
    end

    if (expression[index] == ")")
      while(ops.last != "(")
        values.push(apply_operation(ops.pop, values.pop, values.pop))
      end
      ops.pop

      index +=1
      next
    end

    if (operations.include?(expression[index]))
      while (!ops.empty? && ops.last != "(")
        values.push(apply_operation(ops.pop, values.pop, values.pop))
      end

      ops.push(expression[index])
    end

    index += 1
  end

  # evaluate remainging operations
  while (!ops.empty?)
    values.push(apply_operation(ops.pop, values.pop, values.pop))
  end

  puts values.last
end

def apply_operation(operation, value1, value2)
  if operation == "+"
    return value1 + value2
  elsif operation == "-"
    return value2 - value1
  elsif operation == "/"
    return value2 / value1
  elsif operation == "*"
    return value1 * value2
  end

  return 0
end


evaluate("6 * (3 / 3 + 1 + 1)")
