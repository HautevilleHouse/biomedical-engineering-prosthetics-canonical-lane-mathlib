import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure ProstheticJointMechanicsPackage where
  jointType : Type u
  rangeOfMotion : Prop
  loadCapacity : Prop
  frictionModel : Prop
  stabilityIndex : Prop

structure ProstheticJointMechanicsEvidence (P : ProstheticJointMechanicsPackage) where
  rangeOfMotionClosed : P.rangeOfMotion
  loadCapacityClosed : P.loadCapacity
  frictionModelClosed : P.frictionModel
  stabilityIndexClosed : P.stabilityIndex

def ProstheticJointMechanicsClosed (P : ProstheticJointMechanicsPackage) : Prop :=
  P.rangeOfMotion ∧ P.loadCapacity ∧ P.frictionModel ∧ P.stabilityIndex

theorem prosthetic_joint_mechanics_closed_from_evidence (P : ProstheticJointMechanicsPackage)
    (E : ProstheticJointMechanicsEvidence P) : ProstheticJointMechanicsClosed P := by
  exact And.intro E.rangeOfMotionClosed (And.intro E.loadCapacityClosed
    (And.intro E.frictionModelClosed E.stabilityIndexClosed))

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse