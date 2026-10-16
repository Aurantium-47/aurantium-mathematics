import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_200 : KernelCertificate 200 := by
  change row ({0, 1, 5, 6, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 25, 28, 29} : Finset Vertex) = {4, 5, 6, 7, 16, 17, 18, 19, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 6, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 25, 28, 29} : Finset Vertex) = 870727267 ∧
    ({0, 1, 5, 6, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 25, 28, 29} : Finset Vertex).card = 18 ∧ orbitCodeInverse 870727267 = 200
  decide +kernel

theorem kernel_cert_201 : KernelCertificate 201 := by
  change row ({4, 5, 6, 7, 16, 17, 18, 19, 27, 28, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 11, 15, 16, 17, 23, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 7, 16, 17, 18, 19, 27, 28, 29, 30} : Finset Vertex) = 2014249200 ∧
    ({4, 5, 6, 7, 16, 17, 18, 19, 27, 28, 29, 30} : Finset Vertex).card = 12 ∧ orbitCodeInverse 2014249200 = 201
  decide +kernel

theorem kernel_cert_202 : KernelCertificate 202 := by
  change row ({0, 3, 4, 5, 11, 15, 16, 17, 23, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 6, 10, 11, 12, 17, 18, 22, 23, 24, 28, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 11, 15, 16, 17, 23, 29, 30, 31} : Finset Vertex) = 3766716473 ∧
    ({0, 3, 4, 5, 11, 15, 16, 17, 23, 29, 30, 31} : Finset Vertex).card = 12 ∧ orbitCodeInverse 3766716473 = 202
  decide +kernel

theorem kernel_cert_203 : KernelCertificate 203 := by
  change row ({0, 1, 5, 6, 10, 11, 12, 17, 18, 22, 23, 24, 28, 29} : Finset Vertex) = {4, 5, 6, 7, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 6, 10, 11, 12, 17, 18, 22, 23, 24, 28, 29} : Finset Vertex) = 835066979 ∧
    ({0, 1, 5, 6, 10, 11, 12, 17, 18, 22, 23, 24, 28, 29} : Finset Vertex).card = 14 ∧ orbitCodeInverse 835066979 = 203
  decide +kernel

theorem kernel_cert_204 : KernelCertificate 204 := by
  change row ({4, 5, 6, 7, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 7, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex) = 2079276784 ∧
    ({4, 5, 6, 7, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex).card = 22 ∧ orbitCodeInverse 2079276784 = 204
  decide +kernel

theorem kernel_cert_205 : KernelCertificate 205 := by
  change row ({0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 11, 12} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex) = 4294938617 ∧
    ({0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex).card = 27 ∧ orbitCodeInverse 4294938617 = 205
  decide +kernel

theorem kernel_cert_206 : KernelCertificate 206 := by
  change row ({0, 1, 11, 12} : Finset Vertex) = {5, 10, 11, 12, 13, 17, 23, 29} ∧
    orbitFingerprint ({0, 1, 11, 12} : Finset Vertex) = 6147 ∧
    ({0, 1, 11, 12} : Finset Vertex).card = 4 ∧ orbitCodeInverse 6147 = 206
  decide +kernel

theorem kernel_cert_207 : KernelCertificate 207 := by
  change row ({5, 10, 11, 12, 13, 17, 23, 29} : Finset Vertex) = {0, 4, 5, 6, 9, 10, 11, 16, 17, 18, 22, 23, 24, 28, 29, 30} ∧
    orbitFingerprint ({5, 10, 11, 12, 13, 17, 23, 29} : Finset Vertex) = 545405984 ∧
    ({5, 10, 11, 12, 13, 17, 23, 29} : Finset Vertex).card = 8 ∧ orbitCodeInverse 545405984 = 207
  decide +kernel

#print axioms kernel_cert_207
end W04
