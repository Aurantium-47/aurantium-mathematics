import W04.Poset
import Mathlib.Data.Finset.Union

/-!
Rowmotion on the actual lower ideals of the fence order `FLe`.
No statement in this module uses the numerical order on `Fin 32`.
-/

namespace W04

/-- A lower ideal for the fence order, rather than the numerical vertex order. -/
def LowerIdeal (I : Finset Vertex) : Prop :=
  ∀ x ∈ I, ∀ y, FLe y x → y ∈ I

/-- Use bounded finite quantifiers in certificates without changing the predicate. -/
instance (I : Finset Vertex) : Decidable (LowerIdeal I) :=
  inferInstanceAs (Decidable (∀ x ∈ I, ∀ y ∈ lower x, y ∈ I))

abbrev LowerIdeals := {I : Finset Vertex // LowerIdeal I}

/-- Exactly the minimal elements of the complement of I. -/
def minComplement (I : Finset Vertex) : Finset Vertex :=
  Finset.univ.filter (fun x =>
    x ∉ I ∧ ∀ y ∈ lower x, y ≠ x → y ∈ I)

theorem minComplement_mem_iff (I : Finset Vertex) (x : Vertex) :
    x ∈ minComplement I ↔
      x ∉ I ∧ ∀ y, FLe y x → y ≠ x → y ∈ I := by
  simp only [minComplement, Finset.mem_filter, Finset.mem_univ, true_and, FLe]

/-- The executable predicate is the usual order-theoretic complement minimum. -/
theorem minComplement_minimal_iff (I : Finset Vertex) (x : Vertex) :
    x ∈ minComplement I ↔
      x ∉ I ∧ ∀ y, y ∉ I → FLe y x → x = y := by
  rw [minComplement_mem_iff]
  constructor
  · rintro ⟨hx, hmin⟩
    refine ⟨hx, ?_⟩
    intro y hy hyx
    by_contra hxy
    exact hy (hmin y hyx (Ne.symm hxy))
  · rintro ⟨hx, hmin⟩
    refine ⟨hx, ?_⟩
    intro y hyx hne
    by_contra hy
    exact hne (hmin y hy hyx).symm

/-- Downward closure of the minimal elements of the complement. -/
def row (I : Finset Vertex) : Finset Vertex :=
  (minComplement I).biUnion lower

theorem row_mem_iff (I : Finset Vertex) (x : Vertex) :
    x ∈ row I ↔ ∃ z, (z ∉ I ∧
      ∀ y, FLe y z → y ≠ z → y ∈ I) ∧ FLe x z := by
  simp only [row, Finset.mem_biUnion, minComplement_mem_iff, FLe]

theorem row_mem_iff_minimal (I : Finset Vertex) (x : Vertex) :
    x ∈ row I ↔ ∃ z, (z ∉ I ∧
      ∀ y, y ∉ I → FLe y z → z = y) ∧ FLe x z := by
  simp only [row, Finset.mem_biUnion, minComplement_minimal_iff, FLe]

/-- A downward closure is a lower ideal, even for an arbitrary input subset. -/
theorem row_lowerIdeal (I : Finset Vertex) : LowerIdeal (row I) := by
  intro x hx y hyx
  obtain ⟨z, hz, hxz⟩ := (row_mem_iff I x).mp hx
  exact (row_mem_iff I y).mpr ⟨z, hz, FLe_trans y x z hyx hxz⟩

/-- Rowmotion as a self-map of the genuine order-ideal subtype. -/
def rho (I : LowerIdeals) : LowerIdeals :=
  ⟨row I.val, row_lowerIdeal I.val⟩

@[simp] theorem rho_val (I : LowerIdeals) : (rho I).val = row I.val := rfl

end W04
