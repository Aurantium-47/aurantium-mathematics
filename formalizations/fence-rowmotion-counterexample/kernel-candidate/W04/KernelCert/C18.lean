import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_144 : KernelCertificate 144 := by
  change row ({10, 11, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 29, 30, 31} : Finset Vertex) = {0, 5, 9, 10, 11, 12, 28, 29} ∧
    orbitFingerprint ({10, 11, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 29, 30, 31} : Finset Vertex) = 3825175552 ∧
    ({10, 11, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 29, 30, 31} : Finset Vertex).card = 16 ∧ orbitCodeInverse 3825175552 = 144
  decide +kernel

theorem kernel_cert_145 : KernelCertificate 145 := by
  change row ({0, 5, 9, 10, 11, 12, 28, 29} : Finset Vertex) = {0, 1, 4, 5, 6, 11, 12, 13, 17, 23, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 5, 9, 10, 11, 12, 28, 29} : Finset Vertex) = 805314081 ∧
    ({0, 5, 9, 10, 11, 12, 28, 29} : Finset Vertex).card = 8 ∧ orbitCodeInverse 805314081 = 145
  decide +kernel

theorem kernel_cert_146 : KernelCertificate 146 := by
  change row ({0, 1, 4, 5, 6, 11, 12, 13, 17, 23, 27, 28, 29, 30} : Finset Vertex) = {3, 4, 5, 6, 7, 10, 11, 16, 17, 18, 22, 23, 24, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 4, 5, 6, 11, 12, 13, 17, 23, 27, 28, 29, 30} : Finset Vertex) = 2021800051 ∧
    ({0, 1, 4, 5, 6, 11, 12, 13, 17, 23, 27, 28, 29, 30} : Finset Vertex).card = 14 ∧ orbitCodeInverse 2021800051 = 146
  decide +kernel

theorem kernel_cert_147 : KernelCertificate 147 := by
  change row ({3, 4, 5, 6, 7, 10, 11, 16, 17, 18, 22, 23, 24, 29, 30, 31} : Finset Vertex) = {0, 9, 10, 11, 12, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 28, 29} ∧
    orbitFingerprint ({3, 4, 5, 6, 7, 10, 11, 16, 17, 18, 22, 23, 24, 29, 30, 31} : Finset Vertex) = 3787918584 ∧
    ({3, 4, 5, 6, 7, 10, 11, 16, 17, 18, 22, 23, 24, 29, 30, 31} : Finset Vertex).card = 16 ∧ orbitCodeInverse 3787918584 = 147
  decide +kernel

theorem kernel_cert_148 : KernelCertificate 148 := by
  change row ({0, 9, 10, 11, 12, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 28, 29} : Finset Vertex) = {0, 1, 5, 11, 12, 13, 17, 18, 19, 20, 21, 22, 23, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 9, 10, 11, 12, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 28, 29} : Finset Vertex) = 871341569 ∧
    ({0, 9, 10, 11, 12, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 28, 29} : Finset Vertex).card = 17 ∧ orbitCodeInverse 871341569 = 148
  decide +kernel

theorem kernel_cert_149 : KernelCertificate 149 := by
  change row ({0, 1, 5, 11, 12, 13, 17, 18, 19, 20, 21, 22, 23, 27, 28, 29, 30} : Finset Vertex) = {4, 5, 6, 10, 11, 16, 17, 23, 24, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 5, 11, 12, 13, 17, 18, 19, 20, 21, 22, 23, 27, 28, 29, 30} : Finset Vertex) = 2029926435 ∧
    ({0, 1, 5, 11, 12, 13, 17, 18, 19, 20, 21, 22, 23, 27, 28, 29, 30} : Finset Vertex).card = 17 ∧ orbitCodeInverse 2029926435 = 149
  decide +kernel

theorem kernel_cert_150 : KernelCertificate 150 := by
  change row ({4, 5, 6, 10, 11, 16, 17, 23, 24, 29, 30, 31} : Finset Vertex) = {0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 15, 16, 17, 18, 22, 23, 24, 25, 28, 29} ∧
    orbitFingerprint ({4, 5, 6, 10, 11, 16, 17, 23, 24, 29, 30, 31} : Finset Vertex) = 3783462000 ∧
    ({4, 5, 6, 10, 11, 16, 17, 23, 24, 29, 30, 31} : Finset Vertex).card = 12 ∧ orbitCodeInverse 3783462000 = 150
  decide +kernel

theorem kernel_cert_151 : KernelCertificate 151 := by
  change row ({0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 15, 16, 17, 18, 22, 23, 24, 25, 28, 29} : Finset Vertex) = {0, 1, 5, 6, 7, 8, 9, 10, 11, 12, 13, 17, 18, 19, 21, 22, 23, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 15, 16, 17, 18, 22, 23, 24, 25, 28, 29} : Finset Vertex) = 868720377 ∧
    ({0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 15, 16, 17, 18, 22, 23, 24, 25, 28, 29} : Finset Vertex).card = 20 ∧ orbitCodeInverse 868720377 = 151
  decide +kernel

#print axioms kernel_cert_151
end W04
