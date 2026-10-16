import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_096 : KernelCertificate 96 := by
  change row ({3, 4, 5, 6, 16, 17, 18, 19, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex) = {0, 5, 6, 7, 11, 15, 16, 17, 21, 22, 23} ∧
    orbitFingerprint ({3, 4, 5, 6, 16, 17, 18, 19, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex) = 4291756152 ∧
    ({3, 4, 5, 6, 16, 17, 18, 19, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex).card = 18 ∧ orbitCodeInverse 4291756152 = 96
  decide +kernel

theorem kernel_cert_097 : KernelCertificate 97 := by
  change row ({0, 5, 6, 7, 11, 15, 16, 17, 21, 22, 23} : Finset Vertex) = {0, 1, 4, 5, 10, 11, 12, 17, 18, 23, 24, 29} ∧
    orbitFingerprint ({0, 5, 6, 7, 11, 15, 16, 17, 21, 22, 23} : Finset Vertex) = 14911713 ∧
    ({0, 5, 6, 7, 11, 15, 16, 17, 21, 22, 23} : Finset Vertex).card = 11 ∧ orbitCodeInverse 14911713 = 97
  decide +kernel

theorem kernel_cert_098 : KernelCertificate 98 := by
  change row ({0, 1, 4, 5, 10, 11, 12, 17, 18, 23, 24, 29} : Finset Vertex) = {3, 4, 5, 6, 9, 10, 11, 12, 13, 16, 17, 18, 19, 22, 23, 24, 25, 28, 29, 30} ∧
    orbitFingerprint ({0, 1, 4, 5, 10, 11, 12, 17, 18, 23, 24, 29} : Finset Vertex) = 562437171 ∧
    ({0, 1, 4, 5, 10, 11, 12, 17, 18, 23, 24, 29} : Finset Vertex).card = 12 ∧ orbitCodeInverse 562437171 = 98
  decide +kernel

theorem kernel_cert_099 : KernelCertificate 99 := by
  change row ({3, 4, 5, 6, 9, 10, 11, 12, 13, 16, 17, 18, 19, 22, 23, 24, 25, 28, 29, 30} : Finset Vertex) = {0, 5, 6, 7, 15, 16, 17, 21, 22, 23, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({3, 4, 5, 6, 9, 10, 11, 12, 13, 16, 17, 18, 19, 22, 23, 24, 25, 28, 29, 30} : Finset Vertex) = 1942961784 ∧
    ({3, 4, 5, 6, 9, 10, 11, 12, 13, 16, 17, 18, 19, 22, 23, 24, 25, 28, 29, 30} : Finset Vertex).card = 20 ∧ orbitCodeInverse 1942961784 = 99
  decide +kernel

theorem kernel_cert_100 : KernelCertificate 100 := by
  change row ({0, 5, 6, 7, 15, 16, 17, 21, 22, 23, 27, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 4, 5, 11, 17, 18, 23, 24} ∧
    orbitFingerprint ({0, 5, 6, 7, 15, 16, 17, 21, 22, 23, 27, 28, 29, 30, 31} : Finset Vertex) = 4175659233 ∧
    ({0, 5, 6, 7, 15, 16, 17, 21, 22, 23, 27, 28, 29, 30, 31} : Finset Vertex).card = 15 ∧ orbitCodeInverse 4175659233 = 100
  decide +kernel

theorem kernel_cert_101 : KernelCertificate 101 := by
  change row ({0, 1, 4, 5, 11, 17, 18, 23, 24} : Finset Vertex) = {3, 4, 5, 6, 10, 11, 12, 16, 17, 18, 19, 22, 23, 24, 25, 29} ∧
    orbitFingerprint ({0, 1, 4, 5, 11, 17, 18, 23, 24} : Finset Vertex) = 25561139 ∧
    ({0, 1, 4, 5, 11, 17, 18, 23, 24} : Finset Vertex).card = 9 ∧ orbitCodeInverse 25561139 = 101
  decide +kernel

theorem kernel_cert_102 : KernelCertificate 102 := by
  change row ({3, 4, 5, 6, 10, 11, 12, 16, 17, 18, 19, 22, 23, 24, 25, 29} : Finset Vertex) = {0, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 21, 22, 23, 28, 29, 30} ∧
    orbitFingerprint ({3, 4, 5, 6, 10, 11, 12, 16, 17, 18, 19, 22, 23, 24, 25, 29} : Finset Vertex) = 600775800 ∧
    ({3, 4, 5, 6, 10, 11, 12, 16, 17, 18, 19, 22, 23, 24, 25, 29} : Finset Vertex).card = 16 ∧ orbitCodeInverse 600775800 = 102
  decide +kernel

theorem kernel_cert_103 : KernelCertificate 103 := by
  change row ({0, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 21, 22, 23, 28, 29, 30} : Finset Vertex) = {0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 23, 24, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 21, 22, 23, 28, 29, 30} : Finset Vertex) = 1893973729 ∧
    ({0, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 21, 22, 23, 28, 29, 30} : Finset Vertex).card = 18 ∧ orbitCodeInverse 1893973729 = 103
  decide +kernel

#print axioms kernel_cert_103
end W04
