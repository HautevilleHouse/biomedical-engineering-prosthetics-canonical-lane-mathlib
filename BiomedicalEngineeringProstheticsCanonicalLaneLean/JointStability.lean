import canonicalLaneMathlib.MuscleActivation

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure JointStabilityPackage {K : KinematicModelPackage} {G : GaitCyclePDEPackage K} {M : MaterialFatiguePackage G} (A : MuscleActivationPackage M) where
  stabilityMargin : Prop
  loadDistribution : Prop
  noLocalCollapsing : Prop
  adaptation : Prop

structure JointStabilityEvidence {K : KinematicModelPackage} {G : GaitCyclePDEPackage K} {M : MaterialFatiguePackage G} {A : MuscleActivationPackage M} (J : JointStabilityPackage A) where
  stabilityMarginClosed : J.stabilityMargin
  loadDistributionClosed : J.loadDistribution
  noLocalCollapsingClosed : J.noLocalCollapsing
  adaptationClosed : J.adaptation

def JointStabilityClosed {K : KinematicModelPackage} {G : GaitCyclePDEPackage K} {M : MaterialFatiguePackage G} {A : MuscleActivationPackage M} (J : JointStabilityPackage A) : Prop :=
  J.stabilityMargin ∧ J.loadDistribution ∧ J.noLocalCollapsing ∧ J.adaptation

theorem joint_stability_closed_from_evidence {K : KinematicModelPackage} {G : GaitCyclePDEPackage K} {M : MaterialFatiguePackage G} {A : MuscleActivationPackage M} (J : JointStabilityPackage A) (E : JointStabilityEvidence J) :
    JointStabilityClosed J := by
  exact And.intro E.stabilityMarginClosed (And.intro E.loadDistributionClosed (And.intro E.noLocalCollapsingClosed E.adaptationClosed))

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse