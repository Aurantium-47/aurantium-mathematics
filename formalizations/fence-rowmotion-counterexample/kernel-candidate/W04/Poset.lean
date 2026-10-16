import Mathlib.Data.Fintype.Fin
import Mathlib.Data.Finset.Card
import Mathlib.Order.Preorder.Chain

/-!
The 32-vertex fence, with paper vertex labels obtained by adding one.
The numerical order on `Fin 32` is NOT the fence order: every order-theoretic
statement below uses `FLe`, or the explicitly supplied structure `fenceOrder`.
All finite certificates in this module are checked by the Lean kernel.
-/

namespace W04

set_option maxRecDepth 100000
set_option maxHeartbeats 0

abbrev Vertex := Fin 32
abbrev Segment := Fin 11

/-- The principal lower ideals of the fence, including their generating vertex. -/
def lower (y : Vertex) : Finset Vertex :=
  match y.val with
  | 0 => {0}
  | 1 => {0, 1}
  | 2 => {0, 1, 2, 3, 4, 5}
  | 3 => {3, 4, 5}
  | 4 => {4, 5}
  | 5 => {5}
  | 6 => {5, 6}
  | 7 => {5, 6, 7}
  | 8 => {5, 6, 7, 8, 9, 10, 11}
  | 9 => {9, 10, 11}
  | 10 => {10, 11}
  | 11 => {11}
  | 12 => {11, 12}
  | 13 => {11, 12, 13}
  | 14 => {11, 12, 13, 14, 15, 16, 17}
  | 15 => {15, 16, 17}
  | 16 => {16, 17}
  | 17 => {17}
  | 18 => {17, 18}
  | 19 => {17, 18, 19}
  | 20 => {17, 18, 19, 20, 21, 22, 23}
  | 21 => {21, 22, 23}
  | 22 => {22, 23}
  | 23 => {23}
  | 24 => {23, 24}
  | 25 => {23, 24, 25}
  | 26 => {23, 24, 25, 26, 27, 28, 29}
  | 27 => {27, 28, 29}
  | 28 => {28, 29}
  | 29 => {29}
  | 30 => {29, 30}
  | _ => {29, 30, 31}

def FLe (x y : Vertex) : Prop := x ∈ lower y

instance : DecidableRel FLe := fun _ _ => inferInstanceAs (Decidable (_ ∈ _))

theorem FLe_refl : ∀ x : Vertex, FLe x x := by decide +kernel
theorem FLe_trans : ∀ x y z : Vertex, FLe x y → FLe y z → FLe x z := by
  decide +kernel
theorem FLe_antisymm : ∀ x y : Vertex, FLe x y → FLe y x → x = y := by
  decide +kernel

/-- An actual partial-order structure; deliberately not a global `Fin 32` instance. -/
def fenceOrder : PartialOrder Vertex where
  le := FLe
  lt := fun x y => FLe x y ∧ ¬ FLe y x
  lt_iff_le_not_le := fun _ _ => Iff.rfl
  le_refl := FLe_refl
  le_trans := FLe_trans
  le_antisymm := FLe_antisymm

/-- The eleven segments from left to right in the paper's fence drawing. -/
def segment (s : Segment) : Finset Vertex :=
  match s.val with
  | 0 => {0, 1, 2}
  | 1 => {2, 3, 4, 5}
  | 2 => {5, 6, 7, 8}
  | 3 => {8, 9, 10, 11}
  | 4 => {11, 12, 13, 14}
  | 5 => {14, 15, 16, 17}
  | 6 => {17, 18, 19, 20}
  | 7 => {20, 21, 22, 23}
  | 8 => {23, 24, 25, 26}
  | 9 => {26, 27, 28, 29}
  | _ => {29, 30, 31}

/-- Distinct segment indices are distinct maximal chains. -/
theorem segment_injective : Function.Injective segment := by decide +kernel

/-- The explicit alternating chain construction, independent of the lower table. -/
def segmentLe (x y : Vertex) : Prop :=
  ∃ s : Segment, x ∈ segment s ∧ y ∈ segment s ∧
    if s.val % 2 = 0 then x.val ≤ y.val else y.val ≤ x.val

instance : DecidableRel segmentLe := fun _ _ => inferInstanceAs (Decidable (∃ _ : Segment, _))

/-- The executable relation is exactly the alternating-segment relation. -/
theorem FLe_iff_segmentLe : ∀ x y : Vertex, FLe x y ↔ segmentLe x y := by
  decide +kernel

theorem segment_chain_certificate : ∀ s : Segment, ∀ x y : Vertex,
    x ∈ segment s → y ∈ segment s → FLe x y ∨ FLe y x := by
  decide +kernel

theorem segment_maximal_certificate : ∀ s : Segment, ∀ x : Vertex,
    x ∉ segment s → ∃ y : Vertex, y ∈ segment s ∧ ¬ FLe x y ∧ ¬ FLe y x := by
  decide +kernel

