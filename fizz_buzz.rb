def fizz_buzz()
	(1..100).each do |num|
		fizz = true if num % 3 == 0
		buzz = true if num % 5 == 0

		if (fizz && buzz)
			puts 'fizzbuzz'
		elsif (fizz)
			puts 'fizz'
		elsif (buzz)
			puts 'buzz'
		else
			puts num	
		end
	end
end

fizz_buzz