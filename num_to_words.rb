def num_to_words(num)
  single_digits = ["zero","one","two","three","four","five","six","seven","eight","nine"]
  double_digits = ["","eleven", "tweleve", "thirteen", "fourteen", "fifteen","sixteen", "seventeen", "eighteen", "nineteen"]
  tens = ["", "ten", "twenty","thirty","fourty","fifty","sixty","seventy","eighty","ninety"]
  hundreds = ["hundred", "thousand"]

  string_rep = ""
  if num.length == 1
    return single_digits[num.to_i]
  end

  len = num.length

  for i in 0...num.length
    if len == 3
      string_rep += single_digits[num[0].to_i] + " " + hundreds[len - 3] + " "
      len -= 1
    else
      if num[i] == "1"
        string_rep += double_digits[(num[i] +  num[i+1]).to_i - 10]
        return string_rep
      else
        string_rep += tens[num[i].to_i] + " " + single_digits[num[i+1].to_i]
        return string_rep
      end
    end
  end
end

puts num_to_words("123")
