import HautevilleHouse.BiomedicalEngineeringProstheticsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure PrimitiveProstheticSystem where
  limbType : Type u
  degreeOfFreedom : Nat
  jointAngles : limbType -> Vector ℝ degreeOfFreedom
  muscleForces : limbType -> Vector ℝ degreeOfFreedom
  boneDensity : limbType -> ℝ
  jointStiffness : limbType -> ℝ
  dampingCoefficient : limbType -> ℝ
  kinematicCompatibility : Prop
  forceBalance : Prop
  materialProperties : Prop
  kinematicCompatibilityTerm : kinematicCompatibility
  forceBalanceTerm : forceBalance
  materialPropertiesTerm : materialProperties

structure PrimitiveProstheticSystemEvidence (S : PrimitiveProstheticSystem) where
  kinematicCompatibilityClosed : S.kinematicCompatibility
  forceBalanceClosed : S.forceBalance
  materialPropertiesClosed : S.materialProperties

def PrimitiveProstheticSystemClosed (S : PrimitiveProstheticSystem) : Prop :=
  S.kinematicCompatibility ∧ S.forceBalance ∧ S.materialProperties

theorem primitive_prosthetic_system_closed_from_evidence
    (S : PrimitiveProstheticSystem) (E : PrimitiveProstheticSystemEvidence S) :
    PrimitiveProstheticSystemClosed S := by
  exact And.intro E.kinematicCompatibilityClosed
    (And.intro E.forceBalanceClosed E.materialPropertiesClosed)

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse