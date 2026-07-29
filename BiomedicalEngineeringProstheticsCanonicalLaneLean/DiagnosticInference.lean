import HautevilleHouse.BiomedicalEngineeringProstheticsCanonicalLaneLean.PharmacokineticModel

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure DiagnosticInferencePackage {M : CompartmentModelPackage}
    {P : PharmacokineticModelPackage M} where
  observedData : Vector ℝ M.numCompartments
  likelihoodFunction : DiagnosticInferencePackage -> Prop
  priorDistribution : DiagnosticInferencePackage -> Prop
  posteriorComputed : Prop
  bayesianInferenceValid : Prop

structure DiagnosticInferenceEvidence {M : CompartmentModelPackage}
    {P : PharmacokineticModelPackage M} (D : DiagnosticInferencePackage M P) where
  likelihoodFunctionClosed : D.likelihoodFunction D
  priorDistributionClosed : D.priorDistribution D
  posteriorComputedClosed : D.posteriorComputed
  bayesianInferenceValidClosed : D.bayesianInferenceValid

def DiagnosticInferenceClosed {M : CompartmentModelPackage}
    {P : PharmacokineticModelPackage M} (D : DiagnosticInferencePackage M P) : Prop :=
  D.likelihoodFunction D ∧ D.priorDistribution D ∧
  D.posteriorComputed ∧ D.bayesianInferenceValid

theorem diagnostic_inference_closed_from_evidence
    {M : CompartmentModelPackage} {P : PharmacokineticModelPackage M}
    (D : DiagnosticInferencePackage M P) (E : DiagnosticInferenceEvidence D) :
    DiagnosticInferenceClosed D := by
  exact And.intro E.likelihoodFunctionClosed
    (And.intro E.priorDistributionClosed
      (And.intro E.posteriorComputedClosed E.bayesianInferenceValidClosed))

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse