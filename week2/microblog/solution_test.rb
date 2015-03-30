
require 'minitest/autorun'
require './solution.rb'

class TestBlog < Minitest::Test
  def test_db_connection
    assert_operator db_connect.execute(
      'SELECT count(*) FROM myposts')[0][0], :>, 0
  end
end
