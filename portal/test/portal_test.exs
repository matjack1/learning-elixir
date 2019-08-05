defmodule PortalTest do
  use ExUnit.Case
  doctest Portal

  test "push right and left through portal" do
    Portal.shoot(:red)
    Portal.shoot(:white)
    portal = Portal.transfer(:red, :white, [1, 2, 3])

    Portal.push_right(portal)
    assert Portal.Door.get(:red) == [2, 1]
    assert Portal.Door.get(:white) == [3]

    Portal.push_left(portal)
    assert Portal.Door.get(:red) == [3, 2, 1]
    assert Portal.Door.get(:white) == []
  end
end
