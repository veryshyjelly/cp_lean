-- Created by Ayush Biswas at 2025/12/22 19:19
-- https://atcoder.jp/contests/abc046/tasks/arc062_b
import Src.Cpio

-- @head begin
import Mathlib.Data.Int.Basic
-- @head end

-- @code begin

def score (Alice : List Char) (Bob : List Char) (acc : ℤ) : ℤ :=
  match Alice with
  | a :: as => match Bob with
    | b :: bs =>
      if a = 'g' ∧ b = 'p' then score as bs (acc - 1)
      else if a = 'p' ∧ b = 'g' then score as bs (acc + 1)
      else score as bs acc
    | [] => acc
  | [] => acc


def solution : List String -> ℤ
| [s] =>
  let n := s.length
  let x := List.replicate n ['g', 'p'] |>.flatten |>.take n
  score x s.toList 0
| _ => 0

def main : IO Unit :=
  open CPio in
  solve { withConfig with splitter := Splitter.NoSplitting } solution

-- @code end
