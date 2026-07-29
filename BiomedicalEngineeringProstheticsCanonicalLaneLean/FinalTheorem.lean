import HautevilleHouse.BiomedicalEngineeringProstheticsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

def ConstrainedProstheticClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_prosthetic_endgame (A : AdmissibleClass) :
    ConstrainedProstheticClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse