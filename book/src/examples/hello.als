/**
 * Alloy 学習ブック: 「最初のモデル」用サンプル
 * リポジトリルートの examples/hello.als と同じ内容
 */
sig Book {}
sig Person { wrote: set Book }

pred show {}

run show for 3
