import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_184 : KernelCertificate 184 := by
  change row ({0, 3, 4, 5, 9, 10, 11, 23, 24, 25} : Finset Vertex) = {0, 1, 5, 6, 11, 12, 17, 22, 23, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 9, 10, 11, 23, 24, 25} : Finset Vertex) = 58723897 ∧
    ({0, 3, 4, 5, 9, 10, 11, 23, 24, 25} : Finset Vertex).card = 10 ∧ orbitCodeInverse 58723897 = 184
  decide +kernel

theorem kernel_cert_185 : KernelCertificate 185 := by
  change row ({0, 1, 5, 6, 11, 12, 17, 22, 23, 29} : Finset Vertex) = {4, 5, 6, 7, 10, 11, 12, 13, 16, 17, 18, 21, 22, 23, 24, 28, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 6, 11, 12, 17, 22, 23, 29} : Finset Vertex) = 549591139 ∧
    ({0, 1, 5, 6, 11, 12, 17, 22, 23, 29} : Finset Vertex).card = 10 ∧ orbitCodeInverse 549591139 = 185
  decide +kernel

theorem kernel_cert_186 : KernelCertificate 186 := by
  change row ({4, 5, 6, 7, 10, 11, 12, 13, 16, 17, 18, 21, 22, 23, 24, 28, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 9, 10, 11, 15, 16, 17, 18, 19, 23, 24, 25, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 7, 10, 11, 12, 13, 16, 17, 18, 21, 22, 23, 24, 28, 29, 30} : Finset Vertex) = 1910979824 ∧
    ({4, 5, 6, 7, 10, 11, 12, 13, 16, 17, 18, 21, 22, 23, 24, 28, 29, 30} : Finset Vertex).card = 18 ∧ orbitCodeInverse 1910979824 = 186
  decide +kernel

theorem kernel_cert_187 : KernelCertificate 187 := by
  change row ({0, 3, 4, 5, 9, 10, 11, 15, 16, 17, 18, 19, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 6, 11, 12, 22, 23, 24, 25, 26, 27, 28, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 9, 10, 11, 15, 16, 17, 18, 19, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex) = 4220489273 ∧
    ({0, 3, 4, 5, 9, 10, 11, 15, 16, 17, 18, 19, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex).card = 20 ∧ orbitCodeInverse 4220489273 = 187
  decide +kernel

theorem kernel_cert_188 : KernelCertificate 188 := by
  change row ({0, 1, 5, 6, 11, 12, 22, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex) = {4, 5, 6, 7, 10, 11, 12, 13, 17, 21, 22, 23, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 6, 11, 12, 22, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex) = 1069553763 ∧
    ({0, 1, 5, 6, 11, 12, 22, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex).card = 14 ∧ orbitCodeInverse 1069553763 = 188
  decide +kernel

theorem kernel_cert_189 : KernelCertificate 189 := by
  change row ({4, 5, 6, 7, 10, 11, 12, 13, 17, 21, 22, 23, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 9, 10, 11, 16, 17, 18, 23, 24, 28, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 7, 10, 11, 12, 13, 17, 21, 22, 23, 29, 30} : Finset Vertex) = 1625439472 ∧
    ({4, 5, 6, 7, 10, 11, 12, 13, 17, 21, 22, 23, 29, 30} : Finset Vertex).card = 14 ∧ orbitCodeInverse 1625439472 = 189
  decide +kernel

theorem kernel_cert_190 : KernelCertificate 190 := by
  change row ({0, 3, 4, 5, 9, 10, 11, 16, 17, 18, 23, 24, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 6, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 27, 28, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 9, 10, 11, 16, 17, 18, 23, 24, 28, 29, 30, 31} : Finset Vertex) = 4052160057 ∧
    ({0, 3, 4, 5, 9, 10, 11, 16, 17, 18, 23, 24, 28, 29, 30, 31} : Finset Vertex).card = 16 ∧ orbitCodeInverse 4052160057 = 190
  decide +kernel

theorem kernel_cert_191 : KernelCertificate 191 := by
  change row ({0, 1, 5, 6, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex) = {4, 5, 6, 7, 10, 11, 12, 13, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 6, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex) = 1003460707 ∧
    ({0, 1, 5, 6, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex).card = 18 ∧ orbitCodeInverse 1003460707 = 191
  decide +kernel

#print axioms kernel_cert_191
end W04
