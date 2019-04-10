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

#exercise 4.3.1
a = "A man, a plan, a canal, Panama".split(', ')
puts a

s = a.join
puts s

k = s.split
l = k.join
puts palindrome_test(l)
puts palindrome_test(l.downcase)

puts ('a'..'z').to_a[6]
puts ('a'..'z').to_a.reverse[6]
puts ('a'..'z').to_a[-7]