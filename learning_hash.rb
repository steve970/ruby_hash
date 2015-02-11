# Any method in http://ruby-doc.org/core-2.2.0/Hash.html or http://ruby-doc.org/core-2.2.0/String.html is fair game to use. It is encouraged that you peruse through both as you work through the problems.

class LearningHash
  def foo_key(hash)
    hash[:foo]
  end

  def bar_key(hash)
    hash[:bar]
  end

  def key_stringer(hash)
    result = ''
    hash.each_key do |key|
      result << key.to_s
    end
    result
  end

  def value_stringer(hash)
    result = ''
    hash.each_value do |value|
      result << value.to_s
    end
    result
  end

  def key_and_value_stringer(hash)
    result = ''
    hash.each do |key, value|
      result << key.to_s + value.to_s
    end
    result
  end

  def reversed_key_and_value_stringer(hash)
    #result = ''
    #hash.each do |key, value|
    #  result << key.to_s + value.to_s
    #end
    #result.reverse
    key_and_value_stringer(hash).reverse
  end

  def polite_is_empty?(hash)
    if hash.size = 0
      "Yes ma'am"
    else
      "No ma'am"
    end
  end

end
