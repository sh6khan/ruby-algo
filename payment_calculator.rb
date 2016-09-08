# given a price and an array of payments, return a subset of the payments
# that add up to the price, should it exists

# using a traditional backtracking algorithm


class PaymentValidator
  attr_accessor :price, :payments, :paid, :partial_payments

  def initialize(price, payments)
    @price = price
    @payments = payments
    @paid = 0
    @partial_payments = []
  end

  # using a traditional backtracking algorithm
  # we can recursviely call `valid_payment` each time
  # picking the next element in the payments array
  # if the next amount is over the price, then we backtrack
  # and choose the next element
  def valid_payment(count = 0)
    if paid == price
      return true
    end

    payments.each_with_index do |payment, index|
      next if index < count

      if underpaid?(payment)

        @paid += payment
        partial_payments.push(payment)
        puts "paid = #{paid}, payment = #{payment}, index = #{index}"

        if valid_payment(index + 1)
          return true
        end

        @paid -= payment
        partial_payments.delete(payment)
        puts "deleted payment = #{payment}, index = #{index}"
      end
    end

    return false
  end

  def underpaid?(amount)
    paid + amount <= price
  end
end

payment_validator = PaymentValidator.new(10, [8, 10, 1])
puts payment_validator.valid_payment
puts payment_validator.partial_payments
