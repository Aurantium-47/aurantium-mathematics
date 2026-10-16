import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_064 : KernelCertificate 64 := by
  change row ({0, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 15, 16, 17, 18, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = {9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 15, 16, 17, 18, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = 971488511 ∧
    ({0, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 15, 16, 17, 18, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex).card = 23 ∧ orbitCodeInverse 971488511 = 64
  decide +kernel

theorem kernel_cert_065 : KernelCertificate 65 := by
  change row ({9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 23, 24, 25, 29, 30} : Finset Vertex) = {0, 5, 22, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 23, 24, 25, 29, 30} : Finset Vertex) = 1670381056 ∧
    ({9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 23, 24, 25, 29, 30} : Finset Vertex).card = 16 ∧ orbitCodeInverse 1670381056 = 65
  decide +kernel

theorem kernel_cert_066 : KernelCertificate 66 := by
  change row ({0, 5, 22, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 4, 5, 6, 11, 17, 21, 22, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 5, 22, 23, 28, 29, 30, 31} : Finset Vertex) = 4039114785 ∧
    ({0, 5, 22, 23, 28, 29, 30, 31} : Finset Vertex).card = 8 ∧ orbitCodeInverse 4039114785 = 66
  decide +kernel

theorem kernel_cert_067 : KernelCertificate 67 := by
  change row ({0, 1, 4, 5, 6, 11, 17, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = {3, 4, 5, 6, 7, 10, 11, 12, 16, 17, 18, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 1, 4, 5, 6, 11, 17, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = 971114611 ∧
    ({0, 1, 4, 5, 6, 11, 17, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex).card = 14 ∧ orbitCodeInverse 971114611 = 67
  decide +kernel

theorem kernel_cert_068 : KernelCertificate 68 := by
  change row ({3, 4, 5, 6, 7, 10, 11, 12, 16, 17, 18, 23, 24, 25, 29, 30} : Finset Vertex) = {0, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({3, 4, 5, 6, 7, 10, 11, 12, 16, 17, 18, 23, 24, 25, 29, 30} : Finset Vertex) = 1669799160 ∧
    ({3, 4, 5, 6, 7, 10, 11, 12, 16, 17, 18, 23, 24, 25, 29, 30} : Finset Vertex).card = 16 ∧ orbitCodeInverse 1669799160 = 68
  decide +kernel

theorem kernel_cert_069 : KernelCertificate 69 := by
  change row ({0, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 28, 29, 30, 31} : Finset Vertex) = 4040146433 ∧
    ({0, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 28, 29, 30, 31} : Finset Vertex).card = 17 ∧ orbitCodeInverse 4040146433 = 69
  decide +kernel

theorem kernel_cert_070 : KernelCertificate 70 := by
  change row ({0, 1, 5, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = {4, 5, 6, 10, 11, 17, 18, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = 971241507 ∧
    ({0, 1, 5, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex).card = 17 ∧ orbitCodeInverse 971241507 = 70
  decide +kernel

theorem kernel_cert_071 : KernelCertificate 71 := by
  change row ({4, 5, 6, 10, 11, 17, 18, 23, 24, 25, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 16, 17, 18, 19, 22, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 10, 11, 17, 18, 23, 24, 25, 29, 30} : Finset Vertex) = 1669729392 ∧
    ({4, 5, 6, 10, 11, 17, 18, 23, 24, 25, 29, 30} : Finset Vertex).card = 12 ∧ orbitCodeInverse 1669729392 = 71
  decide +kernel

#print axioms kernel_cert_071
end W04
