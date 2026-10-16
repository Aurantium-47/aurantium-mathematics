import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_216 : KernelCertificate 216 := by
  change row ({0, 4, 5, 10, 11, 12, 13, 17, 18, 19, 23, 27, 28, 29} : Finset Vertex) = {0, 1, 3, 4, 5, 6, 9, 10, 11, 16, 17, 22, 23, 24, 29, 30} ∧
    orbitFingerprint ({0, 4, 5, 10, 11, 12, 13, 17, 18, 19, 23, 27, 28, 29} : Finset Vertex) = 948845617 ∧
    ({0, 4, 5, 10, 11, 12, 13, 17, 18, 19, 23, 27, 28, 29} : Finset Vertex).card = 14 ∧ orbitCodeInverse 948845617 = 216
  decide +kernel

theorem kernel_cert_217 : KernelCertificate 217 := by
  change row ({0, 1, 3, 4, 5, 6, 9, 10, 11, 16, 17, 22, 23, 24, 29, 30} : Finset Vertex) = {0, 1, 2, 3, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 21, 22, 23, 24, 25, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 3, 4, 5, 6, 9, 10, 11, 16, 17, 22, 23, 24, 29, 30} : Finset Vertex) = 1640173179 ∧
    ({0, 1, 3, 4, 5, 6, 9, 10, 11, 16, 17, 22, 23, 24, 29, 30} : Finset Vertex).card = 16 ∧ orbitCodeInverse 1640173179 = 217
  decide +kernel

theorem kernel_cert_218 : KernelCertificate 218 := by
  change row ({0, 1, 2, 3, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex) = {10, 11, 12, 13, 17, 18, 19, 27, 28, 29} ∧
    orbitFingerprint ({0, 1, 2, 3, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex) = 4092041471 ∧
    ({0, 1, 2, 3, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex).card = 23 ∧ orbitCodeInverse 4092041471 = 218
  decide +kernel

theorem kernel_cert_219 : KernelCertificate 219 := by
  change row ({10, 11, 12, 13, 17, 18, 19, 27, 28, 29} : Finset Vertex) = {0, 5, 9, 10, 11, 16, 17, 23, 29, 30} ∧
    orbitFingerprint ({10, 11, 12, 13, 17, 18, 19, 27, 28, 29} : Finset Vertex) = 940456960 ∧
    ({10, 11, 12, 13, 17, 18, 19, 27, 28, 29} : Finset Vertex).card = 10 ∧ orbitCodeInverse 940456960 = 219
  decide +kernel

theorem kernel_cert_220 : KernelCertificate 220 := by
  change row ({0, 5, 9, 10, 11, 16, 17, 23, 29, 30} : Finset Vertex) = {0, 1, 4, 5, 6, 11, 12, 15, 16, 17, 18, 22, 23, 24, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 5, 9, 10, 11, 16, 17, 23, 29, 30} : Finset Vertex) = 1619201569 ∧
    ({0, 5, 9, 10, 11, 16, 17, 23, 29, 30} : Finset Vertex).card = 10 ∧ orbitCodeInverse 1619201569 = 220
  decide +kernel

theorem kernel_cert_221 : KernelCertificate 221 := by
  change row ({0, 1, 4, 5, 6, 11, 12, 15, 16, 17, 18, 22, 23, 24, 28, 29, 30, 31} : Finset Vertex) = {3, 4, 5, 6, 7, 10, 11, 12, 13, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29} ∧
    orbitFingerprint ({0, 1, 4, 5, 6, 11, 12, 15, 16, 17, 18, 22, 23, 24, 28, 29, 30, 31} : Finset Vertex) = 4056389747 ∧
    ({0, 1, 4, 5, 6, 11, 12, 15, 16, 17, 18, 22, 23, 24, 28, 29, 30, 31} : Finset Vertex).card = 18 ∧ orbitCodeInverse 4056389747 = 221
  decide +kernel

theorem kernel_cert_222 : KernelCertificate 222 := by
  change row ({3, 4, 5, 6, 7, 10, 11, 12, 13, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex) = {0, 9, 10, 11, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30} ∧
    orbitFingerprint ({3, 4, 5, 6, 7, 10, 11, 12, 13, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex) = 1005468920 ∧
    ({3, 4, 5, 6, 7, 10, 11, 12, 13, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex).card = 20 ∧ orbitCodeInverse 1005468920 = 222
  decide +kernel

theorem kernel_cert_223 : KernelCertificate 223 := by
  change row ({0, 9, 10, 11, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex) = {0, 1, 5, 11, 12, 15, 16, 17, 29, 30, 31} ∧
    orbitFingerprint ({0, 9, 10, 11, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex) = 2147421697 ∧
    ({0, 9, 10, 11, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex).card = 19 ∧ orbitCodeInverse 2147421697 = 223
  decide +kernel

#print axioms kernel_cert_223
end W04
