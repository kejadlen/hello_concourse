require "minitest/autorun"

class TestWorld < Minitest::Test
  def test_world
    world = World.new
    assert_equal "World", world.call({}).last[0]
  end
end

class World
  def call(env)
    ["200", {}, ["World"]]
  end
end
