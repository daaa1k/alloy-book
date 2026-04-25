# インストール

Alloy Analyzer は **Java ランタイム** 上で動作する配布物（JAR）や、**OS 向けのパッケージ**として提供されます。入手先は [Download](https://alloytools.org/download.html) および [GitHub Releases](https://github.com/AlloyTools/org.alloytools.alloy/releases) です（**[latest](https://github.com/AlloyTools/org.alloytools.alloy/releases/latest)** が常に最新の安定版です）。

## 1. Java の確認

ターミナルで次を実行し、Java が入っているか確認します。

```bash
java -version
```

Alloy 6 系では、公式 README でも **Java 17 以降の JVM** が前提とされています。`java -version` で満たない場合は [Eclipse Temurin](https://adoptium.net/) 等で入れてください。

## 2. 配布物の取得

次のいずれかを選びます。

- **JAR 単体**: どの OS でも共通。`java -jar org.alloytools.alloy.dist.jar` のように起動する。
- **OS 用アーカイブ**（.zip / .tar.gz 等）: 同梱スクリプトで起動しやすい。macOS では `.dmg` や `aarch64` / `amd64` の違いに注意。

リリース資産名は版ごとに変わるため、**必ず対象リリースの README を読んで**ファイルを選んでください。

## 3. 起動の確認

起動方法は配布物に依存します。典型例:

```bash
java -jar org.alloytools.alloy.dist.jar
```

GUI のウィンドウが開き、**空のエディタ**が表示されれば、まずは成功です。メニュー表記はバージョンで多少異なる場合があります。

## 4. バージョンの固定（推奨）

学習の途中で挙動が変わるのを防ぐため、**特定のリリースに固定**して進めるのがおすすめです。本ブックの例は **Alloy 6 系**を想定しています。確認時点の安定版は **6.2.0** ですが、**常に [最新リリース](https://github.com/AlloyTools/org.alloytools.alloy/releases/latest) の番号を正**としてください。自分の環境のバージョン（About 相当の画面や、同梱 CLI の `help` 等）をメモしておくとトラブル時に便利です。

## 次の章

まず [5分で価値を体験](quick-win.md) で、Analyzer 上の操作と結果の意味を掴みます。すでに Alloy を触ったことがある人も、**Execute / Show** という画面語で手順を揃え直す意味で読んでください。終わったら [最初のモデル](first-model.md) へ。
