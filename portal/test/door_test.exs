defmodule Portal.DoorTest do
  use ExUnit.Case
  doctest Portal.Door

  test "get empty door" do
    Portal.Door.start_link(:blue)
    assert Portal.Door.get(:blue) == []
  end

  test "get door after one push" do
    Portal.Door.start_link(:blue)
    Portal.Door.push(:blue, 1)
    assert Portal.Door.get(:blue) == [1]
  end

  test "get pop value after one push" do
    Portal.Door.start_link(:blue)
    Portal.Door.push(:blue, 1)
    assert Portal.Door.pop(:blue) == {:ok, 1}
  end
end
