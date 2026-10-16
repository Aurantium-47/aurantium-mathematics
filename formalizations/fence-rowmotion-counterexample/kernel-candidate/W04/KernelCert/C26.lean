import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_208 : KernelCertificate 208 := by
  change row ({0, 4, 5, 6, 9, 10, 11, 16, 17, 18, 22, 23, 24, 28, 29, 30} : Finset Vertex) = {0, 1, 3, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 4, 5, 6, 9, 10, 11, 16, 17, 18, 22, 23, 24, 28, 29, 30} : Finset Vertex) = 1908870769 ∧
    ({0, 4, 5, 6, 9, 10, 11, 16, 17, 18, 22, 23, 24, 28, 29, 30} : Finset Vertex).card = 16 ∧ orbitCodeInverse 1908870769 = 208
  decide +kernel

theorem kernel_cert_209 : KernelCertificate 209 := by
  change row ({0, 1, 3, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 2, 3, 4, 5, 10, 11, 12, 13, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29} ∧
    orbitFingerprint ({0, 1, 3, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex) = 4226783483 ∧
    ({0, 1, 3, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex).card = 24 ∧ orbitCodeInverse 4226783483 = 209
  decide +kernel

theorem kernel_cert_210 : KernelCertificate 210 := by
  change row ({0, 1, 2, 3, 4, 5, 10, 11, 12, 13, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex) = {5, 6, 9, 10, 11, 16, 17, 29, 30} ∧
    orbitFingerprint ({0, 1, 2, 3, 4, 5, 10, 11, 12, 13, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex) = 1073626175 ∧
    ({0, 1, 2, 3, 4, 5, 10, 11, 12, 13, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex).card = 23 ∧ orbitCodeInverse 1073626175 = 210
  decide +kernel

theorem kernel_cert_211 : KernelCertificate 211 := by
  change row ({5, 6, 9, 10, 11, 16, 17, 29, 30} : Finset Vertex) = {0, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({5, 6, 9, 10, 11, 16, 17, 29, 30} : Finset Vertex) = 1610813024 ∧
    ({5, 6, 9, 10, 11, 16, 17, 29, 30} : Finset Vertex).card = 9 ∧ orbitCodeInverse 1610813024 = 211
  decide +kernel

theorem kernel_cert_212 : KernelCertificate 212 := by
  change row ({0, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 3, 4, 5, 10, 11, 12, 13, 17, 18, 19, 22, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 23, 28, 29, 30, 31} : Finset Vertex) = 4035418353 ∧
    ({0, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 23, 28, 29, 30, 31} : Finset Vertex).card = 16 ∧ orbitCodeInverse 4035418353 = 212
  decide +kernel

theorem kernel_cert_213 : KernelCertificate 213 := by
  change row ({0, 1, 3, 4, 5, 10, 11, 12, 13, 17, 18, 19, 22, 23, 24, 27, 28, 29} : Finset Vertex) = {0, 1, 2, 3, 4, 5, 6, 9, 10, 11, 16, 17, 21, 22, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 1, 3, 4, 5, 10, 11, 12, 13, 17, 18, 19, 22, 23, 24, 27, 28, 29} : Finset Vertex) = 969817147 ∧
    ({0, 1, 3, 4, 5, 10, 11, 12, 13, 17, 18, 19, 22, 23, 24, 27, 28, 29} : Finset Vertex).card = 18 ∧ orbitCodeInverse 969817147 = 213
  decide +kernel

theorem kernel_cert_214 : KernelCertificate 214 := by
  change row ({0, 1, 2, 3, 4, 5, 6, 9, 10, 11, 16, 17, 21, 22, 23, 24, 25, 29, 30} : Finset Vertex) = {5, 6, 7, 11, 12, 15, 16, 17, 18, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 2, 3, 4, 5, 6, 9, 10, 11, 16, 17, 21, 22, 23, 24, 25, 29, 30} : Finset Vertex) = 1675824767 ∧
    ({0, 1, 2, 3, 4, 5, 6, 9, 10, 11, 16, 17, 21, 22, 23, 24, 25, 29, 30} : Finset Vertex).card = 19 ∧ orbitCodeInverse 1675824767 = 214
  decide +kernel

theorem kernel_cert_215 : KernelCertificate 215 := by
  change row ({5, 6, 7, 11, 12, 15, 16, 17, 18, 28, 29, 30, 31} : Finset Vertex) = {0, 4, 5, 10, 11, 12, 13, 17, 18, 19, 23, 27, 28, 29} ∧
    orbitFingerprint ({5, 6, 7, 11, 12, 15, 16, 17, 18, 28, 29, 30, 31} : Finset Vertex) = 4027029728 ∧
    ({5, 6, 7, 11, 12, 15, 16, 17, 18, 28, 29, 30, 31} : Finset Vertex).card = 13 ∧ orbitCodeInverse 4027029728 = 215
  decide +kernel

#print axioms kernel_cert_215
end W04
