# ADR-0001: mdBook と GitHub Actions（Pages）で Alloy 学習ブックを公開する

## Status

Accepted

## Context

このリポジトリで、形式手法である Alloy および AlloyTools が配布する Alloy Analyzer の導入から実践までを段階的に学べるブックをホストしたい。読者向けに静的サイトとして公開し、メンテナンスコストを抑えつつ CI でビルドとデプロイを自動化したい。

制約:

- 原稿は Markdown で管理する。
- GitHub Pages でホスティングする（プロジェクトサイト想定: `https://<owner>.github.io/alloy-book/`）。
- リポジトリに既存の Node フロントエンドがなく、ドキュメント専用の依存を増やしすぎない方がよい。

## Decision

- **ブック生成**: [mdBook](https://github.com/rust-lang/mdBook) を採用する。原稿はリポジトリの `book/` 以下に置き、`book.toml` と `src/SUMMARY.md` で章立てを管理する。
- **GitHub Pages へのデプロイ**: GitHub 公式の **Actions → Pages** フロー（`actions/upload-pages-artifact` と `actions/deploy-pages`）を採用する。`gh-pages` ブランチへ push する方式は採用しない（デプロイ成果物のブランチ管理を避ける）。
- **ベース URL**: プロジェクトサイトのため、公開 URL は `/alloy-book/` 配下になる。`book.toml` の `[output.html] site-url` には、編集用リンク等で使う **本番の完全 URL**（プレースホルダ `YOUR_GITHUB_USER` または README 記載の手順で置き換え）を設定し、**README および `book.toml` 冒頭コメント**に「フォーク後は `site-url` を自身の GitHub Pages URL に合わせる」と明記する。

## Consequences

### Pros

- 章立てが `SUMMARY.md` に集約され、書籍向けのナビゲーションと全文検索が標準で得られる。
- ビルドに Node.js を必須にしない（CI では固定バイナリを入れる想定）ため、再現性が高い。
- Pages の公式アーティファクト方式で、静的ファイルのみを `main` から分離して配信できる。

### Cons

- Vue 等を使ったリッチなインタラクティブ埋め込みは VitePress ほど手軽ではない。必要になれば別 ADR で方針を変える。

## Alternatives Considered

### Option 1: VitePress

- Summary: Vue / Vite ベースのドキュメントサイト生成。サイドバー柔軟、Vue コンポーネントで拡張しやすい。

- Reason not adopted: 本リポにフロントエンド用の `package.json` がなく、ブック専用に npm ツールチェーンを導入するコストとロックファイル管理が、現時点の目標（段階的なテキスト中心の学習ブック）に対して大きい。将来インタラクティブな補助が必要なら再検討する。

### Option 2: GitHub Pages（`gh-pages` ブランチ + 手動またはアクションで push）

- Summary: ビルド結果を `gh-pages` ブランチにコミットして公開する従来方式。

- Reason not adopted: 成果物ブランチの差分管理や権限周りの複雑さを避け、GitHub が推奨する **Pages アーティファクト** 一本にそろえた方が、メンテナンスが単純であるため。

## Links

- [mdBook](https://github.com/rust-lang/mdBook)
- [GitHub Pages: Configuring a publishing source for your GitHub Pages site](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)
- [upload-pages-artifact](https://github.com/actions/upload-pages-artifact)
- [Project documentation — Alloy](https://alloytools.org/documentation.html)

## Notes

- `site-url` のドメインはリポジトリのオーナー（ユーザーまたは Organization）に依存する。テンプレートのプレースホルダを実 URL に置き換えてから、編集誘導リンクを正しくしたい。
