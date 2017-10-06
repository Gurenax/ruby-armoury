require 'test/unit'
require_relative 'lib/toolbelt'

class ToolbeltTest < Test::Unit::TestCase
    def test_random_length_string_generated
        expected_result = 400
        actual_result = Toolbelt.generate_string_of_length(expected_result)
        
        assert_equal(expected_result, actual_result.length)
    end

    def test_random_length_string_is_random
        length = 240
        first_result = Toolbelt.generate_string_of_length(length)
        second_result = Toolbelt.generate_string_of_length(length)
        
        assert_not_equal(first_result, second_result)
    end
end