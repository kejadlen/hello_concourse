require "minitest/autorun"

class TestHello < Minitest::Test
  def test_hello
    hello = Hello.new
    assert_equal "Hello", hello.call({}).last[0]
  end
end

class Hello
  def call(env)
    ["200", {}, ["Hello"]]
  end
end
