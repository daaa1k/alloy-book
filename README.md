# alloy-book

形式手法の [Alloy](https://alloytools.org) と、AlloyTools が配布する **Alloy Analyzer** の導入から基本操作までを、段階的に学べる学習ブックです。原稿は [mdBook](https://github.com/rust-lang/mdBook) でビルドし、**GitHub Pages** 向けの静的 HTML を [GitHub Actions](.github/workflows/mdbook.yml) が生成します。

## ドキュメント（公開先）

- **サイト（GitHub Pages）**  
  リポジトリの *Settings → Pages* で *GitHub Actions* を公開ソースにしたうえで、最初の `main` へマージ（または *workflow* の手動実行）の後、次の形になります（`<owner>` はユーザーまたは Organization 名）:

  `https://<owner>.github.io/alloy-book/`

- **意思決定（ADR）**  
  ドキュメント基盤の選定は [docs/adr/0001-mdbook-and-github-pages-for-alloy-book.md](docs/adr/0001-mdbook-and-github-pages-for-alloy-book.md) に記録しています。

## 初回（メンテナ用）

1. リポジトリをフォークまたは複製し、`book/book.toml` の次の各値を、自分の `owner` / リポジトリ名に合わせて置き換えます。
   - `git-repository-url`
   - `edit-url-template`
   - `site-url`（**末尾スラッシュ付き**の GitHub Pages URL）
2. *Settings → Pages* で *Build and deployment* の *Source* を **GitHub Actions** にする。
3. `main` にプッシュし、[Actions](.github/workflows/mdbook.yml) が成功したら、上記 `site-url` でサイトにアクセスする。

## ローカルでプレビュー

1. [mdBook のリリース](https://github.com/rust-lang/mdBook/releases) から、自分の OS 向けの `mdbook` バイナリを入れる。または [Rust ツールチェーン](https://rustup.rs/) 利用なら次でもよい: `cargo install mdbook --locked`
2. リポジトリルートで:

```bash
cd book
mdbook build   # 出力は book/book/
mdbook serve   # http://localhost:3000 で閲覧（ファイル変更のたび再読込）
```

CI で使うバイナリの版は、ワークフロー内の `MDBOOK_VERSION`（`.github/workflows/mdbook.yml`）に合わせると再現性が高いです。

## 原稿とサンプル

- 章: `book/src/*.md`、目次: `book/src/SUMMARY.md`（学習順は**価値の説明 → 短い体験 → 基礎**を意識し、[なぜ Alloy か](book/src/why-alloy.md) と [5分で価値を体験](book/src/quick-win.md) を前に出しています）
- Alloy サンプル: リポジトリ直下の `examples/*.als`（教材と同内容を `book/src/examples/` にも置き、ビルド済みサイトからダウンロード／参照できるようにしています。更新するときは **両方**を揃えてください。）

## 貢献

誤字・不整合の修正や演習案の PR を歓迎します。大きな技術方針の変更は、まず [docs/adr/](docs/adr/README.md) を確認し、必要なら新しい ADR を追加してください。

## ライセンス

リポジトリ内の [LICENSE](LICENSE) に従います。
