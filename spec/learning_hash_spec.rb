require_relative '../learning_hash'

RSpec.describe LearningHash do
  describe '#foo_key' do
    inputs_and_outputs = [
      {input: {foo: 'bar', not_foo: 'baz'}, output: 'bar'},
      {input: {}, output: nil},
      {input: {[1,2] => [5,6], foo: [3,4]}, output: [3,4]},
      {input: {magic_number: 13, foo: 12}, output: 12},
      {input: {bar: 'foo', foos: :foo, close: :not_enough}, output: nil},
    ]

    inputs_and_outputs.each do |expectation_hash|
      input = expectation_hash[:input]
      output = expectation_hash[:output]

      it "given #{input} returns the value of the :foo (Symbol) key (#{output})" do
        expect(LearningHash.new.foo_key(input)).to eq(output)
      end
    end
  end

  describe '#bar_key' do
    inputs_and_outputs = [
      {input: {}, output: nil},
      {input: {foo: 'bar'}, output: nil},
      {input: {bar: [1,2,3], keyz: 'yup'}, output: [1,2,3]},
      {input: {bar: {nested_hashes: 'are awesome'}}, output: {nested_hashes: 'are awesome'}}
    ]

    inputs_and_outputs.each do |expectation_hash|
      input = expectation_hash[:input]
      output = expectation_hash[:output]

      it "given #{input} returns the value of the :bar (Symbol) key (#{output})" do
        expect(LearningHash.new.bar_key(input)).to eq(output)
      end
    end
  end

  describe '#key_stringer' do
    inputs_and_outputs = [
      {input: {}, output: ''},
      {input: {nil => 'stuff'}, output: ''},
      {input: {nil: nil}, output: 'nil'},
      {input: {foo: 'bar', 'baz' => 'also'}, output: 'foobaz'},
      {input: {nil: nil, 'not_nil': 'not nil also'}, output: 'nilnot_nil'},
      {input: {nil: 'nil', 'nil': 'not nil also'}, output: 'nil'},
      {input: {[1,2,3] => 'yup', 'nope' => [1,2,3]}, output: '[1, 2, 3]nope'}
    ]

    inputs_and_outputs.each do |expectation_hash|
      input = expectation_hash[:input]
      output = expectation_hash[:output]

      it "given #{input} returns #{output}" do
        expect(LearningHash.new.key_stringer(input)).to eq(output)
      end
    end
  end

  describe '#value_stringer' do
    inputs_and_outputs = [
      {input: {nil => 'ruby is cool', nil: ' and weird'}, output: 'ruby is cool and weird'},
      {input: {[1,2,3] => [256,512,1024]}, output: '[256, 512, 1024]'},
      {input: {'foo': 'bar', 'moot' => 'ski'}, output: 'barski'},
      {input: {}, output: ''},
      {input: {{} => 'fooza'}, output: 'fooza'}
    ]

    inputs_and_outputs.each do |expectation_hash|
      input = expectation_hash[:input]
      output = expectation_hash[:output]

      it "given #{input} returns #{output}" do
        expect(LearningHash.new.value_stringer(input)).to eq(output)
      end
    end
  end

  describe '#key_and_value_stringer' do
    inputs_and_outputs = [
      {input: {foo: 'bar', 'baz' => 'hi'}, output: 'foobarbazhi'},
      {input: {[1] => [1,2]}, output: '[1][1, 2]'},
      {input: {}, output: ''},
      {input: {nil => 'yup'}, output: 'yup'},
      {input: {nil => 'yup', nil: 'nope'}, output: 'yupnilnope'},
      {input: {nil => 'yup', 'foo': 'nope'}, output: 'yupfoonope'}
    ]

    inputs_and_outputs.each do |expectation_hash|
      input = expectation_hash[:input]
      output = expectation_hash[:output]

      it "given #{input} returns #{output}" do
        expect(LearningHash.new.key_and_value_stringer(input)).to eq(output)
      end
    end
  end

  describe '#reversed_key_and_value_stringer' do
    inputs_and_outputs = [
      {input: {foo: 'bar', 'baz' => 'hi'}, output: 'ihzabraboof'},
      {input: {[1] => [1,2]}, output: ']2 ,1[]1['},
      {input: {}, output: ''},
      {input: {nil => 'yup'}, output: 'puy'},
      {input: {nil => 'yup', nil: 'nope'}, output: 'eponlinpuy'},
      {input: {nil => 'yup', 'foo': 'nope'}, output: 'eponoofpuy'}
    ]

    inputs_and_outputs.each do |expectation_hash|
      input = expectation_hash[:input]
      output = expectation_hash[:output]

      it "given #{input} returns #{output}" do
        expect(LearningHash.new.reversed_key_and_value_stringer(input)).to eq(output)
      end
    end
  end

  describe '#polite_is_empty?' do
    inputs_and_outputs = [
      {input: {}, output: "Yes ma'am"},
      {input: {nil => 'yup'}, output: "No ma'am"},
      {input: {finally_not_foo: 'but still foo'}, output: "No ma'am"},
      {input: {'other stuff' => 'yup'}, output: "No ma'am"},
      {input: {[1,2,3] => nil}, output: "No ma'am"}
    ]

    inputs_and_outputs.each do |expectation_hash|
      input = expectation_hash[:input]
      output = expectation_hash[:output]

      it "given #{input} returns #{output}" do
        expect(LearningHash.new.polite_is_empty?(input)).to eq(output)
      end
    end
  end
end
