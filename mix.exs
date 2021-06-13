defmodule Tsuredzure.MixProject do
  use Mix.Project

  def project do
    [
      app: :tsuredzure,
      version: "1.0.0",
      deps: deps()
    ]
  end

  defp deps do
    [
      # markdown
      {:earmark, "~> 1.4"}
    ]
  end
end
