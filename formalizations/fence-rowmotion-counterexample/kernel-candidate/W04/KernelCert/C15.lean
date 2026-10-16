import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_120 : KernelCertificate 120 := by
  change row ({4, 5, 6, 10, 11, 12, 15, 16, 17, 18, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex) = {0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 17, 18, 19, 21, 22, 23, 27, 28, 29} ∧
    orbitFingerprint ({4, 5, 6, 10, 11, 12, 15, 16, 17, 18, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex) = 4089945200 ∧
    ({4, 5, 6, 10, 11, 12, 15, 16, 17, 18, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex).card = 18 ∧ orbitCodeInverse 4089945200 = 120
  decide +kernel

theorem kernel_cert_121 : KernelCertificate 121 := by
  change row ({0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 17, 18, 19, 21, 22, 23, 27, 28, 29} : Finset Vertex) = {0, 1, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18, 19, 20, 21, 22, 23, 24, 29, 30} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 17, 18, 19, 21, 22, 23, 27, 28, 29} : Finset Vertex) = 955137785 ∧
    ({0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 17, 18, 19, 21, 22, 23, 27, 28, 29} : Finset Vertex).card = 20 ∧ orbitCodeInverse 955137785 = 121
  decide +kernel

theorem kernel_cert_122 : KernelCertificate 122 := by
  change row ({0, 1, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18, 19, 20, 21, 22, 23, 24, 29, 30} : Finset Vertex) = {4, 5, 11, 12, 15, 16, 17, 23, 24, 25, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18, 19, 20, 21, 22, 23, 24, 29, 30} : Finset Vertex) = 1644105699 ∧
    ({0, 1, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18, 19, 20, 21, 22, 23, 24, 29, 30} : Finset Vertex).card = 20 ∧ orbitCodeInverse 1644105699 = 122
  decide +kernel

theorem kernel_cert_123 : KernelCertificate 123 := by
  change row ({4, 5, 11, 12, 15, 16, 17, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex) = {0, 3, 4, 5, 6, 10, 11, 12, 13, 17, 18, 22, 23, 27, 28, 29} ∧
    orbitFingerprint ({4, 5, 11, 12, 15, 16, 17, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex) = 4085487664 ∧
    ({4, 5, 11, 12, 15, 16, 17, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex).card = 14 ∧ orbitCodeInverse 4085487664 = 123
  decide +kernel

theorem kernel_cert_124 : KernelCertificate 124 := by
  change row ({0, 3, 4, 5, 6, 10, 11, 12, 13, 17, 18, 22, 23, 27, 28, 29} : Finset Vertex) = {0, 1, 5, 6, 7, 9, 10, 11, 16, 17, 18, 19, 21, 22, 23, 24, 29, 30} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 10, 11, 12, 13, 17, 18, 22, 23, 27, 28, 29} : Finset Vertex) = 952515705 ∧
    ({0, 3, 4, 5, 6, 10, 11, 12, 13, 17, 18, 22, 23, 27, 28, 29} : Finset Vertex).card = 16 ∧ orbitCodeInverse 952515705 = 124
  decide +kernel

theorem kernel_cert_125 : KernelCertificate 125 := by
  change row ({0, 1, 5, 6, 7, 9, 10, 11, 16, 17, 18, 19, 21, 22, 23, 24, 29, 30} : Finset Vertex) = {4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 5, 6, 7, 9, 10, 11, 16, 17, 18, 19, 21, 22, 23, 24, 29, 30} : Finset Vertex) = 1643056867 ∧
    ({0, 1, 5, 6, 7, 9, 10, 11, 16, 17, 18, 19, 21, 22, 23, 24, 29, 30} : Finset Vertex).card = 18 ∧ orbitCodeInverse 1643056867 = 125
  decide +kernel

theorem kernel_cert_126 : KernelCertificate 126 := by
  change row ({4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex) = {0, 3, 4, 5, 11, 12, 13, 27, 28, 29} ∧
    orbitFingerprint ({4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex) = 4093616112 ∧
    ({4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex).card = 24 ∧ orbitCodeInverse 4093616112 = 126
  decide +kernel

theorem kernel_cert_127 : KernelCertificate 127 := by
  change row ({0, 3, 4, 5, 11, 12, 13, 27, 28, 29} : Finset Vertex) = {0, 1, 5, 6, 10, 11, 17, 23, 29, 30} ∧
    orbitFingerprint ({0, 3, 4, 5, 11, 12, 13, 27, 28, 29} : Finset Vertex) = 939538489 ∧
    ({0, 3, 4, 5, 11, 12, 13, 27, 28, 29} : Finset Vertex).card = 10 ∧ orbitCodeInverse 939538489 = 127
  decide +kernel

#print axioms kernel_cert_127
end W04
