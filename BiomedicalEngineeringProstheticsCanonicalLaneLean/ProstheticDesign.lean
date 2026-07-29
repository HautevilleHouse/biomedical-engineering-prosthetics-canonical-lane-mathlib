import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure ProstheticDesignPackage where
  materialYoungModulus : ℝ
  materialYieldStrength : ℝ
  prostheticMass : ℝ
  maximumLoad : ℝ
  safetyFactor : ℝ
  youngModulusPositive : materialYoungModulus > 0
  yieldStrengthPositive : materialYieldStrength > 0
  massPositive : prostheticMass > 0
  loadPositive : maximumLoad > 0
  safetyFactorPositive : safetyFactor > 0
  designSafe : maximumLoad * safetyFactor ≤ materialYieldStrength

structure ProstheticDesignEvidence (P : ProstheticDesignPackage) where
  youngModulusPositiveClosed : P.youngModulusPositive
  yieldStrengthPositiveClosed : P.yieldStrengthPositive
  massPositiveClosed : P.massPositive
  loadPositiveClosed : P.loadPositive
  safetyFactorPositiveClosed : P.safetyFactorPositive
  designSafeClosed : P.designSafe

def ProstheticDesignClosed (P : ProstheticDesignPackage) : Prop :=
  P.youngModulusPositive ∧ P.yieldStrengthPositive ∧ P.massPositive ∧
  P.loadPositive ∧ P.safetyFactorPositive ∧ P.designSafe

theorem prosthetic_design_closed_from_evidence (P : ProstheticDesignPackage)
    (E : ProstheticDesignEvidence P) : ProstheticDesignClosed P := by
  exact And.intro E.youngModulusPositiveClosed
    (And.intro E.yieldStrengthPositiveClosed
      (And.intro E.massPositiveClosed
        (And.intro E.loadPositiveClosed
          (And.intro E.safetyFactorPositiveClosed E.designSafeClosed))))

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse