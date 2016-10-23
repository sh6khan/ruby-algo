# Given a string S, you are allowed to convert it to a palindrome by adding characters in front of it.
# Find and return the shortest palindrome you can find by performing this transformation.
#
# For example:
#
# Given "aacecaaa", return "aaacecaaa".
#
# Given "abcd", return "dcbabcd".

def shortest_palindrome(string)
    return string if palindrome?(string)

    for i in 0...string.length
        rev = string.length - i
        suffix = string[(rev - 1)...string.length]
        rev_suffix = suffix.reverse

        new_string = rev_suffix + string
        return new_string if palindrome?(new_string)
    end
end

def palindrome?(string)
    string.reverse == string
end
