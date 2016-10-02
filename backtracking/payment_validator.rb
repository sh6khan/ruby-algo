# given a price and an array of payments, return ALL subset of the payments
# that add up to the price, should it exists
# example
#
# price: 10
# payments: [7,3,1,2,4,6,11,15,20,5]

require 'minitest/autorun'


# using a traditional backtracking algorithm
class PaymentValidator
  attr_accessor :price, :payments, :paid

  def initialize(price, payments)
    @price = price
    @payments = payments
    @paid = 0
    @partial_payments = []
    @all_valid_payments = []
  end

  def show_all_valid_payments
    @all_valid_payments
  end

  # using a traditional backtracking algorithm
  # we can recursviely call `valid_payment` each time
  # picking the next element in the payments array
  # if the next amount is over the price, then we backtrack
  # and choose the next element
  def validate_payments

    # we want to run the back tracking aglorithm with each payment
    # as the original starting payment
    # we also only look forwards in the payments array in order to prevent
    # duplicate pairings. (i.e [1,2] and [2,1])
    @payments.each_with_index do |payment, index|

      current_payments = [payment]
      if backtrack_validate_payment?(payment, current_payments, index + 1)
        @all_valid_payments << current_payments
      end
    end
  end

  private

  # returns a boolean !!
  # this is super important to this kind of backtracking aglorithm
  def backtrack_validate_payment?(paid, current_payments, count)

    # return true if leaf node and is valid
    return true if paid == @price

    # return false if node is invalid
    return false if paid > @price

    # if not the leaf node, then look at each child node and apply
    # recursvie backtrack_validate_payment
    @payments.each_with_index do |payment, index|
      next if index < count

      current_payments << payment

      # this is where we branch.
      if backtrack_validate_payment?(paid + payment, current_payments, index + 1)
        return true
      end

      # if we we made it do this code path it means |payment| was not the
      # right choice, therefore we are removing it from the class variable
      current_payments.pop
    end

    # if we have reached the end of all the child nodes and there is nothing
    # then we can return false here
    return false
  end
end


# yay tests !
describe "PaymentValidator" do
  it "find all payments with one valid payment" do
    price = 10
    payments = [10]

    payment_validator = PaymentValidator.new(price, payments)
    payment_validator.validate_payments

    assert_equal([[10]], payment_validator.show_all_valid_payments)
  end

  it "find nothing with 0 payments" do
    price = 10
    payments = []

    payment_validator = PaymentValidator.new(price, payments)
    payment_validator.validate_payments

    assert_equal([], payment_validator.show_all_valid_payments)
  end

  it "should find all permuatations of payments" do
    price = 10
    payments = [7,3,1,2,4,6,11,15,20,5]

    payment_validator = PaymentValidator.new(price, payments)
    payment_validator.validate_payments

    expected = [
      [7, 3],
      [3, 1, 2, 4],
      [1, 4, 5],
      [4, 6]
    ]

    assert_equal(expected, payment_validator.show_all_valid_payments)
  end
end
