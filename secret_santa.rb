# write a script that simulates secret santa pairing

require 'minitest/autorun'

class Interview
  def create_pair(people)
    raise StandardError unless possible_solution?(people)

    people = people.shuffle

    pairs = []

    people.each_with_index do |person, index|
      next unless people[index + 1]
      pairs << {
        santa: person,
        child: people[index + 1]
      }
    end

    # circle the loop
    pairs << {
      santa: people.last,
      child: people.first
    }

    return pairs
  end

  def possible_solution?(people)
    total = people.length

    family_count = {}
    max = 0
    people.each do |person|
      last_name = person[:family]
      family_count[last_name] = 0 unless family_count[last_name]
      family_count[last_name] += 1

      max = [max, family_count[last_name]].max
    end

     return false if max > (total / 2)
     return true
  end
end

class Tests < Minitest::Test
  def setup
    @interview = Interview.new
  end

  def validate_secret_santa(pairs)
    pairs.each do |pair|
      puts "#{pair[:santa][:name]} got #{pair[:child][:name]}"
      return false if pair[:santa] == pair[:child]
    end
    return true
  end

  def test_one
    people = [
      {name: "Sadman", family: "Khan"},
      {name: "Bob", family: "Dylan"},
      {name: "Gary", family: "Cohn"},
      {name: "Elon", family: "Musk"},
      {name: "Steve", family: "Jobs"},
      {name: "Larry", family: "Summers"}
    ]

    pairs = @interview.create_pair(people)

    assert_equal(validate_secret_santa(pairs), true)
  end

  # checks if solution is possible, less then half of the people have to have the same last name
  def test_two
    people = [
      {name: "Sadman", family: "Khan"},
      {name: "Bob", family: "Dylan"},
      {name: "Gary", family: "Cohn"},
      {name: "Elon", family: "Musk"},
      {name: "Steve", family: "Jobs"},
      {name: "Larry", family: "Summers"}
    ]

    assert_equal(@interview.possible_solution?(people), true)

    people = [
      {name: "Sadman", family: "Khan"},
      {name: "Bob", family: "Khan"},
      {name: "Gary", family: "Khan"},
      {name: "Elon", family: "Khan"},
      {name: "Steve", family: "Jobs"},
      {name: "Larry", family: "Summers"}
    ]

    assert_equal(@interview.possible_solution?(people), false)
  end

  def test_three

  end

end
