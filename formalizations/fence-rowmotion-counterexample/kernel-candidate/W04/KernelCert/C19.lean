import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_152 : KernelCertificate 152 := by
  change row ({0, 1, 5, 6, 7, 8, 9, 10, 11, 12, 13, 17, 18, 19, 21, 22, 23, 27, 28, 29, 30} : Finset Vertex) = {4, 5, 16, 17, 18, 19, 20, 21, 22, 23, 24, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 5, 6, 7, 8, 9, 10, 11, 12, 13, 17, 18, 19, 21, 22, 23, 27, 28, 29, 30} : Finset Vertex) = 2028879843 ∧
    ({0, 1, 5, 6, 7, 8, 9, 10, 11, 12, 13, 17, 18, 19, 21, 22, 23, 27, 28, 29, 30} : Finset Vertex).card = 21 ∧ orbitCodeInverse 2028879843 = 152
  decide +kernel

theorem kernel_cert_153 : KernelCertificate 153 := by
  change row ({4, 5, 16, 17, 18, 19, 20, 21, 22, 23, 24, 29, 30, 31} : Finset Vertex) = {0, 3, 4, 5, 6, 11, 15, 16, 17, 23, 24, 25, 28, 29} ∧
    orbitFingerprint ({4, 5, 16, 17, 18, 19, 20, 21, 22, 23, 24, 29, 30, 31} : Finset Vertex) = 3791585328 ∧
    ({4, 5, 16, 17, 18, 19, 20, 21, 22, 23, 24, 29, 30, 31} : Finset Vertex).card = 14 ∧ orbitCodeInverse 3791585328 = 153
  decide +kernel

theorem kernel_cert_154 : KernelCertificate 154 := by
  change row ({0, 3, 4, 5, 6, 11, 15, 16, 17, 23, 24, 25, 28, 29} : Finset Vertex) = {0, 1, 5, 6, 7, 10, 11, 12, 17, 18, 22, 23, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 11, 15, 16, 17, 23, 24, 25, 28, 29} : Finset Vertex) = 864258169 ∧
    ({0, 3, 4, 5, 6, 11, 15, 16, 17, 23, 24, 25, 28, 29} : Finset Vertex).card = 14 ∧ orbitCodeInverse 864258169 = 154
  decide +kernel

theorem kernel_cert_155 : KernelCertificate 155 := by
  change row ({0, 1, 5, 6, 7, 10, 11, 12, 17, 18, 22, 23, 27, 28, 29, 30} : Finset Vertex) = {4, 5, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 5, 6, 7, 10, 11, 12, 17, 18, 22, 23, 27, 28, 29, 30} : Finset Vertex) = 2026249443 ∧
    ({0, 1, 5, 6, 7, 10, 11, 12, 17, 18, 22, 23, 27, 28, 29, 30} : Finset Vertex).card = 16 ∧ orbitCodeInverse 2026249443 = 155
  decide +kernel

theorem kernel_cert_156 : KernelCertificate 156 := by
  change row ({4, 5, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 29, 30, 31} : Finset Vertex) = {0, 3, 4, 5, 6, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 28, 29} ∧
    orbitFingerprint ({4, 5, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 29, 30, 31} : Finset Vertex) = 3790552624 ∧
    ({4, 5, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 29, 30, 31} : Finset Vertex).card = 18 ∧ orbitCodeInverse 3790552624 = 156
  decide +kernel

theorem kernel_cert_157 : KernelCertificate 157 := by
  change row ({0, 3, 4, 5, 6, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 28, 29} : Finset Vertex) = {0, 1, 5, 6, 7, 11, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 28, 29} : Finset Vertex) = 872382585 ∧
    ({0, 3, 4, 5, 6, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 28, 29} : Finset Vertex).card = 18 ∧ orbitCodeInverse 872382585 = 157
  decide +kernel

theorem kernel_cert_158 : KernelCertificate 158 := by
  change row ({0, 1, 5, 6, 7, 11, 27, 28, 29, 30} : Finset Vertex) = {4, 5, 10, 11, 12, 17, 23, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 5, 6, 7, 11, 27, 28, 29, 30} : Finset Vertex) = 2013268195 ∧
    ({0, 1, 5, 6, 7, 11, 27, 28, 29, 30} : Finset Vertex).card = 10 ∧ orbitCodeInverse 2013268195 = 158
  decide +kernel

theorem kernel_cert_159 : KernelCertificate 159 := by
  change row ({4, 5, 10, 11, 12, 17, 23, 29, 30, 31} : Finset Vertex) = {0, 3, 4, 5, 6, 9, 10, 11, 12, 13, 16, 17, 18, 22, 23, 24, 28, 29} ∧
    orbitFingerprint ({4, 5, 10, 11, 12, 17, 23, 29, 30, 31} : Finset Vertex) = 3766623280 ∧
    ({4, 5, 10, 11, 12, 17, 23, 29, 30, 31} : Finset Vertex).card = 10 ∧ orbitCodeInverse 3766623280 = 159
  decide +kernel

#print axioms kernel_cert_159
end W04
