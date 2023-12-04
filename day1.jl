import(Unicode)

function find_first_digit(line::String)
    for i in 1:length(line)
        if isdigit(line[i])
            return(line[i])
    	end
    end
end

function find_last_digit(line::String)
    for i in length(line):-1:1
        if isdigit(line[i])
            return(line[i])
        end
    end
end


cal_doc = open("day1_data.txt")
lines = readlines(cal_doc)

global sum = 0
for line in lines
    first = find_first_digit(line)
    last = find_last_digit(line)
    global sum += parse(Int, first*last)
end

println(sum)

close(cal_doc)
