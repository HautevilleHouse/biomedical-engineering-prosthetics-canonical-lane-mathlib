import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure CompartmentModelPackage where
  numCompartments : Nat
  rateMatrix : NumCompartments → NumCompartments → ℝ
  initialConditions : NumCompartments → ℝ
  solutionExists : Prop
  parameterIdentifiability : Prop

structure CompartmentModelEvidence (M : CompartmentModelPackage) where
  solutionExistsClosed : M.solutionExists
  parameterIdentifiabilityClosed : M.parameterIdentifiability

def CompartmentModelClosed (M : CompartmentModelPackage) : Prop :=
  M.solutionExists ∧ M.parameterIdentifiability

theorem compartment_model_closed_from_evidence (M : CompartmentModelPackage) (E : CompartmentModelEvidence M) :
  CompartmentModelClosed M := by
  exact And.intro E.solutionExistsClosed E.parameterIdentifiabilityClosed

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse
