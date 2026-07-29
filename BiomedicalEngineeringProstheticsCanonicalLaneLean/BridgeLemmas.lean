import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiomedicalEngineeringProstheticsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse