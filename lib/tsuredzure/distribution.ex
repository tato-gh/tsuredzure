defmodule Tsuredzure.Distribution do
  @dir "/dist/"

  def create({path, content}), do: create(path, content)

  def create(path, content) do
    {path}
  end
end
