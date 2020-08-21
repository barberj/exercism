=begin
Write your code for the 'Flatten Array' exercise in this file. Make the tests in
`flatten_array_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/flatten-array` directory.
=end

class FlattenArray
  def self.flatten(input)
    out = []
    input.each do |v|
      next if v.nil?
      v = v.instance_of?(Array) ?  flatten(v) : [v]
      out.concat(v)
    end
    out
  end
end
