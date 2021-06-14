成果物仮置き場

- docs/ 以下にhtmlに変換したファイルを置いて、github pagesで公開している
- Work in Progress

# htmlファイル作成方法

変換処理はmixタスク(elixir)で実装している。

```
docker run --rm -it \
  -v "$PWD":/usr/src/myapp \
  -v ${SRC_DIR}:/src \
  -v ${DIST_DIR}:/dist \
  -w /usr/src/myapp elixir:1.12 \
  bash -c "mix local.hex --force && mix deps.get && mix compile && mix tsuredzure"
```

- `SRC_DIR` 変換対象ファイルのフォルダトップ
- `DIST_DIR` htmlに変換したファイルが置かれるフォルダトップ（公開サイトのドキュメントルート）。本リポジトリではつまり `"$PWD"/docs` にあたる
