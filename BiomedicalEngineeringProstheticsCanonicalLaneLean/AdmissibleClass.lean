import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure ProstheticAdmittedObject where
  limbType : Type u
  degreeOfFreedom : Nat
  jointAngles : LimbType -> Vector ℝ degreeOfFreedom
  muscleForces : LimbType -> Vector ℝ degreeOfFreedom
  boneDensity : LimbType -> ℝ
  conclusion : degreeOfFreedom > 0

structure AdmissibleClass where
  object : ProstheticAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse