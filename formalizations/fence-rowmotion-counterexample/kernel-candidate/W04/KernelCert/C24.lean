import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_192 : KernelCertificate 192 := by
  change row ({4, 5, 6, 7, 10, 11, 12, 13, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 9, 10, 11, 17, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 7, 10, 11, 12, 13, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex) = 2145402096 ∧
    ({4, 5, 6, 7, 10, 11, 12, 13, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex).card = 18 ∧ orbitCodeInverse 2145402096 = 192
  decide +kernel

theorem kernel_cert_193 : KernelCertificate 193 := by
  change row ({0, 3, 4, 5, 9, 10, 11, 17, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 6, 11, 12, 16, 17, 18, 23, 28, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 9, 10, 11, 17, 29, 30, 31} : Finset Vertex) = 3758231097 ∧
    ({0, 3, 4, 5, 9, 10, 11, 17, 29, 30, 31} : Finset Vertex).card = 11 ∧ orbitCodeInverse 3758231097 = 193
  decide +kernel

theorem kernel_cert_194 : KernelCertificate 194 := by
  change row ({0, 1, 5, 6, 11, 12, 16, 17, 18, 23, 28, 29} : Finset Vertex) = {4, 5, 6, 7, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 24, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 6, 11, 12, 16, 17, 18, 23, 28, 29} : Finset Vertex) = 814159971 ∧
    ({0, 1, 5, 6, 11, 12, 16, 17, 18, 23, 28, 29} : Finset Vertex).card = 12 ∧ orbitCodeInverse 814159971 = 194
  decide +kernel

theorem kernel_cert_195 : KernelCertificate 195 := by
  change row ({4, 5, 6, 7, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 24, 27, 28, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 9, 10, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 7, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 24, 27, 28, 29, 30} : Finset Vertex) = 2043657456 ∧
    ({4, 5, 6, 7, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 24, 27, 28, 29, 30} : Finset Vertex).card = 20 ∧ orbitCodeInverse 2043657456 = 195
  decide +kernel

theorem kernel_cert_196 : KernelCertificate 196 := by
  change row ({0, 3, 4, 5, 9, 10, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 6, 17, 18, 28, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 9, 10, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 29, 30, 31} : Finset Vertex) = 3823369785 ∧
    ({0, 3, 4, 5, 9, 10, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 29, 30, 31} : Finset Vertex).card = 21 ∧ orbitCodeInverse 3823369785 = 196
  decide +kernel

theorem kernel_cert_197 : KernelCertificate 197 := by
  change row ({0, 1, 5, 6, 17, 18, 28, 29} : Finset Vertex) = {4, 5, 6, 7, 11, 16, 17, 18, 19, 23, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 6, 17, 18, 28, 29} : Finset Vertex) = 805699683 ∧
    ({0, 1, 5, 6, 17, 18, 28, 29} : Finset Vertex).card = 8 ∧ orbitCodeInverse 805699683 = 197
  decide +kernel

theorem kernel_cert_198 : KernelCertificate 198 := by
  change row ({4, 5, 6, 7, 11, 16, 17, 18, 19, 23, 27, 28, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 10, 11, 12, 15, 16, 17, 22, 23, 24, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 7, 11, 16, 17, 18, 19, 23, 27, 28, 29, 30} : Finset Vertex) = 2022639856 ∧
    ({4, 5, 6, 7, 11, 16, 17, 18, 19, 23, 27, 28, 29, 30} : Finset Vertex).card = 14 ∧ orbitCodeInverse 2022639856 = 198
  decide +kernel

theorem kernel_cert_199 : KernelCertificate 199 := by
  change row ({0, 3, 4, 5, 10, 11, 12, 15, 16, 17, 22, 23, 24, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 6, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 25, 28, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 10, 11, 12, 15, 16, 17, 22, 23, 24, 29, 30, 31} : Finset Vertex) = 3787693113 ∧
    ({0, 3, 4, 5, 10, 11, 12, 15, 16, 17, 22, 23, 24, 29, 30, 31} : Finset Vertex).card = 16 ∧ orbitCodeInverse 3787693113 = 199
  decide +kernel

#print axioms kernel_cert_199
end W04
