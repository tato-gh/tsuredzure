defmodule Tsuredzure.Source do
  @static_exts ~w(.html .jpeg .jpg .png .gif)

  def all_path do
    Path.wildcard(dir() <> "/**/")
  end

  def static?(path) do
    Enum.member?(@static_exts, Path.extname(path))
  end

  def dir do
    Application.get_env(:tsuredzure, :source_dir)
  end
end
