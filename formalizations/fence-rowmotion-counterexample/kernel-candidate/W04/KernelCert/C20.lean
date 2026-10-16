import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_160 : KernelCertificate 160 := by
  change row ({0, 3, 4, 5, 6, 9, 10, 11, 12, 13, 16, 17, 18, 22, 23, 24, 28, 29} : Finset Vertex) = {0, 1, 5, 6, 7, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 9, 10, 11, 12, 13, 16, 17, 18, 22, 23, 24, 28, 29} : Finset Vertex) = 835141241 ∧
    ({0, 3, 4, 5, 6, 9, 10, 11, 12, 13, 16, 17, 18, 22, 23, 24, 28, 29} : Finset Vertex).card = 18 ∧ orbitCodeInverse 835141241 = 160
  decide +kernel

theorem kernel_cert_161 : KernelCertificate 161 := by
  change row ({0, 1, 5, 6, 7, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex) = {4, 5, 11, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 5, 6, 7, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex) = 2079293667 ∧
    ({0, 1, 5, 6, 7, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex).card = 19 ∧ orbitCodeInverse 2079293667 = 161
  decide +kernel

theorem kernel_cert_162 : KernelCertificate 162 := by
  change row ({4, 5, 11, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex) = {0, 3, 4, 5, 6, 10, 11, 12, 16, 17} ∧
    orbitFingerprint ({4, 5, 11, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex) = 4294838320 ∧
    ({4, 5, 11, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex).card = 18 ∧ orbitCodeInverse 4294838320 = 162
  decide +kernel

theorem kernel_cert_163 : KernelCertificate 163 := by
  change row ({0, 3, 4, 5, 6, 10, 11, 12, 16, 17} : Finset Vertex) = {0, 1, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 10, 11, 12, 16, 17} : Finset Vertex) = 203897 ∧
    ({0, 3, 4, 5, 6, 10, 11, 12, 16, 17} : Finset Vertex).card = 10 ∧ orbitCodeInverse 203897 = 163
  decide +kernel

theorem kernel_cert_164 : KernelCertificate 164 := by
  change row ({0, 1, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 29} : Finset Vertex) = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 28, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 29} : Finset Vertex) = 545767139 ∧
    ({0, 1, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 29} : Finset Vertex).card = 16 ∧ orbitCodeInverse 545767139 = 164
  decide +kernel

theorem kernel_cert_165 : KernelCertificate 165 := by
  change row ({4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 28, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 28, 29, 30} : Finset Vertex) = 1909456880 ∧
    ({4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 28, 29, 30} : Finset Vertex).card = 22 ∧ orbitCodeInverse 1909456880 = 165
  decide +kernel

theorem kernel_cert_166 : KernelCertificate 166 := by
  change row ({0, 3, 4, 5, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 6, 11, 17, 23, 24, 25, 26, 27, 28, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex) = 4225761337 ∧
    ({0, 3, 4, 5, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex).card = 14 ∧ orbitCodeInverse 4225761337 = 166
  decide +kernel

theorem kernel_cert_167 : KernelCertificate 167 := by
  change row ({0, 1, 5, 6, 11, 17, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex) = {4, 5, 6, 7, 10, 11, 12, 16, 17, 18, 22, 23, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 6, 11, 17, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex) = 1065486435 ∧
    ({0, 1, 5, 6, 11, 17, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex).card = 13 ∧ orbitCodeInverse 1065486435 = 167
  decide +kernel

#print axioms kernel_cert_167
end W04
