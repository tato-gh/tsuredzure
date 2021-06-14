defmodule TsuredzureTest do
  use ExUnit.Case

  test "処理を完了すること" do
    assert Tsuredzure.run() == :ok
  end

  test "mdファイルがhtmlファイルに変換されること" do
    clear_dist_dir()
    Tsuredzure.run()
    {:ok, content} = File.read(dist_file("./simple_1.html"))
    assert String.match?(content, ~r/<h1>これはテスト<\/h1>/u)
  end

  test "フォルダが作成されること" do
    clear_dist_dir()
    Tsuredzure.run()
    assert File.exists?(dist_file("./sample/"))
  end

  def dist_file(relative_path) do
    Path.join(Tsuredzure.Distribution.dir, relative_path)
  end

  def clear_dist_dir do
    File.rm_rf(Tsuredzure.Distribution.dir)
    File.mkdir(Tsuredzure.Distribution.dir)
  end
end
