
require 'minitest/autorun'

def parse_roman_numeral(roman)
  arabic = 0
  index = 0
  map = {
    "X" => 10,
    "V" => 5,
    "I" => 1,
    "C" => 100,
    "L" => 50,
    "D" => 500,
    "M" => 1000
  }

  while (index < roman.length)
    current = roman[index]

    if current == "I" && (roman[index + 1] == "V" || roman[index + 1] == "X")
      arabic += map[roman[index + 1]] - 1
      index += 2
      next
    end

    if current == "X" && (roman[index + 1] == "L" || roman[index + 1] == "C")
      arabic += map[roman[index + 1]] - 10
      index += 2
      next
    end

    if current == "C" && (roman[index + 1] == "D" || roman[index + 1] == "M")
      arabic += map[roman[index + 1]] - 100
      index += 2
      next
    end

    arabic += map[current]
    index += 1
  end

  return arabic
end

describe "test" do
  it "should work" do
    assert_equal(8, parse_roman_numeral("VIII"))

    assert_equal(1954, parse_roman_numeral("MCMLIV"))
    assert_equal(2014, parse_roman_numeral("MMXIV"))
    assert_equal(1984, parse_roman_numeral("MCMLXXXIV"))
  end
end
