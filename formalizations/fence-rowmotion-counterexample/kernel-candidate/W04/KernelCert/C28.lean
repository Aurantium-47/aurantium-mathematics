import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_224 : KernelCertificate 224 := by
  change row ({0, 1, 5, 11, 12, 15, 16, 17, 29, 30, 31} : Finset Vertex) = {4, 5, 6, 10, 11, 12, 13, 17, 18, 23, 28, 29} ∧
    orbitFingerprint ({0, 1, 5, 11, 12, 15, 16, 17, 29, 30, 31} : Finset Vertex) = 3758331939 ∧
    ({0, 1, 5, 11, 12, 15, 16, 17, 29, 30, 31} : Finset Vertex).card = 11 ∧ orbitCodeInverse 3758331939 = 224
  decide +kernel

theorem kernel_cert_225 : KernelCertificate 225 := by
  change row ({4, 5, 6, 10, 11, 12, 13, 17, 18, 23, 28, 29} : Finset Vertex) = {0, 3, 4, 5, 6, 7, 9, 10, 11, 16, 17, 18, 19, 22, 23, 24, 27, 28, 29, 30} ∧
    orbitFingerprint ({4, 5, 6, 10, 11, 12, 13, 17, 18, 23, 28, 29} : Finset Vertex) = 814103664 ∧
    ({4, 5, 6, 10, 11, 12, 13, 17, 18, 23, 28, 29} : Finset Vertex).card = 12 ∧ orbitCodeInverse 814103664 = 225
  decide +kernel

theorem kernel_cert_226 : KernelCertificate 226 := by
  change row ({0, 3, 4, 5, 6, 7, 9, 10, 11, 16, 17, 18, 19, 22, 23, 24, 27, 28, 29, 30} : Finset Vertex) = {0, 1, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 17, 21, 22, 23, 24, 25, 29, 30, 31} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 7, 9, 10, 11, 16, 17, 18, 19, 22, 23, 24, 27, 28, 29, 30} : Finset Vertex) = 2043612921 ∧
    ({0, 3, 4, 5, 6, 7, 9, 10, 11, 16, 17, 18, 19, 22, 23, 24, 27, 28, 29, 30} : Finset Vertex).card = 20 ∧ orbitCodeInverse 2043612921 = 226
  decide +kernel

theorem kernel_cert_227 : KernelCertificate 227 := by
  change row ({0, 1, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 17, 21, 22, 23, 24, 25, 29, 30, 31} : Finset Vertex) = {4, 5, 11, 12, 13, 17, 18, 28, 29} ∧
    orbitFingerprint ({0, 1, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 17, 21, 22, 23, 24, 25, 29, 30, 31} : Finset Vertex) = 3823345635 ∧
    ({0, 1, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 17, 21, 22, 23, 24, 25, 29, 30, 31} : Finset Vertex).card = 21 ∧ orbitCodeInverse 3823345635 = 227
  decide +kernel

theorem kernel_cert_228 : KernelCertificate 228 := by
  change row ({4, 5, 11, 12, 13, 17, 18, 28, 29} : Finset Vertex) = {0, 3, 4, 5, 6, 10, 11, 16, 17, 18, 19, 23, 27, 28, 29, 30} ∧
    orbitFingerprint ({4, 5, 11, 12, 13, 17, 18, 28, 29} : Finset Vertex) = 805713968 ∧
    ({4, 5, 11, 12, 13, 17, 18, 28, 29} : Finset Vertex).card = 9 ∧ orbitCodeInverse 805713968 = 228
  decide +kernel

theorem kernel_cert_229 : KernelCertificate 229 := by
  change row ({0, 3, 4, 5, 6, 10, 11, 16, 17, 18, 19, 23, 27, 28, 29, 30} : Finset Vertex) = {0, 1, 5, 6, 7, 9, 10, 11, 12, 15, 16, 17, 22, 23, 24, 29, 30, 31} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 10, 11, 16, 17, 18, 19, 23, 27, 28, 29, 30} : Finset Vertex) = 2022640761 ∧
    ({0, 3, 4, 5, 6, 10, 11, 16, 17, 18, 19, 23, 27, 28, 29, 30} : Finset Vertex).card = 16 ∧ orbitCodeInverse 2022640761 = 229
  decide +kernel

theorem kernel_cert_230 : KernelCertificate 230 := by
  change row ({0, 1, 5, 6, 7, 9, 10, 11, 12, 15, 16, 17, 22, 23, 24, 29, 30, 31} : Finset Vertex) = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 25, 28, 29} ∧
    orbitFingerprint ({0, 1, 5, 6, 7, 9, 10, 11, 12, 15, 16, 17, 22, 23, 24, 29, 30, 31} : Finset Vertex) = 3787693795 ∧
    ({0, 1, 5, 6, 7, 9, 10, 11, 12, 15, 16, 17, 22, 23, 24, 29, 30, 31} : Finset Vertex).card = 18 ∧ orbitCodeInverse 3787693795 = 230
  decide +kernel

theorem kernel_cert_231 : KernelCertificate 231 := by
  change row ({4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 25, 28, 29} : Finset Vertex) = {0, 3, 4, 5, 16, 17, 18, 19, 27, 28, 29, 30} ∧
    orbitFingerprint ({4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 25, 28, 29} : Finset Vertex) = 870727664 ∧
    ({4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 25, 28, 29} : Finset Vertex).card = 19 ∧ orbitCodeInverse 870727664 = 231
  decide +kernel

#print axioms kernel_cert_231
end W04
