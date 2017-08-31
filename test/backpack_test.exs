defmodule BackpackTest do
  use ExUnit.Case
  doctest Backpack

  test "greets the world" do
    assert Backpack.hello() == :world
  end
end