theorem segment_isMaxChain (s : Segment) :
    IsMaxChain FLe (↑(segment s) : Set Vertex) := by
  refine ⟨fun x hx y hy _ => segment_chain_certificate s x y hx hy, ?_⟩
  intro t ht hst
  apply Set.Subset.antisymm hst
  intro x hxt
  by_contra hx
  obtain ⟨y, hy, hxy, hyx⟩ := segment_maximal_certificate s x hx
  have hne : x ≠ y := by
    intro h
    subst y
    exact hx hy
  exact (ht hxt (hst hy) hne).elim hxy hyx

/-- A comparable distinct pair pins down one segment, including every point
    comparable with both members of the pair. -/
theorem pair_segment_certificate : ∀ x y : Vertex, x ≠ y →
    (FLe x y ∨ FLe y x) → ∃ s : Segment,
      x ∈ segment s ∧ y ∈ segment s ∧
      ∀ z : Vertex, (FLe x z ∨ FLe z x) →
        (FLe y z ∨ FLe z y) → z ∈ segment s := by
  decide +kernel

/-- Every vertex lies in a segment with at least one other vertex. -/
theorem vertex_extension_certificate : ∀ x : Vertex,
    ∃ s : Segment, x ∈ segment s ∧ ∃ y : Vertex, y ∈ segment s ∧ x ≠ y := by
  decide +kernel

theorem isMaxChain_iff_segment (c : Set Vertex) :
    IsMaxChain FLe c ↔ ∃ s : Segment, c = (↑(segment s) : Set Vertex) := by
  constructor
  · intro hc
    have hne : c.Nonempty := by
      by_contra h
      have he : c = ∅ := Set.not_nonempty_iff_eq_empty.mp h
      have hm := hc.2 (IsChain.singleton : IsChain FLe ({0} : Set Vertex))
        (by simp [he])
      have hz : (0 : Vertex) ∈ c := by rw [hm]; simp
      simpa [he] using hz
    obtain ⟨x, hx⟩ := hne
    have hpair : ∃ y ∈ c, x ≠ y := by
      by_contra h
      have hsub : c ⊆ ({x} : Set Vertex) := by
        intro y hy
        have : x = y := by
          by_contra hxy
          exact h ⟨y, hy, hxy⟩
        simpa [this]
      obtain ⟨s, hs, y, hy, hxy⟩ := vertex_extension_certificate x
      have hcsub : c ⊆ (↑(segment s) : Set Vertex) := by
        intro z hz
        have hz' : z = x := Set.mem_singleton_iff.mp (hsub hz)
        simpa [hz'] using hs
      have heq := hc.2 (segment_isMaxChain s).1 hcsub
      have hyc : y ∈ c := by rw [heq]; exact hy
      exact hxy (Set.mem_singleton_iff.mp (hsub hyc)).symm
    obtain ⟨y, hy, hxy⟩ := hpair
    obtain ⟨s, _, _, hpin⟩ := pair_segment_certificate x y hxy (hc.1 hx hy hxy)
    refine ⟨s, hc.2 (segment_isMaxChain s).1 ?_⟩
    intro z hz
    apply hpin z
    · by_cases h : x = z
      · subst z; exact Or.inl (FLe_refl x)
      · exact hc.1 hx hz h
    · by_cases h : y = z
      · subst z; exact Or.inl (FLe_refl y)
      · exact hc.1 hy hz h
  · rintro ⟨s, rfl⟩
    exact segment_isMaxChain s

/-- A shared vertex belongs to two distinct segments, matching the paper. -/
def Shared (x : Vertex) : Prop :=
  ∃ s t : Segment, s ≠ t ∧ x ∈ segment s ∧ x ∈ segment t

instance (x : Vertex) : Decidable (Shared x) :=
  inferInstanceAs (Decidable (∃ _ _ : Segment, _))

def shared : Finset Vertex := Finset.univ.filter Shared
def unshared (s : Segment) : Finset Vertex := (segment s).filter (fun x => ¬ Shared x)

theorem shared_exact : shared = {2, 5, 8, 11, 14, 17, 20, 23, 26, 29} := by
  decide +kernel

theorem unshared_card_two : ∀ s : Segment, (unshared s).card = 2 := by
  decide +kernel

/-- The paper's parameter is one plus the number of unshared elements. -/
theorem paper_parameter_three : ∀ s : Segment, (unshared s).card + 1 = 3 := by
  intro s
  rw [unshared_card_two]

theorem vertex_card : Fintype.card Vertex = 32 := by decide
theorem segment_card : Fintype.card Segment = 11 := by decide
theorem segment_number_odd : ∃ k : Nat, Fintype.card Segment = 2 * k + 1 := by
  exact ⟨5, rfl⟩

#print axioms FLe_iff_segmentLe
#print axioms segment_injective
#print axioms segment_isMaxChain
#print axioms isMaxChain_iff_segment
#print axioms shared_exact
#print axioms paper_parameter_three

end W04
