class Transaction
  attr_reader :from, :to, :amount

  def initialize(from, to, amount)
    @from = from
    @to = to
    @amount = amount
  end
end

class Interview
  def initialize
    @ledger = {}
    @simplified_transactions = []
  end
  
  def new_bill(payer, split_between, amount, paid_for = false)

    num_people = paid_for ? split_between.length : split_between.length + 1
    single_bill = amount / num_people

    @ledger[payer] = 0 if !@ledger[payer]

    add_to_ledger(split_between, payer, single_bill)
  end

  def add_to_ledger(split_between, payer, single_bill)
    split_between.each do |name|
      @ledger[name] = 0 if !@ledger[name]

      @ledger[name] -= single_bill
      @ledger[payer] += single_bill
    end
  end

  def get_dept(name)
    return @ledger[name]
  end

  def simp_depts
  end


end

require 'minitest/autorun'

class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_add_bill
    payer = 'sarah'
    split_between = ['fred', 'sadman', 'charlie']
    amount = 100.00

    @interview.new_bill(payer, split_between, amount)

    assert_equal(75, @interview.get_dept('sarah'))
    assert_equal(-25, @interview.get_dept('fred'))
    assert_equal(-25, @interview.get_dept('charlie'))
    assert_equal(-25, @interview.get_dept('sadman'))

    payer = 'fred'
    split_between = ['sarah', 'charlie', 'sadman']
    amount = 100.00

    @interview.new_bill(payer, split_between, amount)

    assert_equal(50, @interview.get_dept('sarah'))
    assert_equal(50, @interview.get_dept('fred'))
    assert_equal(-50, @interview.get_dept('charlie'))
    assert_equal(-50, @interview.get_dept('sadman'))
  end

  def test_simplify_depts
  end
end

