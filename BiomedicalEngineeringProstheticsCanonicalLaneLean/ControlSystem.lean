import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure PIDControllerParameters where
  kp : ℝ
  ki : ℝ
  kd : ℝ
  setpoint : ℝ
  kpPositive : kp > 0
  kiPositive : ki > 0
  kdPositive : kd > 0

structure ControlSystemPackage (C : PIDControllerParameters) where
  controlSignal : ℝ → ℝ
  errorSignal : ℝ → ℝ
  derivativeSignal : ℝ → ℝ
  integralSignal : ℝ → ℝ
  controlLaw : ∀ t, controlSignal t = C.kp * errorSignal t + C.ki * integralSignal t + C.kd * derivativeSignal t
  trackingErrorBounded : ∃ M > 0, ∀ t, |errorSignal t| ≤ M

structure ControlSystemEvidence {C : PIDControllerParameters} (S : ControlSystemPackage C) where
  controlLawClosed : S.controlLaw
  trackingErrorBoundedClosed : S.trackingErrorBounded

def ControlSystemClosed {C : PIDControllerParameters} (S : ControlSystemPackage C) : Prop :=
  S.controlLaw ∧ S.trackingErrorBounded

theorem control_system_closed_from_evidence {C : PIDControllerParameters}
    (S : ControlSystemPackage C) (E : ControlSystemEvidence S) : ControlSystemClosed S := by
  exact And.intro E.controlLawClosed E.trackingErrorBoundedClosed

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse