defmodule Tsuredzure.Distribution do
  def create({t, p, c}), do: create(t, p, c)

  def create(:dir, _, path) do
    create_dist_dir_if_not_exist(path)
  end

  def create(:markdown, content, path) do
    File.write(path, content)
  end

  def create(:other, _, nil), do: :nothing_to_do

  def dir do
    Application.get_env(:tsuredzure, :distribution_dir)
  end

  def create_dist_dir_if_not_exist(dir_path) do
    if File.exists?(dir_path),
      do: :ok,
      else: File.mkdir_p!(dir_path)
  end
end
