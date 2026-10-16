import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem smoke_certificate_000 : KernelCertificate 0 := by
  change row ({4, 5, 6, 7, 11} : Finset Vertex) = {0, 3, 4, 5, 10, 11, 12, 17, 23, 29} ∧
    orbitFingerprint ({4, 5, 6, 7, 11} : Finset Vertex) = 2288 ∧
    ({4, 5, 6, 7, 11} : Finset Vertex).card = 5 ∧ orbitCodeInverse 2288 = 0
  decide +kernel

#print axioms smoke_certificate_000
end W04
