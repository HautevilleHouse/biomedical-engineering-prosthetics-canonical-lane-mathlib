import HautevilleHouse.BiomedicalEngineeringProstheticsCanonicalLaneLean.PrimitiveProstheticSystem
import HautevilleHouse.BiomedicalEngineeringProstheticsCanonicalLaneLean.CompartmentModel
import HautevilleHouse.BiomedicalEngineeringProstheticsCanonicalLaneLean.PharmacokineticModel
import HautevilleHouse.BiomedicalEngineeringProstheticsCanonicalLaneLean.DiagnosticInference
import HautevilleHouse.BiomedicalEngineeringProstheticsCanonicalLaneLean.SurvivalAnalysis

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure ProstheticAnalyticFoundation where
  primitiveSystem : PrimitiveProstheticSystem
  primitiveEvidence : PrimitiveProstheticSystemEvidence primitiveSystem
  compartment : CompartmentModelPackage
  compartmentEvidence : CompartmentModelEvidence compartment
  pharmacokinetic : PharmacokineticModelPackage compartment
  pharmacokineticEvidence : PharmacokineticModelEvidence pharmacokinetic
  diagnostic : DiagnosticInferencePackage pharmacokinetic
  diagnosticEvidence : DiagnosticInferenceEvidence diagnostic
  survival : SurvivalAnalysisPackage diagnostic
  survivalEvidence : SurvivalAnalysisEvidence survival

def ProstheticAnalyticFoundationClosed (A : ProstheticAnalyticFoundation) : Prop :=
  PrimitiveProstheticSystemClosed A.primitiveSystem ∧
  CompartmentModelClosed A.compartment ∧
  PharmacokineticModelClosed A.pharmacokinetic ∧
  DiagnosticInferenceClosed A.diagnostic ∧
  SurvivalAnalysisClosed A.survival

theorem prosthetic_analytic_foundation_closed_from_evidence
    (A : ProstheticAnalyticFoundation) :
    ProstheticAnalyticFoundationClosed A := by
  exact And.intro (primitive_prosthetic_system_closed_from_evidence A.primitiveSystem A.primitiveEvidence)
    (And.intro (compartment_model_closed_from_evidence A.compartment A.compartmentEvidence)
      (And.intro (pharmacokinetic_model_closed_from_evidence A.pharmacokinetic A.pharmacokineticEvidence)
        (And.intro (diagnostic_inference_closed_from_evidence A.diagnostic A.diagnosticEvidence)
          (survival_analysis_closed_from_evidence A.survival A.survivalEvidence))))

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse