-- Created by Ayush Biswas at 2025/12/22 19:02
-- https://atcoder.jp/contests/abc046/tasks/arc062_a
import Src.Cpio

-- @head begin
import Mathlib.Data.Int.Basic
-- @head end

-- @code begin

def solution : List (List ℕ) -> ℤ
| [_] :: tas =>
  let (a, b) := match tas with
  | [a, b] :: tas => tas.foldl (λ (a, b) cd =>
    let (c, d) := (cd[0]!, cd[1]!)
    let k := Nat.max ((a + c - 1) / c) ((b + d - 1) / d)
    (c*k, d*k)
  ) (a, b)
  | _ => (0, 0)
  a + b
| _ => 0

def main : IO Unit :=
  open CPio in
  solve { withConfig with splitter := Splitter.NoSplitting } solution

-- @code end
