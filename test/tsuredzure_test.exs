defmodule TsuredzureTest do
  use ExUnit.Case

  test "処理を完了すること" do
    assert Tsuredzure.run() == :ok
  end
end
