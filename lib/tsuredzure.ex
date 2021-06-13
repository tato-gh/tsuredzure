defmodule Mix.Tasks.Tsuredzure do
  use Mix.Task

  def run(_) do
    IO.inspect Earmark.as_html!("# Hello world")
  end
end
