defmodule Tsuredzure.Converter do
  @moduledoc """
  pathを受け取って静的ページとして公開するための処理を行う

  pathの拡張子に従ってそれぞれ適当な処理を行う
  典型的にはマークダウンの内容をhtmlに変換する
  """

  def run(src_path) do
    run(Path.extname(src_path), src_path)
  end

  def run(".md", src_path) do
    md_content = File.read!(src_path)
    dist_path =
      convert_base_path_src_to_dist(src_path)
      |> String.replace(~r/\.md\z/, ".html")
    html_content = """
    <!DOCTYPE html>
    <head>
    <title> にむかひて </title>
    </head>
    <html lang="ja">
    <body>#{conv_md_to_html(md_content)}</body>
    </html>
    """
    {:markdown, html_content, dist_path}
  end

  def run(".html", src_path) do
    html_content = File.read!(src_path)
    {:html, html_content, convert_base_path_src_to_dist(src_path)}
  end

  def run("", src_path) do
    {:dir, "", convert_base_path_src_to_dist(src_path)}
  end

  def run(_, _) do
    {:other, "", nil}
  end

  def conv_md_to_html(md_content) do
    Earmark.as_html!(md_content, compact_output: true)
  end

  def convert_base_path_src_to_dist(path) do
    String.replace(path,
      Tsuredzure.Source.dir,
      Tsuredzure.Distribution.dir)
  end
end
