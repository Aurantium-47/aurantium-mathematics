import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_232 : KernelCertificate 232 := by
  change row ({0, 3, 4, 5, 16, 17, 18, 19, 27, 28, 29, 30} : Finset Vertex) = {0, 1, 5, 6, 11, 15, 16, 17, 23, 29, 30, 31} ∧
    orbitFingerprint ({0, 3, 4, 5, 16, 17, 18, 19, 27, 28, 29, 30} : Finset Vertex) = 2014249017 ∧
    ({0, 3, 4, 5, 16, 17, 18, 19, 27, 28, 29, 30} : Finset Vertex).card = 12 ∧ orbitCodeInverse 2014249017 = 232
  decide +kernel

theorem kernel_cert_233 : KernelCertificate 233 := by
  change row ({0, 1, 5, 6, 11, 15, 16, 17, 23, 29, 30, 31} : Finset Vertex) = {4, 5, 6, 7, 10, 11, 12, 17, 18, 22, 23, 24, 28, 29} ∧
    orbitFingerprint ({0, 1, 5, 6, 11, 15, 16, 17, 23, 29, 30, 31} : Finset Vertex) = 3766716515 ∧
    ({0, 1, 5, 6, 11, 15, 16, 17, 23, 29, 30, 31} : Finset Vertex).card = 12 ∧ orbitCodeInverse 3766716515 = 233
  decide +kernel

theorem kernel_cert_234 : KernelCertificate 234 := by
  change row ({4, 5, 6, 7, 10, 11, 12, 17, 18, 22, 23, 24, 28, 29} : Finset Vertex) = {0, 3, 4, 5, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30} ∧
    orbitFingerprint ({4, 5, 6, 7, 10, 11, 12, 17, 18, 22, 23, 24, 28, 29} : Finset Vertex) = 835067120 ∧
    ({4, 5, 6, 7, 10, 11, 12, 17, 18, 22, 23, 24, 28, 29} : Finset Vertex).card = 14 ∧ orbitCodeInverse 835067120 = 234
  decide +kernel

theorem kernel_cert_235 : KernelCertificate 235 := by
  change row ({0, 3, 4, 5, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex) = {0, 1, 5, 6, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 3, 4, 5, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex) = 2079276601 ∧
    ({0, 3, 4, 5, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex).card = 22 ∧ orbitCodeInverse 2079276601 = 235
  decide +kernel

theorem kernel_cert_236 : KernelCertificate 236 := by
  change row ({0, 1, 5, 6, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex) = {4, 5, 6, 7, 11} ∧
    orbitFingerprint ({0, 1, 5, 6, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex) = 4294934627 ∧
    ({0, 1, 5, 6, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex).card = 21 ∧ orbitCodeInverse 4294934627 = 236
  decide +kernel

#print axioms kernel_cert_236
end W04
