# はじめに

このブックは、[Alloy](https://alloytools.org) という形式手法向けのモデリング言語と、**Alloy Analyzer**（[AlloyTools](https://github.com/AlloyTools/org.alloytools.alloy) が配布するツール群）の使い方を、**インストールから一通りの操作**まで段階的に追えるようにまとめたものです。

読み方の骨格は次の通りです。**まず「なぜ Alloy か（設計で得られる価値）」**、続けて**短い体験**で操作と結果の意味を掴み、そのうえで**言語と Analyzer**の基礎に入ります。いきなり構文の細部から入らず、腹落ちしながら進められる構成にしています。

## このブックでできるようになること

- Alloy Analyzer を自分の環境に導入し、起動できる
- 小さなモデルを書き、**満たすインスタンス**の探索や **命題の検査** を実行できる
- GUI（エディタ・Visualizer）と、配布に含まれる **CLI** の基本を理解する
- さらに学ぶための一次情報へ進める

## 想定する読者

- プログラムや設計の仕様を、曖昧さを減らして書きたい人
- 形式手法に興味はあるが、どのツールから入るか迷っている人
- 既存の英語リソース（例: [Practical Alloy](https://practicalalloy.github.io/)）とあわせて、**日本語で導入のレール**が欲しい人

## 執筆上の注意（バージョン）

Alloy 6 系の構文とツール差分に依存する箇所があります。**2026 年 4 月時点**で [GitHub の最新安定リリース](https://github.com/AlloyTools/org.alloytools.alloy/releases/latest) は **Alloy 6.2.0**（2025-01-09 公開）です。新しい版が出たら、次を正としてください。

- [リリースノート](https://github.com/AlloyTools/org.alloytools.alloy/releases)（各版の変更点）
- [ドキュメント](https://alloytools.org/documentation.html)

乖離を見つけた場合は、本リポジトリへの指摘を歓迎します。

## 用語

- **Alloy**: 言語そのもの
- **Alloy Analyzer**: ソルブや可視化を行う中心ツール（本書では [alloytools.org の配布物](https://alloytools.org/download.html) に沿って説明します）

## 次の章

- Alloy を**設計で**どう活かすか、まだイメージが薄い方は [なぜ Alloy か](why-alloy.md) から。  
- すでに導入の動機はある方も、上記章は短いので一読推奨です。  
- そのあと [インストール](installation.md) へ進み、起動できたら [5分で価値を体験](quick-win.md) です。
