import Src.Cpio

-- @code begin

def fillOs (s : String) : Nat → String
  | 0     => s
  | n + 1   => fillOs ("o" ++ s) n

def solution : Int × List (List String) → String
| (n, s) => match s with
  | [[s]] => fillOs s (n - s.length).toNat
  | _ => ""

def main : IO Unit :=
  open CPio in
  solve { withConfig with splitter := Splitter.NoSplitting } solution

-- @code end
