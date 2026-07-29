import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure GaitCycleParameters where
  strideLength : ℝ
  cadence : ℝ
  stancePhasePercent : ℝ
  swingPhasePercent : ℝ
  symmetryRatio : ℝ
  strideLengthPositive : strideLength > 0
  cadencePositive : cadence > 0
  stancePlusSwing : stancePhasePercent + swingPhasePercent = 100
  symmetryRatioPositive : symmetryRatio > 0
  symmetryRatioUnit : symmetryRatio ≤ 1

structure GaitAnalysisPackage (G : GaitCycleParameters) where
  stanceSwingRatio : ℝ
  doubleSupportTime : ℝ
  doubleSupportPositive : doubleSupportTime > 0
  stanceSwingComputed : stanceSwingRatio = G.stancePhasePercent / G.swingPhasePercent

structure GaitAnalysisEvidence {G : GaitCycleParameters} (P : GaitAnalysisPackage G) where
  doubleSupportPositiveClosed : P.doubleSupportPositive
  stanceSwingComputedClosed : P.stanceSwingComputed

def GaitAnalysisClosed {G : GaitCycleParameters} (P : GaitAnalysisPackage G) : Prop :=
  P.doubleSupportPositive ∧ P.stanceSwingComputed

theorem gait_analysis_closed_from_evidence {G : GaitCycleParameters}
    (P : GaitAnalysisPackage G) (E : GaitAnalysisEvidence P) : GaitAnalysisClosed P := by
  exact And.intro E.doubleSupportPositiveClosed E.stanceSwingComputedClosed

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse