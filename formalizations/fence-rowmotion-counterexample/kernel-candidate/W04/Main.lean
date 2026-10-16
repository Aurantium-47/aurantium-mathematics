import W04.Orbit
import Mathlib.Tactic.NormNum

namespace W04
open scoped BigOperators

/-- The statistic is the cardinality of an actual finite lower ideal. -/
def orbitSet : Finset (Finset Vertex) := Finset.univ.image orbit

def timeIndex (n : Nat) : Fin 237 := ⟨n % 237, Nat.mod_lt _ (by decide)⟩

def idealOrbit (k : Fin 237) : LowerIdeals := ⟨orbit k, orbit_lower k⟩

theorem rho_idealOrbit (k : Fin 237) : rho (idealOrbit k) = idealOrbit (next k) := by
  apply Subtype.ext
  exact orbit_step k

theorem rho_iterate_val (n : Nat) (I : LowerIdeals) :
    ((rho^[n]) I).val = (row^[n]) I.val := by
  induction n with
  | zero => rfl
  | succ n ih =>
    rw [Function.iterate_succ_apply', Function.iterate_succ_apply', rho_val, ih]

theorem timeIndex_succ (n : Nat) : next (timeIndex n) = timeIndex (n + 1) := by
  apply Fin.ext
  simp [next, timeIndex, Nat.add_mod]

/-- Every iterate, without any bound on time, is represented by the certificate. -/
theorem iterate_eq_orbit (n : Nat) : (row^[n]) (orbit 0) = orbit (timeIndex n) := by
  induction n with
  | zero => rfl
  | succ n ih =>
    rw [Function.iterate_succ_apply', ih, orbit_step, timeIndex_succ]

/-- Membership in the finite set is equivalent to reachability by actual rowmotion. -/
theorem mem_orbitSet_iff (I : Finset Vertex) :
    I ∈ orbitSet ↔ ∃ n : Nat, (row^[n]) (orbit 0) = I := by
  constructor
  · intro h
    obtain ⟨k, _, rfl⟩ := Finset.mem_image.mp h
    refine ⟨k.val, ?_⟩
    rw [iterate_eq_orbit]
    congr 1
    apply Fin.ext
    exact Nat.mod_eq_of_lt k.isLt
  · rintro ⟨n, rfl⟩
    rw [iterate_eq_orbit]
    exact Finset.mem_image.mpr ⟨timeIndex n, Finset.mem_univ _, rfl⟩

theorem orbitSet_lower (I : Finset Vertex) (h : I ∈ orbitSet) : LowerIdeal I := by
  obtain ⟨k, _, rfl⟩ := Finset.mem_image.mp h
  exact orbit_lower k

theorem orbitSet_card : orbitSet.card = 237 := by
  rw [orbitSet, Finset.card_image_of_injective _ orbit_injective]
  simp

theorem orbitSet_sum : (∑ I ∈ orbitSet, I.card) = 3774 := by
  rw [orbitSet, Finset.sum_image]
  · exact orbit_sum
  · intro i _ j _ hij
    exact orbit_injective hij

theorem closed_after_237 : (row^[237]) (orbit 0) = orbit 0 := by
  rw [iterate_eq_orbit]
  rfl

theorem no_earlier_return (n : Nat) (hpos : 0 < n) (hlt : n < 237) :
    (row^[n]) (orbit 0) ≠ orbit 0 := by
  intro h
  rw [iterate_eq_orbit] at h
  have hi := congrArg Fin.val (orbit_injective h)
  change n % 237 = 0 at hi
  rw [Nat.mod_eq_of_lt hlt] at hi
  exact (ne_of_gt hpos) hi

theorem rho_period_237 : (rho^[237]) (idealOrbit 0) = idealOrbit 0 := by
  apply Subtype.ext
  rw [rho_iterate_val]
  exact closed_after_237

theorem rho_no_earlier_return (n : Nat) (hpos : 0 < n) (hlt : n < 237) :
    (rho^[n]) (idealOrbit 0) ≠ idealOrbit 0 := by
  intro h
  have hv := congrArg Subtype.val h
  rw [rho_iterate_val] at hv
  exact no_earlier_return n hpos hlt hv

/-- An orbit is the full set of iterates of a lower ideal, not an arbitrary list. -/
def IsRowOrbit (O : Finset (Finset Vertex)) : Prop :=
  ∃ I : Finset Vertex, LowerIdeal I ∧ ∀ J, J ∈ O ↔ ∃ n : Nat, (row^[n]) I = J

theorem orbitSet_isRowOrbit : IsRowOrbit orbitSet :=
  ⟨orbit 0, orbit_lower 0, mem_orbitSet_iff⟩

/-- Integer formulation of the paper's n/2-homomesy for this 32-element fence. -/
def HalfCardinalityHomomesy : Prop :=
  ∀ O : Finset (Finset Vertex), IsRowOrbit O →
    2 * (∑ I ∈ O, I.card) = Fintype.card Vertex * O.card

theorem counterexample :
    IsRowOrbit orbitSet ∧ orbitSet.card = 237 ∧
    (∑ I ∈ orbitSet, I.card) = 3774 ∧
    2 * (∑ I ∈ orbitSet, I.card) ≠ Fintype.card Vertex * orbitSet.card := by
  refine ⟨orbitSet_isRowOrbit, orbitSet_card, orbitSet_sum, ?_⟩
  rw [orbitSet_sum, orbitSet_card]
  decide

theorem not_halfCardinalityHomomesy : ¬ HalfCardinalityHomomesy := by
  intro h
  exact counterexample.2.2.2 (h orbitSet orbitSet_isRowOrbit)

theorem orbit_mean :
    (((∑ I ∈ orbitSet, I.card) : ℕ) : ℚ) / orbitSet.card = 1258 / 79 := by
  rw [orbitSet_sum, orbitSet_card]
  norm_num

/-- The segment convention and the dynamical failure are in one proved statement. -/
theorem paper_fence_counterexample :
    (∀ c : Set Vertex, IsMaxChain FLe c ↔ ∃ s : Segment, c = ↑(segment s)) ∧
    Function.Injective segment ∧
    (∀ s : Segment, (unshared s).card + 1 = 3) ∧
    Fintype.card Segment = 11 ∧ Fintype.card Vertex = 32 ∧
    (∃ k : Nat, Fintype.card Segment = 2 * k + 1) ∧
    ¬ HalfCardinalityHomomesy :=
  ⟨isMaxChain_iff_segment, segment_injective, paper_parameter_three, segment_card, vertex_card,
    segment_number_odd, not_halfCardinalityHomomesy⟩

#print axioms counterexample
#print axioms not_halfCardinalityHomomesy
#print axioms paper_fence_counterexample
#print axioms FLe_iff_segmentLe
#print axioms orbit_mean
#print axioms mem_orbitSet_iff
#print axioms closed_after_237
#print axioms no_earlier_return
#print axioms rho_period_237
#print axioms rho_no_earlier_return

end W04
