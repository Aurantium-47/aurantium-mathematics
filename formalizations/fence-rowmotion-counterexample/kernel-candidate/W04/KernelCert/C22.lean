import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_176 : KernelCertificate 176 := by
  change row ({0, 1, 5, 6, 11, 12, 13, 17, 21, 22, 23} : Finset Vertex) = {4, 5, 6, 7, 10, 11, 16, 17, 18, 23, 24, 29} ∧
    orbitFingerprint ({0, 1, 5, 6, 11, 12, 13, 17, 21, 22, 23} : Finset Vertex) = 14825571 ∧
    ({0, 1, 5, 6, 11, 12, 13, 17, 21, 22, 23} : Finset Vertex).card = 11 ∧ orbitCodeInverse 14825571 = 176
  decide +kernel

theorem kernel_cert_177 : KernelCertificate 177 := by
  change row ({4, 5, 6, 7, 10, 11, 16, 17, 18, 23, 24, 29} : Finset Vertex) = {0, 3, 4, 5, 9, 10, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 28, 29, 30} ∧
    orbitFingerprint ({4, 5, 6, 7, 10, 11, 16, 17, 18, 23, 24, 29} : Finset Vertex) = 562498800 ∧
    ({4, 5, 6, 7, 10, 11, 16, 17, 18, 23, 24, 29} : Finset Vertex).card = 12 ∧ orbitCodeInverse 562498800 = 177
  decide +kernel

theorem kernel_cert_178 : KernelCertificate 178 := by
  change row ({0, 3, 4, 5, 9, 10, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 28, 29, 30} : Finset Vertex) = {0, 1, 5, 6, 11, 12, 13, 21, 22, 23, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 3, 4, 5, 9, 10, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 28, 29, 30} : Finset Vertex) = 1942986297 ∧
    ({0, 3, 4, 5, 9, 10, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 28, 29, 30} : Finset Vertex).card = 20 ∧ orbitCodeInverse 1942986297 = 178
  decide +kernel

theorem kernel_cert_179 : KernelCertificate 179 := by
  change row ({0, 1, 5, 6, 11, 12, 13, 21, 22, 23, 27, 28, 29, 30, 31} : Finset Vertex) = {4, 5, 6, 7, 10, 11, 17, 23, 24} ∧
    orbitFingerprint ({0, 1, 5, 6, 11, 12, 13, 21, 22, 23, 27, 28, 29, 30, 31} : Finset Vertex) = 4175444067 ∧
    ({0, 1, 5, 6, 11, 12, 13, 21, 22, 23, 27, 28, 29, 30, 31} : Finset Vertex).card = 15 ∧ orbitCodeInverse 4175444067 = 179
  decide +kernel

theorem kernel_cert_180 : KernelCertificate 180 := by
  change row ({4, 5, 6, 7, 10, 11, 17, 23, 24} : Finset Vertex) = {0, 3, 4, 5, 9, 10, 11, 12, 16, 17, 18, 22, 23, 24, 25, 29} ∧
    orbitFingerprint ({4, 5, 6, 7, 10, 11, 17, 23, 24} : Finset Vertex) = 25300208 ∧
    ({4, 5, 6, 7, 10, 11, 17, 23, 24} : Finset Vertex).card = 9 ∧ orbitCodeInverse 25300208 = 180
  decide +kernel

theorem kernel_cert_181 : KernelCertificate 181 := by
  change row ({0, 3, 4, 5, 9, 10, 11, 12, 16, 17, 18, 22, 23, 24, 25, 29} : Finset Vertex) = {0, 1, 5, 6, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 28, 29, 30} ∧
    orbitFingerprint ({0, 3, 4, 5, 9, 10, 11, 12, 16, 17, 18, 22, 23, 24, 25, 29} : Finset Vertex) = 600251961 ∧
    ({0, 3, 4, 5, 9, 10, 11, 12, 16, 17, 18, 22, 23, 24, 25, 29} : Finset Vertex).card = 16 ∧ orbitCodeInverse 600251961 = 181
  decide +kernel

theorem kernel_cert_182 : KernelCertificate 182 := by
  change row ({0, 1, 5, 6, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 28, 29, 30} : Finset Vertex) = {4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 5, 6, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 28, 29, 30} : Finset Vertex) = 1894758499 ∧
    ({0, 1, 5, 6, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 28, 29, 30} : Finset Vertex).card = 18 ∧ orbitCodeInverse 1894758499 = 182
  decide +kernel

theorem kernel_cert_183 : KernelCertificate 183 := by
  change row ({4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 27, 28, 29, 30, 31} : Finset Vertex) = {0, 3, 4, 5, 9, 10, 11, 23, 24, 25} ∧
    orbitFingerprint ({4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 27, 28, 29, 30, 31} : Finset Vertex) = 4194303216 ∧
    ({4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 27, 28, 29, 30, 31} : Finset Vertex).card = 24 ∧ orbitCodeInverse 4194303216 = 183
  decide +kernel

#print axioms kernel_cert_183
end W04
