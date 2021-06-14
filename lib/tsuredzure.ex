defmodule Tsuredzure do
  alias Tsuredzure.{Source, Converter, Distribution}

  def run do
    Source.all_path()
    |> Enum.each(fn path ->
      Converter.run(path)
      |> Distribution.create()
    end)
  end
end

defmodule Mix.Tasks.Tsuredzure do
  use Mix.Task

  def run(_) do
    Tsuredzure.run()
  end
end

