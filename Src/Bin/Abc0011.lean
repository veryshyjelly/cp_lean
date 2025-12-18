-- Created by Ayush Biswas at 2025/12/18 18:23
-- https://atcoder.jp/contests/abc001/tasks/abc001_1
import Src.Cpio

-- @code begin

def solution : List (List Int) → Int
| [h₁] :: [h₂] :: _ => h₁ - h₂
| _ => 0

def main : IO Unit :=
  open CPio in
  solve { withConfig with splitter := Splitter.NoSplitting } solution

-- @code end
