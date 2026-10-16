import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_136 : KernelCertificate 136 := by
  change row ({5, 6, 9, 10, 11, 12, 17, 18, 19, 20, 21, 22, 23, 28, 29} : Finset Vertex) = {0, 4, 5, 6, 7, 11, 12, 13, 16, 17, 23, 24, 27, 28, 29, 30} ∧
    orbitFingerprint ({5, 6, 9, 10, 11, 12, 17, 18, 19, 20, 21, 22, 23, 28, 29} : Finset Vertex) = 821960288 ∧
    ({5, 6, 9, 10, 11, 12, 17, 18, 19, 20, 21, 22, 23, 28, 29} : Finset Vertex).card = 15 ∧ orbitCodeInverse 821960288 = 136
  decide +kernel

theorem kernel_cert_137 : KernelCertificate 137 := by
  change row ({0, 4, 5, 6, 7, 11, 12, 13, 16, 17, 23, 24, 27, 28, 29, 30} : Finset Vertex) = {0, 1, 3, 4, 5, 10, 11, 15, 16, 17, 18, 22, 23, 24, 25, 29, 30, 31} ∧
    orbitFingerprint ({0, 4, 5, 6, 7, 11, 12, 13, 16, 17, 23, 24, 27, 28, 29, 30} : Finset Vertex) = 2038642929 ∧
    ({0, 4, 5, 6, 7, 11, 12, 13, 16, 17, 23, 24, 27, 28, 29, 30} : Finset Vertex).card = 16 ∧ orbitCodeInverse 2038642929 = 137
  decide +kernel

theorem kernel_cert_138 : KernelCertificate 138 := by
  change row ({0, 1, 3, 4, 5, 10, 11, 15, 16, 17, 18, 22, 23, 24, 25, 29, 30, 31} : Finset Vertex) = {0, 1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 17, 18, 19, 21, 22, 23, 28, 29} ∧
    orbitFingerprint ({0, 1, 3, 4, 5, 10, 11, 15, 16, 17, 18, 22, 23, 24, 25, 29, 30, 31} : Finset Vertex) = 3821505595 ∧
    ({0, 1, 3, 4, 5, 10, 11, 15, 16, 17, 18, 22, 23, 24, 25, 29, 30, 31} : Finset Vertex).card = 18 ∧ orbitCodeInverse 3821505595 = 138
  decide +kernel

theorem kernel_cert_139 : KernelCertificate 139 := by
  change row ({0, 1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 17, 18, 19, 21, 22, 23, 28, 29} : Finset Vertex) = {5, 6, 7, 11, 12, 13, 16, 17, 18, 19, 20, 21, 22, 23, 24, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 17, 18, 19, 21, 22, 23, 28, 29} : Finset Vertex) = 820911743 ∧
    ({0, 1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 17, 18, 19, 21, 22, 23, 28, 29} : Finset Vertex).card = 19 ∧ orbitCodeInverse 820911743 = 139
  decide +kernel

theorem kernel_cert_140 : KernelCertificate 140 := by
  change row ({5, 6, 7, 11, 12, 13, 16, 17, 18, 19, 20, 21, 22, 23, 24, 27, 28, 29, 30} : Finset Vertex) = {0, 4, 5, 10, 11, 15, 16, 17, 23, 24, 25, 29, 30, 31} ∧
    orbitFingerprint ({5, 6, 7, 11, 12, 13, 16, 17, 18, 19, 20, 21, 22, 23, 24, 27, 28, 29, 30} : Finset Vertex) = 2046769376 ∧
    ({5, 6, 7, 11, 12, 13, 16, 17, 18, 19, 20, 21, 22, 23, 24, 27, 28, 29, 30} : Finset Vertex).card = 19 ∧ orbitCodeInverse 2046769376 = 140
  decide +kernel

theorem kernel_cert_141 : KernelCertificate 141 := by
  change row ({0, 4, 5, 10, 11, 15, 16, 17, 23, 24, 25, 29, 30, 31} : Finset Vertex) = {0, 1, 3, 4, 5, 6, 9, 10, 11, 12, 17, 18, 22, 23, 28, 29} ∧
    orbitFingerprint ({0, 4, 5, 10, 11, 15, 16, 17, 23, 24, 25, 29, 30, 31} : Finset Vertex) = 3817049137 ∧
    ({0, 4, 5, 10, 11, 15, 16, 17, 23, 24, 25, 29, 30, 31} : Finset Vertex).card = 14 ∧ orbitCodeInverse 3817049137 = 141
  decide +kernel

theorem kernel_cert_142 : KernelCertificate 142 := by
  change row ({0, 1, 3, 4, 5, 6, 9, 10, 11, 12, 17, 18, 22, 23, 28, 29} : Finset Vertex) = {0, 1, 2, 3, 4, 5, 6, 7, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 1, 3, 4, 5, 6, 9, 10, 11, 12, 17, 18, 22, 23, 28, 29} : Finset Vertex) = 818290299 ∧
    ({0, 1, 3, 4, 5, 6, 9, 10, 11, 12, 17, 18, 22, 23, 28, 29} : Finset Vertex).card = 16 ∧ orbitCodeInverse 818290299 = 142
  decide +kernel

theorem kernel_cert_143 : KernelCertificate 143 := by
  change row ({0, 1, 2, 3, 4, 5, 6, 7, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 27, 28, 29, 30} : Finset Vertex) = {10, 11, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 2, 3, 4, 5, 6, 7, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 27, 28, 29, 30} : Finset Vertex) = 2045720831 ∧
    ({0, 1, 2, 3, 4, 5, 6, 7, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 27, 28, 29, 30} : Finset Vertex).card = 23 ∧ orbitCodeInverse 2045720831 = 143
  decide +kernel

#print axioms kernel_cert_143
end W04
