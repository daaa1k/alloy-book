# Alloy 学習ブック全面再編（入門価値 + Analyzer 文言一致） 実装計画

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 承認済み設計 [docs/superpowers/specs/2026-04-25-alloy-book-restructure-design.md](../specs/2026-04-25-alloy-book-restructure-design.md) を mdBook 原稿として実装し、初学者が「Alloyを使う理由」から入り、画面文言（`Execute` / `Show` 等）と一致した手順で学べる本に再編する。

**Architecture:** 価値説明章（`why-alloy`）と短時間ハンズオン（`quick-win`）を前に出し、既存章を「設計上の意図」と UI 用語表（`analyzer-ui-glossary`）に揃えて改稿。実務導線は `practical-bridge` に集約し表を薄く保つ。検証の単一窓口は `cd book && mdbook build`（CI と同一）。

**Tech Stack:** mdBook（[CI の `MDBOOK_VERSION`](https://github.com/daaa1k/alloy-book/blob/main/.github/workflows/mdbook.yml) 参照）、原稿は `book/src/*.md`、Alloy サンプルは `book/src/examples/*.als` とリポジトリ直下 `examples/*.als` の二重管理（[README 方針](https://github.com/daaa1k/alloy-book/blob/main/README.md)）。ローカルは [`book/book.toml`](../../../book/book.toml) で設定。

---

## ファイル責務マップ

| ファイル | 責務 |
|----------|------|
| `book/src/why-alloy.md` | 設計課題と Alloy の価値（自然言語 vs モデル対比） |
| `book/src/quick-win.md` | 前提（インストール済み）で `run`/`check` + **Execute/Show** 語の導入 |
| `book/src/analyzer-ui-glossary.md` | アプリ画面ラベルとコード語（`run` 等）の対照・版差方針 |
| `book/src/practical-bridge.md` | CLI / LSP / CI の価値と**一つ**の次ステップ導線 |
| `book/src/SUMMARY.md` | 上記含む最終目次（情報設計の確定箇所） |
| `book/src/introduction.md` | 短い全体像 + 「次章はなぜ Alloy か」へ接続 |
| `book/src/installation.md` | 現状維持 + **次章リンクを `quick-win` に** |
| `book/src/first-model.md` | 既存例を価値主語で補い、用語表へリンク |
| `book/src/language-basics.md` | 用語中心の説明に再配置、一次情報参照を維持 |
| `book/src/analyzer.md` | **操作の「意味」**と UI 用語、トラブルシュート。抽象語だけの手順を禁止（設計方針） |
| `book/src/traces.md` | 前後章の位置づけ1段落追加でよい（内容は現状維持可） |
| `book/src/exercises.md` | 導線・用語表へのリンク1行。演習本文は意図的に `run`/`check` 残してよい（コード上の用語） |
| `book/src/next-steps.md` | 入門完了チェック + 二層ロードマップ + 公式リンク |

---

## ベースライン（実装前に1回）

- [ ] リポジトリルートで作業。`book/` が mdBook ルート（[`book/book.toml`](../../book/book.toml)）。

```bash
cd book && mdbook build
```

期待: 終了コード 0。失敗なら**再編作業に入る前**に直す（現状 main が緑であること）。

---

### Task 1: 新規4章（初稿）を追加する

**Files:**
- 新規: `book/src/why-alloy.md`
- 新規: `book/src/quick-win.md`
- 新規: `book/src/analyzer-ui-glossary.md`
- 新規: `book/src/practical-bridge.md`
- 検証: `mdbook test` は使わない（本リポ原稿に対話型テスト用ブロック未使用）。**`mdbook build` のみ**。

以下の4ファイル内容を、**改変せず**そのまま新規保存する（用語の表記揺れを避ける）。長さは学習用の最小。後続タスクで隣接章とすり合わせる。

- [ ] `why-alloy.md` を次の内容で作成

```markdown
# なぜ Alloy か

設計文書の多くは、意図は伝わるのに、**次の3つで詰まります**。

1. **曖昧さ** — 「全員に一意の担当者がある」のように、自然言語では解釈の余地が残る  
2. **境界の抜け** — 例外や「ありえない」経路の見落とし  
3. **主観的な合意** — コードレビューで「たぶんこう」に依存する

Alloy（言語）と Alloy Analyzer（ツール群）は、**小さな設計案を、制約として書き、機械的に解や反例を探す**のに使います。全コードを形式検証する、という意味ではなく、**仕様の骨格**を点検する用途が中心です。

## 自然言語と Alloy モデル

| 自然言語の例 | モデル上で起きること（イメージ） |
|-------------|----------------------------------|
| ユーザーは1つの組織にだけ属する | 多対一の関係として書く。反例を探して矛盾を出す |
| 転送中は一時的に二重所有あり得る | 時間や状態を導入し、不変条件（欲しい性質）を `check` する |

要するに、**曖昧な文を、関係と制約に置き換えて問い直す**道具です。

## このブックの読み方

1. まず [5分で価値を体験](quick-win.md) で、**ツール上で**「解が出る／出ない」が何を意味するか触る  
2. [最初のモデル](first-model.md) 以降で、表現力を少しずつ足す  
3. 画面の**ボタン名**は [Alloy Analyzer の UI 用語](analyzer-ui-glossary.md) に合わせる

次は **インストール**が未なら [インストール](installation.md)、済みなら [5分で価値を体験](quick-win.md) へ進んでください。
```

- [ ] `quick-win.md` を次の内容で作成

```markdown
# 5分で価値を体験

**前提:** [Alloy Analyzer を起動](installation.md) できること。

## この章のゴール

- ソースに書かれた `run` / `check` を、**ツール上では `Execute` で**実行し、**結果を `Show` で**見る  
- **SAT/UNSAT**（または同様の結果表記）を、「設計上、ありうる/矛盾している」に読み替えられる

## 手順

1. `New` で新規。エディタに下を貼り、**`Save`**（保存）する。

```alloy
sig Item {}
one sig Inventory {
  contains: set Item
}
pred someItems {
  #Inventory.contains > 0
}
run someItems for 3

assert noDupes { all i: Item | lone Inventory.contains }
check noDupes for 3
```

2. ツールバーから **`Execute`**（実行）— 上から順に、デフォルトで定義した `run` / `check` が走る動きを想定。実際の既定順は**版**で違うことがある。まず `run` 相当が選ばれていることを確認（メニューでコマンドを切り替えられる版もある）。  
3. 結果（解あり/なし 等）を確認し、**`Show`**（あるいは Visualizer/Theme へ進む導線）でインスタンスを眺める。  
4. 同じく **`Execute`** で `check` 側（`assert`）を走らせ、**反例が出るか/出ないか**を見る（版によって「次の解」「どの断片を走らせるか」の操作が違います。迷ったら [Alloy Analyzer の操作](analyzer.md)）。

## 何が得られたか

- **例がある**（`run` が満たす解を示す）= 想定世界が**一つは**成り立つ、という**具体例**  
- **性質に反例がある**（`check`）= 制約の書き方と意図が**食い違う**、という**手がかり**  
- どちらも、議論の「たぶん」に対する**手触り**になる

用語の対照は [Alloy Analyzer の UI 用語](analyzer-ui-glossary.md) を参照。次は [最初のモデル](first-model.md) で、小さなドメインを一緒に式にします。
```

- [ ] `analyzer-ui-glossary.md` を次の内容で作成

```markdown
# Alloy Analyzer の UI 用語

**方針:** 手順の本文では、**画面のラベル**（下表「このブックの呼び方」）を使う。コード断片内の `run` / `check` など**言語キーワード**はそのまま。

## 主なツールバー（例: Alloy 6.2.0 付近の GUI）

| このブックの呼び方 | ざっくり役割 | 補足 |
|-------------------|-------------|------|
| New | 新しいモデル |  |
| Open | ファイルを開く |  |
| Reload | 再読み込み |  |
| Save | 保存 | 手順不整合の多くは**未保存**が原因 |
| Execute | モデルに書かれた `run` / `check` 等を**ソルバに渡す** | 版で「何を**最初に**走らせるか」は異なる。メニューで対象を選べる版も |
| Show | インスタンスやグラフ**表示**系へ | 版で Visualizer/Theme との違いを確認 |

## 画面語と Alloy 言語

| 画面で行う操作の内容 | ソース上の用語（例） |
|---------------------|---------------------|
| 具体例（世界）を探す | `run`（述語） |
| 性質が常に成り立つか | `assert` + `check` |
| インスタンスの探索範囲 | `for` スコープ（例: `for 3`） |

**版差:** メニュー名が「Run」「Build」等に違う場合は、**手元の表示を正**とし、本ブックの表は「意味の地図」として読んでください。乖離を見つけたら [リポジトリ](https://github.com/daaa1k/alloy-book) へ指摘歓迎です。
```

- [ ] `practical-bridge.md` を次の内容で作成

```markdown
# 実務への接続

**この章の位置づけ:** 入門を終えたあと、**チームでどう続けるか**の地図だけ示す。深掘りは各公式ドキュメントへ。

| 手段 | できること | 入門者が次に取る一歩（例） |
|------|------------|----------------------------|
| **CLI**（配布 JAR 同梱） | 同じ `.als` を**非対話的に**実行、スクリプト化 | 手元の `help` 出力でサブコマンドを1つ通す。CI に載せるイメージは [演習](exercises.md) |
| **LSP** | エディタで診断・定義等（版による） | 好みのエディタの Alloy 拡張有無を調べ、Analyzer と**同じ配布**のドキュメントを正とする |
| **CI** | 検査の再現と共有 | リポジトリに `.als` を置き、ビルドで JAR 実行1本にする（詳細はチーム方針） |

**初版のスコープ:** 詳細手順の多数提示は行わない。常に [alloytools.org](https://alloytools.org) と[リリースノート](https://github.com/AlloyTools/org.alloytools.alloy/releases)を正とする。

次: [次の一歩](next-steps.md) で公式学習リソースを選ぶ。
```

- [ ] まだ `SUMMARY.md` は**触らない**（Task 2 で一括更新）。4ファイルの追加のみ。  
- [ ] 検証: 4ファイルの追加**だけ**では `mdbook build` に新章は乗らない。ビルドは次タスク以降で行う。

```bash
cd book && mdbook build
```

期待: **変化なし**で成功（新章未リンクのため、ビルド成果物の章目次に新規は出ない。これで問題なし）。

- [ ] コミット

```bash
git add book/src/why-alloy.md book/src/quick-win.md book/src/analyzer-ui-glossary.md book/src/practical-bridge.md
git commit -m "docs(book): add restructure draft chapters and ui glossary"
```

---

### Task 2: 目次（SUMMARY）を新情報設計に差し替える

**Files:**
- 変更: `book/src/SUMMARY.md`

- [ ] 全文を**次の内容**に置き換え

```markdown
# Summary

[はじめに](introduction.md)

[なぜ Alloy か](why-alloy.md)

---

[インストール](installation.md)

[5分で価値を体験](quick-win.md)

[最初のモデル](first-model.md)

[言語の基礎](language-basics.md)

[Alloy Analyzer の UI 用語](analyzer-ui-glossary.md)

[Alloy Analyzer の操作](analyzer.md)

[可変性とトレース（Alloy 6）](traces.md)

[演習](exercises.md)

[実務への接続](practical-bridge.md)

[次の一歩](next-steps.md)
```

- [ ] 検証

```bash
cd book && mdbook build
```

期待: 終了コード 0。`book/book/index.html` を開き、新章が目次に並ぶ（ローカルなら `mdbook serve` で確認可）。

- [ ] コミット

```bash
git add book/src/SUMMARY.md
git commit -m "docs(book): reorder summary for value-first flow"
```

---

### Task 3: `introduction.md` を短い導入に差し替え

**Files:**
- 変更: `book/src/introduction.md`

- [ ] 冒頭の「全パス説明」は維持しつつ、**次章を「なぜ Alloy か」**に。以下を参考に、既存の「想定読者」「バージョン」「用語」セクションを**畳まず**活かし、**導入段落と「次の章」**を差し替え（**バージョン番号 6.2.0 等**は [現行 introduction](https://github.com/daaa1k/alloy-book/blob/main/book/src/introduction.md) と**矛盾させない**）。

差し替え**最低限**（不足なら上記リンクの本文を併用）:

- 冒頭1〜2段落で「**まず価値（なぜ使うか）**→ 短い体験 → 基礎」と明示  
- `## 次の章` を次に変更

```markdown
## 次の章

- Alloy を**設計で**どう活かすか、まだイメージが薄い方は [なぜ Alloy か](why-alloy.md) から。  
- すでに導入の動機はある方も、上記章は短いので一読推奨です。  
- そのあと [インストール](installation.md) へ進み、起動できたら [5分で価値を体験](quick-win.md) です。
```

- [ ] 検証: `mdbook build` 成功。  
- [ ] コミット: `docs(book): refocus introduction on value-first path`

---

### Task 4: `installation.md` の「次の章」リンクを直す

**Files:**
- 変更: `book/src/installation.md`（末尾の「## 次の章」**のみ**、本文は要最小）

- [ ] 末尾を次に**置換**（既存の「最初のモデル」リンクを廃止）

```markdown
## 次の章

まず [5分で価値を体験](quick-win.md) で、Analyzer 上の操作と結果の意味を掴みます。すでに Alloy を触ったことがある人も、**Execute / Show** という画面語で手順を揃え直す意味で読んでください。終わったら [最初のモデル](first-model.md) へ。
```

- [ ] 検証: `mdbook build` 成功。  
- [ ] コミット: `docs(book): point installation to quick-win chapter`

---

### Task 5: `first-model.md` ・ `language-basics.md` の価値フックと用語表リンク

**Files:**
- 変更: `book/src/first-model.md`  
- 変更: `book/src/language-basics.md`

- [ ] `first-model.md` 冒頭に**短い**「この章で得ること」を追加（3箇条）。`## 手元で試す` 内の手順は、[UI 用語表](analyzer-ui-glossary.md)に合わせ、**`Run` という語で統一して書かれている**箇所があれば、**`Execute` + `Show`** 表記に直す。既存 `run show for 3` など**コード**は**変更しない**。  
- [ ] `language-basics.md` 冒頭に1段落: 「**この章の制約**は、設計上の**どんな問い**に答える表現か」を明示。`check` 説明の近くに [analyzer-ui-glossary](analyzer-ui-glossary.md) への相互リンク1行。  
- [ ] 検証: `mdbook build` 成功。  
- [ ] コミット: `docs(book): align early chapters with glossary and value framing`

---

### Task 6: `analyzer.md` の全面リフォーカス（方針どおり主語＝得られる知見 + UI 語手順）

**Files:**
- 変更: `book/src/analyzer.md`

- [ ] 章頭に「**この章で得られること**」と、用語表へのリンク。  
- [ ] 本文中の**読者手順**は、`Execute` / `Show` / `Save` 等、**[analyzer-ui-glossary](analyzer-ui-glossary.md)** の第一列の語に寄せる。`run`/`check` による説明**だけ**の段落は、必ず *「`Execute` でソルブを走らす」* のように橋をかける。  
- [ ] 「## CLI と LSP」節の直後に3〜5行: 「詳細手順は [実務への接続](practical-bridge.md) へ**委譲**」を追加（重複を避ける）。  
- [ ] 章末に**最小トラブルシュート**箇条書き3件: 未保存、スコープ狭すぎ、制約が強すぎ。  
- [ ] 検証: `mdbook build` 成功。  
- [ ] コミット: `docs(book): rewrite analyzer chapter around ui labels and outcomes`

---

### Task 7: `next-steps.md` を二層ロードマップ化

**Files:**
- 変更: `book/src/next-steps.md`

- [ ] 先頭に「## 入門完了のチェックリスト」（箇条3〜5件。仕様 [完了条件](../specs/2026-04-25-alloy-book-restructure-design.md) の「3分で理由を説明できる」等に対応）。  
- [ ] `## 目的別` を追加: **学習** / **研究** / **チーム導入** の3行。チーム導入は [実務への接続](practical-bridge.md) へ誘導。  
- [ ] 既存の「公式一次情報」等のセクションは**削除せず**、下に残す。  
- [ ] 検証: `mdbook build` 成功。  
- [ ] コミット: `docs(book): expand next steps with checks and two-layer map`

---

### Task 8: `traces.md` / `exercises.md` の導線と用語

**Files:**
- 変更: `book/src/traces.md`（任意: 2〜3文）  
- 変更: `book/src/exercises.md`

- [ ] `traces.md` 冒頭: 「入門本編の**時間・状態**の入口。先に [言語の基礎](language-basics.md) と [Alloy Analyzer の操作](analyzer.md) を**済ませる**のが安全」等の1段落。  
- [ ] `exercises.md` 先頭: 「**コード**では `run` / `check` という**言語の用語**を使う。**GUI** では [Alloy Analyzer の UI 用語](analyzer-ui-glossary.md) を参照」旨を1行。  
- [ ] 検証: `mdbook build` 成功。  
- [ ] コミット: `docs(book): cross-link exercises and traces to glossary`

---

### Task 9: サンプル二重管理の確認

**Files:**
- 参照: `book/src/examples/hello.als`  
- 参照: リポジトリ直下 `examples/hello.als`

- [ ] `quick-win` で**新ファイル名のサンプルを追加**した場合、**両方**同内容に揃える（[README 方針](https://github.com/daaa1k/alloy-book/blob/main/README.md)）。**本 Task 1 の初稿**は新しい `.als` を要求していなければ、**Task 8 の時点で差分不要**。もし以降の執筆で `book/src/examples/deep.als` を足したなら、必ず同じ `examples/deep.als` を作る。  
- [ ] コミット（差分があれば）: `docs(examples): sync repo and book example copies`

---

### Task 10: 最終検証と文面スポット

- [ ] ビルド

```bash
cd book && mdbook build
```

期待: 0。

- [ ] 次を手動grep（`rg` 可）。**手順中の**「`Run` ボタン」等、**大文字 Run が GUI 操作を指す表現**が残っていないか。残っていれば**Execute** 等へ。ただし **Markdown 中の**「`run` 述語」やコードフェンス内は**保持**。

```bash
cd book && rg 'Run' src/ -g '*.md' || true
```

解釈: `run` 小文字や ```alloy 内は無視。英語**Run** だけ**裸で**出てくる行があれば見直し。

- [ ] リポジトリ `README.md` の「原稿: book/src `SUMMARY`」等の**説明**が古いなら1段落だけ更新可（**仕様上必須ではない**）。  
- [ ] コミット: `chore: final mdbook restructure pass` または 変更なし。

---

## 自己レビュー（計画の妥当性）

1. **Spec カバレッジ:** 設計書の新章4つ・SUMMARY 再編・`introduction` 価値導線・`analyzer` 文言方針・`next-steps` 二層・`practical-bridge` 薄さ・`examples` 二重管理、すべてタスクに割当て済み。  
2. **プレースホルダ禁止:** 各タスクに具体ファイルと差分方針、検証コマンド、コミット例を明記。初稿4章は本文コピー可能な完全文を記載。  
3. **一貫性:** 新 `SUMMARY` の章タイトルと、各 `*.md` 先頭 H1 / 章内リンク名を揃える。`installation` 次章を `quick-win` に**固定**した。  

---

## 実装後の実行オプション

**Plan 完了: `docs/superpowers/plans/2026-04-25-alloy-book-restructure.md`**

実装の進め方は次の2通り:

1. **Subagent 駆動（推奨）** — タスクごとに新しいサブエージェントを起動し、タスク間でレビュー。速い反復。  
2. **インライン実行** — このセッションで `executing-plans` に従い、チェックポイントを置きながらまとめて実装。  

**どちらで進めますか？**（未指定なら 1 推奨。）
