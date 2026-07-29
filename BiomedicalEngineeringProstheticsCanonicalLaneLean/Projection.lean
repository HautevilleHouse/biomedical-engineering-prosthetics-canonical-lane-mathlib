import HautevilleHouse.BiomedicalEngineeringProstheticsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringProstheticsCanonicalLaneLean

structure ProstheticState where
  object : ProstheticAdmittedObject

def prostheticProjection : Projection ProstheticState :=
  { toFun := fun x => x,
    idempotent := by intro x; rfl
  }

theorem prosthetic_projection_idempotent (x : ProstheticState) :
    prostheticProjection.toFun (prostheticProjection.toFun x) = prostheticProjection.toFun x := by
  exact prostheticProjection.idempotent x

end BiomedicalEngineeringProstheticsCanonicalLaneLean
end HautevilleHouse