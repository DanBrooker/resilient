require "test_helper"
require "resilient"

class ResilientTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Resilient::VERSION
  end
end