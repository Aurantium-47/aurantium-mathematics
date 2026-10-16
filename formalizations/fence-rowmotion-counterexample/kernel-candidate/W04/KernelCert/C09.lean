import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_072 : KernelCertificate 72 := by
  change row ({0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 16, 17, 18, 19, 22, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 21, 22, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 16, 17, 18, 19, 22, 23, 28, 29, 30, 31} : Finset Vertex) = 4040105721 ∧
    ({0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 16, 17, 18, 19, 22, 23, 28, 29, 30, 31} : Finset Vertex).card = 20 ∧ orbitCodeInverse 4040105721 = 72
  decide +kernel

theorem kernel_cert_073 : KernelCertificate 73 := by
  change row ({0, 1, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = {4, 5, 11, 12, 13, 14, 15, 16, 17, 18, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = 971227107 ∧
    ({0, 1, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex).card = 21 ∧ orbitCodeInverse 971227107 = 73
  decide +kernel

theorem kernel_cert_074 : KernelCertificate 74 := by
  change row ({4, 5, 11, 12, 13, 14, 15, 16, 17, 18, 23, 24, 25, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 6, 10, 11, 17, 18, 19, 22, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 11, 12, 13, 14, 15, 16, 17, 18, 23, 24, 25, 29, 30} : Finset Vertex) = 1669855280 ∧
    ({4, 5, 11, 12, 13, 14, 15, 16, 17, 18, 23, 24, 25, 29, 30} : Finset Vertex).card = 15 ∧ orbitCodeInverse 1669855280 = 74
  decide +kernel

theorem kernel_cert_075 : KernelCertificate 75 := by
  change row ({0, 3, 4, 5, 6, 10, 11, 17, 18, 19, 22, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 6, 7, 9, 10, 11, 12, 16, 17, 21, 22, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 10, 11, 17, 18, 19, 22, 23, 28, 29, 30, 31} : Finset Vertex) = 4040035449 ∧
    ({0, 3, 4, 5, 6, 10, 11, 17, 18, 19, 22, 23, 28, 29, 30, 31} : Finset Vertex).card = 16 ∧ orbitCodeInverse 4040035449 = 75
  decide +kernel

theorem kernel_cert_076 : KernelCertificate 76 := by
  change row ({0, 1, 5, 6, 7, 9, 10, 11, 12, 16, 17, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 6, 7, 9, 10, 11, 12, 16, 17, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = 971185891 ∧
    ({0, 1, 5, 6, 7, 9, 10, 11, 12, 16, 17, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex).card = 18 ∧ orbitCodeInverse 971185891 = 76
  decide +kernel

theorem kernel_cert_077 : KernelCertificate 77 := by
  change row ({4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 24, 25, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 24, 25, 29, 30} : Finset Vertex) = 1669840880 ∧
    ({4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 24, 25, 29, 30} : Finset Vertex).card = 19 ∧ orbitCodeInverse 1669840880 = 77
  decide +kernel

theorem kernel_cert_078 : KernelCertificate 78 := by
  change row ({0, 3, 4, 5, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 6, 10, 11, 21, 22, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 28, 29, 30, 31} : Finset Vertex) = 4040161337 ∧
    ({0, 3, 4, 5, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 28, 29, 30, 31} : Finset Vertex).card = 19 ∧ orbitCodeInverse 4040161337 = 78
  decide +kernel

theorem kernel_cert_079 : KernelCertificate 79 := by
  change row ({0, 1, 5, 6, 10, 11, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = {4, 5, 6, 7, 9, 10, 11, 12, 17, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 6, 10, 11, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = 970984547 ∧
    ({0, 1, 5, 6, 10, 11, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex).card = 13 ∧ orbitCodeInverse 970984547 = 79
  decide +kernel

#print axioms kernel_cert_079
end W04
