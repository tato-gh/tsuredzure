defmodule Tsuredzure.Source do
  @dir "/src/"
  @static_exts ~w(.html .jpeg .jpg .png .gif)

  def all_path do
    Path.wildcard("./**/")
  end

  def static?(path) do
    Enum.member?(@static_exts, Path.extname(path))
  end
end
