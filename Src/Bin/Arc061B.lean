-- Created by Ayush Biswas at 2025/12/21 18:22
-- https://atcoder.jp/contests/abc045/tasks/arc061_b
import Src.Cpio

-- @head begin
import Mathlib.Data.Int.Basic
import Std.Data.HashSet
-- @head end

-- @code begin
open Std

structure Point where
  x : ℕ
  y : ℕ
deriving Hashable, BEq

def countInRect (rect : Point) (colored : HashSet Point) : ℕ :=
  let r := List.range 3
    |>.map λ dx => List.range 3
    |>.map λ dy => Point.mk (rect.x + dx) (rect.y + dy)
  r.flatten.filter (λ x => colored.contains x) |>.length

def process
  (point : Point)
  (size : Point)
  (countColor : Array ℕ)
  (colored : HashSet Point)
  : (Array ℕ) × (HashSet Point) :=
  let (startx, stopx) := (point.x - 2, (size.x - 3).min point.x)
  let (starty, stopy) := (point.y - 2, (size.y - 3).min point.y)
  let newCount := List.range' startx (stopx - startx + 1) |>.map (λ x =>
    List.range' starty (stopy - starty + 1) |>.map λ y => (x, y)
  ) |>.flatten.foldl (λ cnts (x, y) =>
      let this_cnt := countInRect (Point.mk x y) colored
      let cnts := cnts.set! this_cnt (cnts[this_cnt]! - 1)
      cnts.set! (this_cnt + 1) (cnts[this_cnt + 1]! + 1)
  ) countColor
  (newCount, colored.insert point)

def solution : List (List ℕ) -> CPio.ListOf ℤ
| [h, w, n] :: abs =>
  let size := Point.mk h w
  let total := (h - 2) * (w - 2)
  let (cnt, _) := abs.foldl (
    λ (cnt, colored) ab =>
      process (Point.mk (ab[0]! - 1) (ab[1]! - 1)) size cnt colored
  ) (Array.replicate 10 0, HashSet.emptyWithCapacity n)
  let zero_cnt := total - cnt.sum
  CPio.ListOf.LinesOf (cnt.set! 0 zero_cnt |>.toList.map Int.ofNat)
| _ => CPio.ListOf.LinesOf []

def main : IO Unit :=
  open CPio in
  solve { withConfig with splitter := Splitter.NoSplitting } solution

-- @code end
