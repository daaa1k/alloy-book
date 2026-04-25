/**
 * Alloy 学習ブック: 「最初のモデル」用サンプル
 * 本リポジトリの book/src/first-model.md と対応
 */
sig Book {}
sig Person { wrote: set Book }

pred show {}

run show for 3
