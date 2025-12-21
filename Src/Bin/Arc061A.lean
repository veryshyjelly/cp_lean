-- Created by Ayush Biswas at 2025/12/21 11:50
-- https://atcoder.jp/contests/abc045/tasks/arc061_a
import Src.Cpio

-- @head begin
import Mathlib.Data.Int.Basic
-- @head end

-- @code begin
def Char.parse (c : Char) : ℕ := c.toNat - '0'.toNat

def compute (s : List Char) (comb : ℕ) : ℕ :=
  let (total, curr, _) := s.drop 1
  |>.foldl (λ (total, curr, mask) si =>
    if mask &&& 1 = 1 then
      (total + curr, si.parse, mask>>>1)
    else
      (total, curr * 10 + si.parse, mask>>>1)
    ) (0, s[0]!.parse, comb)
  total + curr

def solution : List String -> ℤ
| [s] =>
  let n := s.length
  let s := s.toList
  List.range (1 <<< (n - 1)) |>.map (compute s) |>.sum
| _ => 0

def main : IO Unit :=
  open CPio in
  solve { withConfig with splitter := Splitter.NoSplitting } solution

-- @code end
