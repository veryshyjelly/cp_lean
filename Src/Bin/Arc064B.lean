-- Created by Ayush Biswas at 2025/12/23 12:39
-- https://atcoder.jp/contests/abc048/tasks/arc064_b
import Src.Cpio

-- @head begin
import Mathlib.Data.Int.Basic
-- @head end

-- @code begin

def solution : List String -> String
| [s] =>
  if h : s.length >= 3 then
    let s' := s.toList

    have h₂ : s' ≠ [] := by
      intro hs
      cases s with | mk data => simp_all [s']

    have : 0 < s'.length := by rw [List.length_pos_iff]; simpa

    if xor (s'[0] = s'.getLast h₂) (2∣s.length)
    then "Second"
    else "First"

  else ""
| _ => ""

def main : IO Unit :=
  open CPio in
  solve { withConfig with splitter := Splitter.NoSplitting } solution

-- @code end
