#"f.o" => "foo"
#"foo" => "foo bar baz"
#"b.z" => "boz"
#"f.o" => "foo bar baz"
#"b.z" => "foo bar baz"
#"boz" != "foo bar baz"

def match(pattern, example)
  !example.match(pattern).nil?
end

def match2(pattern, example)
  if example.empty? || pattern.empty?
    return true
  end

  example.chars.each_with_index do |ch, index|
    if (pattern[0] == ch || pattern[0] == '.')
      return match2(
        pattern.slice(1, pattern.length),
        example.slice(index + 1, example.length)
      )
    end
  end

  false
end

