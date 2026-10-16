import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_104 : KernelCertificate 104 := by
  change row ({0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 23, 24, 27, 28, 29, 30, 31} : Finset Vertex) = {3, 4, 5, 17, 18, 19, 22, 23, 24, 25} ∧
    orbitFingerprint ({0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 23, 24, 27, 28, 29, 30, 31} : Finset Vertex) = 4186439667 ∧
    ({0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 23, 24, 27, 28, 29, 30, 31} : Finset Vertex).card = 24 ∧ orbitCodeInverse 4186439667 = 104
  decide +kernel

theorem kernel_cert_105 : KernelCertificate 105 := by
  change row ({3, 4, 5, 17, 18, 19, 22, 23, 24, 25} : Finset Vertex) = {0, 5, 6, 11, 16, 17, 21, 22, 23, 29} ∧
    orbitFingerprint ({3, 4, 5, 17, 18, 19, 22, 23, 24, 25} : Finset Vertex) = 63832120 ∧
    ({3, 4, 5, 17, 18, 19, 22, 23, 24, 25} : Finset Vertex).card = 10 ∧ orbitCodeInverse 63832120 = 105
  decide +kernel

theorem kernel_cert_106 : KernelCertificate 106 := by
  change row ({0, 5, 6, 11, 16, 17, 21, 22, 23, 29} : Finset Vertex) = {0, 1, 4, 5, 6, 7, 10, 11, 12, 15, 16, 17, 18, 23, 24, 28, 29, 30} ∧
    orbitFingerprint ({0, 5, 6, 11, 16, 17, 21, 22, 23, 29} : Finset Vertex) = 551749729 ∧
    ({0, 5, 6, 11, 16, 17, 21, 22, 23, 29} : Finset Vertex).card = 10 ∧ orbitCodeInverse 551749729 = 106
  decide +kernel

theorem kernel_cert_107 : KernelCertificate 107 := by
  change row ({0, 1, 4, 5, 6, 7, 10, 11, 12, 15, 16, 17, 18, 23, 24, 28, 29, 30} : Finset Vertex) = {3, 4, 5, 9, 10, 11, 12, 13, 17, 18, 19, 22, 23, 24, 25, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 4, 5, 6, 7, 10, 11, 12, 15, 16, 17, 18, 23, 24, 28, 29, 30} : Finset Vertex) = 1904712947 ∧
    ({0, 1, 4, 5, 6, 7, 10, 11, 12, 15, 16, 17, 18, 23, 24, 28, 29, 30} : Finset Vertex).card = 18 ∧ orbitCodeInverse 1904712947 = 107
  decide +kernel

theorem kernel_cert_108 : KernelCertificate 108 := by
  change row ({3, 4, 5, 9, 10, 11, 12, 13, 17, 18, 19, 22, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex) = {0, 5, 6, 16, 17, 21, 22, 23, 24, 25, 26, 27, 28, 29} ∧
    orbitFingerprint ({3, 4, 5, 9, 10, 11, 12, 13, 17, 18, 19, 22, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex) = 4224597560 ∧
    ({3, 4, 5, 9, 10, 11, 12, 13, 17, 18, 19, 22, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex).card = 20 ∧ orbitCodeInverse 4224597560 = 108
  decide +kernel

theorem kernel_cert_109 : KernelCertificate 109 := by
  change row ({0, 5, 6, 16, 17, 21, 22, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex) = {0, 1, 4, 5, 6, 7, 11, 15, 16, 17, 18, 29, 30} ∧
    orbitFingerprint ({0, 5, 6, 16, 17, 21, 22, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex) = 1071841377 ∧
    ({0, 5, 6, 16, 17, 21, 22, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex).card = 14 ∧ orbitCodeInverse 1071841377 = 109
  decide +kernel

theorem kernel_cert_110 : KernelCertificate 110 := by
  change row ({0, 1, 4, 5, 6, 7, 11, 15, 16, 17, 18, 29, 30} : Finset Vertex) = {3, 4, 5, 10, 11, 12, 17, 18, 19, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 4, 5, 6, 7, 11, 15, 16, 17, 18, 29, 30} : Finset Vertex) = 1611106547 ∧
    ({0, 1, 4, 5, 6, 7, 11, 15, 16, 17, 18, 29, 30} : Finset Vertex).card = 13 ∧ orbitCodeInverse 1611106547 = 110
  decide +kernel

theorem kernel_cert_111 : KernelCertificate 111 := by
  change row ({3, 4, 5, 10, 11, 12, 17, 18, 19, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 5, 6, 9, 10, 11, 12, 13, 16, 17, 22, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({3, 4, 5, 10, 11, 12, 17, 18, 19, 23, 28, 29, 30, 31} : Finset Vertex) = 4035845176 ∧
    ({3, 4, 5, 10, 11, 12, 17, 18, 19, 23, 28, 29, 30, 31} : Finset Vertex).card = 14 ∧ orbitCodeInverse 4035845176 = 111
  decide +kernel

#print axioms kernel_cert_111
end W04
