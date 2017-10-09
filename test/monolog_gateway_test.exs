defmodule MonologGatewayTest do
  use ExUnit.Case
  doctest MonologGateway

  test "greets the world" do
    assert MonologGateway.hello() == :world
  end
end
