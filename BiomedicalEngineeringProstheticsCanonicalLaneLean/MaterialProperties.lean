import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure MaterialPropertiesPackage where
  stiffnessModulus : Prop
  fatigueResistance : Prop
  biocompatibility : Prop
  wearResistance : Prop
  dampingCoefficient : Prop

structure MaterialPropertiesEvidence (M : MaterialPropertiesPackage) where
  stiffnessModulusClosed : M.stiffnessModulus
  fatigueResistanceClosed : M.fatigueResistance
  biocompatibilityClosed : M.biocompatibility
  wearResistanceClosed : M.wearResistance
  dampingCoefficientClosed : M.dampingCoefficient

def MaterialPropertiesClosed (M : MaterialPropertiesPackage) : Prop :=
  M.stiffnessModulus ∧ M.fatigueResistance ∧ M.biocompatibility ∧
  M.wearResistance ∧ M.dampingCoefficient

theorem material_properties_closed_from_evidence (M : MaterialPropertiesPackage)
    (E : MaterialPropertiesEvidence M) : MaterialPropertiesClosed M := by
  exact And.intro E.stiffnessModulusClosed
    (And.intro E.fatigueResistanceClosed
      (And.intro E.biocompatibilityClosed
        (And.intro E.wearResistanceClosed E.dampingCoefficientClosed)))

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse