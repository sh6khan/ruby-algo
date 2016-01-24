# @param {String} s
# @return {String}

def remove_duplicate_letters(s)
    char_array = s.split('')
    
    hash = {}
    duplicates = []
    
    char_array.each_with_index do |char, index|
        if hash[char]
            duplicates.push(index)
        else
            hash[char] = true
        end
    end
    
    deleted = 0

    duplicates.each do |i|
        char_array.delete_at(i - deleted)
        deleted += 1
    end

    char_array = char_array.sort
    char_array = char_array.join('')

    
    return char_array
end

word = 'bcabc'
puts remove_duplicate_letters(word)