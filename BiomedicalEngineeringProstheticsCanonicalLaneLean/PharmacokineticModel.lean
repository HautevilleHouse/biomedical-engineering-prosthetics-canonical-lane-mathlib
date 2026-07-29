import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure PharmacokineticModelPackage where
  absorptionRate : ℝ
  distributionVolume : ℝ
  eliminationRate : ℝ
  steadyStateConcentration : Prop
  doseProportionality : Prop

structure PharmacokineticModelEvidence (P : PharmacokineticModelPackage) where
  steadyStateConcentrationClosed : P.steadyStateConcentration
  doseProportionalityClosed : P.doseProportionality

def PharmacokineticModelClosed (P : PharmacokineticModelPackage) : Prop :=
  P.steadyStateConcentration ∧ P.doseProportionality

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModelPackage) (E : PharmacokineticModelEvidence P) :
  PharmacokineticModelClosed P := by
  exact And.intro E.steadyStateConcentrationClosed E.doseProportionalityClosed

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse
