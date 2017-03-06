#"Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."

#Write a function that, given a sentence like the one above, along with the position of an opening parenthesis, finds the corresponding closing parenthesis.

#Example: if the example string above is input with the number 10 (position of the first parenthesis), the output should be 79 (position of the last parenthesis).

def find_matching_paren(sentence, position_open:)
    match_counter = 0
    current_position = position_open + 1

    while current_position < sentence.size do 
        case sentence[current_position]
        when '('
            match_counter += 1
        when ')'
            return current_position if  match_counter == 0
            match_counter -= 1
        end

        current_position += 1
    end

    raise "Paranthesis are not balanced"
end
