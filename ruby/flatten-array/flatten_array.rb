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
      if v.instance_of?(Array)
        v = flatten(v)
        out.concat(v)
      else
        out << v
      end
    end
    out
  end
end
