import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure RehabilitationOutcomesPackage where
  mobilityScore : Prop
  painLevel : Prop
  satisfactionIndex : Prop
  functionalIndependence : Prop
  prosthesisAbandonmentRate : Prop

structure RehabilitationOutcomesEvidence (R : RehabilitationOutcomesPackage) where
  mobilityScoreClosed : R.mobilityScore
  painLevelClosed : R.painLevel
  satisfactionIndexClosed : R.satisfactionIndex
  functionalIndependenceClosed : R.functionalIndependence
  prosthesisAbandonmentRateClosed : R.prosthesisAbandonmentRate

def RehabilitationOutcomesClosed (R : RehabilitationOutcomesPackage) : Prop :=
  R.mobilityScore ∧ R.painLevel ∧ R.satisfactionIndex ∧
  R.functionalIndependence ∧ R.prosthesisAbandonmentRate

theorem rehabilitation_outcomes_closed_from_evidence (R : RehabilitationOutcomesPackage)
    (E : RehabilitationOutcomesEvidence R) : RehabilitationOutcomesClosed R := by
  exact And.intro E.mobilityScoreClosed
    (And.intro E.painLevelClosed
      (And.intro E.satisfactionIndexClosed
        (And.intro E.functionalIndependenceClosed E.prosthesisAbandonmentRateClosed)))

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse