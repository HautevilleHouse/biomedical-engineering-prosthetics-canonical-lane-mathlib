import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure SocketInterfaceModelPackage where
  interfacePressureDistribution : Prop
  shearStressProfile : Prop
  suspensionMechanism : Prop
  skinTolerance : Prop
  donningDoffingEase : Prop

structure SocketInterfaceModelEvidence (S : SocketInterfaceModelPackage) where
  interfacePressureDistributionClosed : S.interfacePressureDistribution
  shearStressProfileClosed : S.shearStressProfile
  suspensionMechanismClosed : S.suspensionMechanism
  skinToleranceClosed : S.skinTolerance
  donningDoffingEaseClosed : S.donningDoffingEase

def SocketInterfaceModelClosed (S : SocketInterfaceModelPackage) : Prop :=
  S.interfacePressureDistribution ∧ S.shearStressProfile ∧
  S.suspensionMechanism ∧ S.skinTolerance ∧ S.donningDoffingEase

theorem socket_interface_model_closed_from_evidence (S : SocketInterfaceModelPackage)
    (E : SocketInterfaceModelEvidence S) : SocketInterfaceModelClosed S := by
  exact And.intro E.interfacePressureDistributionClosed
    (And.intro E.shearStressProfileClosed
      (And.intro E.suspensionMechanismClosed
        (And.intro E.skinToleranceClosed E.donningDoffingEaseClosed)))

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse