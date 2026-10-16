import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_128 : KernelCertificate 128 := by
  change row ({0, 1, 5, 6, 10, 11, 17, 23, 29, 30} : Finset Vertex) = {4, 5, 6, 7, 9, 10, 11, 12, 16, 17, 18, 22, 23, 24, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 5, 6, 10, 11, 17, 23, 29, 30} : Finset Vertex) = 1619135587 ∧
    ({0, 1, 5, 6, 10, 11, 17, 23, 29, 30} : Finset Vertex).card = 10 ∧ orbitCodeInverse 1619135587 = 128
  decide +kernel

theorem kernel_cert_129 : KernelCertificate 129 := by
  change row ({4, 5, 6, 7, 9, 10, 11, 12, 16, 17, 18, 22, 23, 24, 28, 29, 30, 31} : Finset Vertex) = {0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29} ∧
    orbitFingerprint ({4, 5, 6, 7, 9, 10, 11, 12, 16, 17, 18, 22, 23, 24, 28, 29, 30, 31} : Finset Vertex) = 4056358640 ∧
    ({4, 5, 6, 7, 9, 10, 11, 12, 16, 17, 18, 22, 23, 24, 28, 29, 30, 31} : Finset Vertex).card = 18 ∧ orbitCodeInverse 4056358640 = 129
  decide +kernel

theorem kernel_cert_130 : KernelCertificate 130 := by
  change row ({0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex) = {0, 1, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex) = 1005567993 ∧
    ({0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex).card = 25 ∧ orbitCodeInverse 1005567993 = 130
  decide +kernel

theorem kernel_cert_131 : KernelCertificate 131 := by
  change row ({0, 1, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex) = {5, 10, 11, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex) = 2147481603 ∧
    ({0, 1, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex).card = 22 ∧ orbitCodeInverse 2147481603 = 131
  decide +kernel

theorem kernel_cert_132 : KernelCertificate 132 := by
  change row ({5, 10, 11, 29, 30, 31} : Finset Vertex) = {0, 4, 5, 6, 9, 10, 11, 12, 17, 23, 28, 29} ∧
    orbitFingerprint ({5, 10, 11, 29, 30, 31} : Finset Vertex) = 3758099488 ∧
    ({5, 10, 11, 29, 30, 31} : Finset Vertex).card = 6 ∧ orbitCodeInverse 3758099488 = 132
  decide +kernel

theorem kernel_cert_133 : KernelCertificate 133 := by
  change row ({0, 4, 5, 6, 9, 10, 11, 12, 17, 23, 28, 29} : Finset Vertex) = {0, 1, 3, 4, 5, 6, 7, 11, 12, 13, 16, 17, 18, 22, 23, 24, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 4, 5, 6, 9, 10, 11, 12, 17, 23, 28, 29} : Finset Vertex) = 813833841 ∧
    ({0, 4, 5, 6, 9, 10, 11, 12, 17, 23, 28, 29} : Finset Vertex).card = 12 ∧ orbitCodeInverse 813833841 = 133
  decide +kernel

theorem kernel_cert_134 : KernelCertificate 134 := by
  change row ({0, 1, 3, 4, 5, 6, 7, 11, 12, 13, 16, 17, 18, 22, 23, 24, 27, 28, 29, 30} : Finset Vertex) = {0, 1, 2, 3, 4, 5, 10, 11, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 3, 4, 5, 6, 7, 11, 12, 13, 16, 17, 18, 22, 23, 24, 27, 28, 29, 30} : Finset Vertex) = 2043099387 ∧
    ({0, 1, 3, 4, 5, 6, 7, 11, 12, 13, 16, 17, 18, 22, 23, 24, 27, 28, 29, 30} : Finset Vertex).card = 20 ∧ orbitCodeInverse 2043099387 = 134
  decide +kernel

theorem kernel_cert_135 : KernelCertificate 135 := by
  change row ({0, 1, 2, 3, 4, 5, 10, 11, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 29, 30, 31} : Finset Vertex) = {5, 6, 9, 10, 11, 12, 17, 18, 19, 20, 21, 22, 23, 28, 29} ∧
    orbitFingerprint ({0, 1, 2, 3, 4, 5, 10, 11, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 29, 30, 31} : Finset Vertex) = 3824127039 ∧
    ({0, 1, 2, 3, 4, 5, 10, 11, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 29, 30, 31} : Finset Vertex).card = 21 ∧ orbitCodeInverse 3824127039 = 135
  decide +kernel

#print axioms kernel_cert_135
end W04
