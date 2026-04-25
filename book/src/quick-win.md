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
