import HautevilleHouse.BiomedicalEngineeringProstheticsCanonicalLaneLean.DiagnosticInference

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure SurvivalAnalysisPackage {M : CompartmentModelPackage}
    {P : PharmacokineticModelPackage M} {D : DiagnosticInferencePackage M P} where
  hazardFunction : ℝ -> ℝ
  survivalFunction : ℝ -> ℝ
  medianSurvivalTime : ℝ
  censoringIndicator : ℝ -> Bool
  hazardPositive : hazardFunction 0 > 0
  survivalDecreasing : ∀ t, survivalFunction t ≤ survivalFunction 0

structure SurvivalAnalysisEvidence {M : CompartmentModelPackage}
    {P : PharmacokineticModelPackage M} {D : DiagnosticInferencePackage M P}
    (S : SurvivalAnalysisPackage M P D) where
  hazardPositiveClosed : S.hazardPositive
  survivalDecreasingClosed : S.survivalDecreasing

def SurvivalAnalysisClosed {M : CompartmentModelPackage}
    {P : PharmacokineticModelPackage M} {D : DiagnosticInferencePackage M P}
    (S : SurvivalAnalysisPackage M P D) : Prop :=
  S.hazardPositive ∧ S.survivalDecreasing

theorem survival_analysis_closed_from_evidence
    {M : CompartmentModelPackage} {P : PharmacokineticModelPackage M}
    {D : DiagnosticInferencePackage M P} (S : SurvivalAnalysisPackage M P D)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.hazardPositiveClosed E.survivalDecreasingClosed

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse