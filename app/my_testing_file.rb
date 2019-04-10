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

#this below is equivalent to
('a'..'z').to_a.shuffle[0..7].join

#form an array of a to z lowercase chrs
lower_alp_arr = ('a'..'z').to_a

#shuffle the array and return the 0th to the 7th element, inclusive
shuffle_arr = lower_alp_arr.shuffle[0..7]

#return the string made from the joined array
puts new_str = shuffle_arr.join

#exercise 4.3.2
(0..16).each do |x|
    puts x ** 2
end

#above is equivalent to
(0..16).each {|x| puts x**2}

def yeller(arr)
    return arr.join.upcase
end

puts yeller(%w[o l d])

#same as above
def yeller_2(arr)
   upcase_arr = arr.map {|chr| chr.upcase}
   upcase_arr.join
end

puts yeller_2(%w[o l d])

#no arg needed
def random_subdomain
    letter_array = ('A'..'Z').to_a + ('a'..'z').to_a
    
    return(letter_array.shuffle[0..8].join)
end

puts random_subdomain

def string_shuffle(str)
    #first split string into array, shuffle array, then rejoin into string
    return str.split('').shuffle.join
end

puts string_shuffle('foobar')