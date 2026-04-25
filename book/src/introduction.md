# はじめに

このブックは、[Alloy](https://alloytools.org) という形式手法向けのモデリング言語と、**Alloy Analyzer**（[AlloyTools](https://github.com/AlloyTools/org.alloytools.alloy) が配布するツール群）の使い方を、**インストールから一通りの操作**まで段階的に追えるようにまとめたものです。

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

[インストール](installation.md) から、自分の PC に Analyzer を導入しましょう。
