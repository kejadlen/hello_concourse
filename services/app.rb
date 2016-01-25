require "open-uri"

require "minitest/autorun"

class TestApp < Minitest::Test
  def test_app
    hello = -> { "Hallos" }
    world = -> { "Wooorld" }
    app = App.new(hello, world)
    assert_equal "Hallos, Wooorld!", app.call({}).last[0]
  end
end

class App
  attr_reader :hello_service, :world_service

  def initialize(hello_service=nil, world_service=nil)
    @hello_service = hello_service || -> { open(ENV["HELLO_SERVICE"]).read }
    @world_service = world_service || -> { open(ENV["WORLD_SERVICE"]).read }
  end

  def call(env)
    hello = self.hello_service.call
    world = self.world_service.call
    ["200", {}, ["#{hello}, #{world}!"]]
  end
end
