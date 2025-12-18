-- Created by Ayush Biswas at 2025/12/18 21:36
-- https://atcoder.jp/contests/abc042/tasks/abc042_a
import Src.Cpio

-- @code begin

def solution : List (List Int) → String
| [phrases] => match phrases.toArray.qsort with
  | #[5, 5, 7] => "YES"
  | _ => "NO"
| _ => ""

def main : IO Unit :=
  open CPio in
  solve { withConfig with splitter := Splitter.NoSplitting } solution

-- @code end
