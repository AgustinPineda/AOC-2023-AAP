import(Unicode)

digit_keys = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
digit_values = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
words = Dict(digit_keys[i] => digit_values[i] for i in 1:9)

function find_first_digit(line::AbstractString)
    for i in 1:length(line)
        if isdigit(line[i])
            return(line[i])
    	end
        for key in keys(words)
            if i+length(key)-1 <= length(line)
                if line[i:(i+length(key)-1)] == key
                    return(words[key])
                end
            end
        end
    end
end

function find_last_digit(line::AbstractString)
    for i in length(line):-1:1
        if isdigit(line[i])
            return(line[i])
        end
        for key in keys(words)
            if i+length(key)-1 <= length(line)
                if line[i:(i+length(key)-1)] == key
                    # Not sure if better to return the dictionary value
                    # or the index
                    return(words[key])
                end
            end
        end
    end
end

# function find_first_word(str::AbstractString, dictionary::Dict)
#     # Returns the digit character of the first digit spelled as a word
#     for i in 1:length(str)
#         for key in keys(dictionary)
#             if str[i:(i+length(key)-1)] == key
#                 return(dictionary[key])
#             end
#         end
#     end
# end
# 
# function find_last_word(str::AbstractString, dictionary::Dict)
#     # Returns the index of the last digit spelled as a word
#     # TODO: modify find_first_word to find_last_word without
#     #       going to a string index that doesn't exist
#     for i in length(str):-1:1
#         for key in keys(dictionary)
#             if i+length(key)-1 <= length(str)
#                 if str[i:(i+length(key)-1)] == key
#                     # Not sure if better to return the dictionary value
#                     # or the index
#                     return(dictionary[key])
#                 end
#             end
#         end
#     end
# end

cal_doc = open("TrebuchetData.txt")
lines = readlines(cal_doc)

global sum = 0
for line in lines
    first = find_first_digit(line)
    last = find_last_digit(line)
    global sum += parse(Int, first*last)
end

println(sum)

close(cal_doc)
