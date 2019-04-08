def palindrome_test(str = "")
    #!(str.empty?) returns true if the string is not empty
    #note that !str.empty? also works because ! is very high in operator precedence
    if str.reverse == str && !(str.empty?)
        return "yea it palindrome"
    else
        return "nah fam"
    end
end

puts palindrome_test("racecar")

puts palindrome_test("")

#note that palindrome_test returns a value instead of puts it, so .nil? returns false
puts palindrome_test("bruceli").nil?