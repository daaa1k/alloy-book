# 可変性とトレース（Alloy 6）

本編では**時間と状態**の入り口に立つ章です。先に [言語の基礎](language-basics.md) と [Alloy Analyzer の操作](analyzer.md)（必要なら [Alloy Analyzer の UI 用語](analyzer-ui-glossary.md)）を済ませておくと、トレースの読み方がつかみやすいです。

Alloy 6 では、**可変な状態**や**実行のトレース**を扱う表現が強化され、より「振る舞い」の探索に近づけます。一次情報は [Alloy 6 の紹介](https://alloytools.org/alloy6.html) と [ドキュメント](https://alloytools.org/documentation.html) を参照してください。

## 何のための章か

- **ある初期状態**から**遷移の列**を探索し、仕様が意図した通りかを見る
- 不変条件が**トレース全体**で保たれるかを `check` で押さえる

## 学び方のすすめ

1. まず小さな **遷移システム**（数行の `sig` と `pred`）で `run` し、Visualizer で**列**として見る
2. `util/ordering` など、標準ライブラリの慣用に慣れる
3. スコープを上げる前に、**遷移の長さ**や**状態の大きさ**を分けて調整する

このブックでは入り口のみ示し、本文の深掘りは公式資料と [Practical Alloy](https://practicalalloy.github.io/) 等へ委ねます。

## 次の章

[演習](exercises.md) で手を動かしましょう。
