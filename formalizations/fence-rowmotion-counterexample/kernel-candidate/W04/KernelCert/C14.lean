import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_112 : KernelCertificate 112 := by
  change row ({0, 5, 6, 9, 10, 11, 12, 13, 16, 17, 22, 23, 24, 27, 28, 29} : Finset Vertex) = {0, 1, 4, 5, 6, 7, 15, 16, 17, 18, 21, 22, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 5, 6, 9, 10, 11, 12, 13, 16, 17, 22, 23, 24, 27, 28, 29} : Finset Vertex) = 969096801 ∧
    ({0, 5, 6, 9, 10, 11, 12, 13, 16, 17, 22, 23, 24, 27, 28, 29} : Finset Vertex).card = 16 ∧ orbitCodeInverse 969096801 = 112
  decide +kernel

theorem kernel_cert_113 : KernelCertificate 113 := by
  change row ({0, 1, 4, 5, 6, 7, 15, 16, 17, 18, 21, 22, 23, 24, 25, 29, 30} : Finset Vertex) = {3, 4, 5, 11, 17, 18, 19, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 4, 5, 6, 7, 15, 16, 17, 18, 21, 22, 23, 24, 25, 29, 30} : Finset Vertex) = 1676116211 ∧
    ({0, 1, 4, 5, 6, 7, 15, 16, 17, 18, 21, 22, 23, 24, 25, 29, 30} : Finset Vertex).card = 17 ∧ orbitCodeInverse 1676116211 = 113
  decide +kernel

theorem kernel_cert_114 : KernelCertificate 114 := by
  change row ({3, 4, 5, 11, 17, 18, 19, 28, 29, 30, 31} : Finset Vertex) = {0, 5, 6, 10, 11, 12, 16, 17, 23, 27, 28, 29} ∧
    orbitFingerprint ({3, 4, 5, 11, 17, 18, 19, 28, 29, 30, 31} : Finset Vertex) = 4027451448 ∧
    ({3, 4, 5, 11, 17, 18, 19, 28, 29, 30, 31} : Finset Vertex).card = 11 ∧ orbitCodeInverse 4027451448 = 114
  decide +kernel

theorem kernel_cert_115 : KernelCertificate 115 := by
  change row ({0, 5, 6, 10, 11, 12, 16, 17, 23, 27, 28, 29} : Finset Vertex) = {0, 1, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 22, 23, 24, 29, 30} ∧
    orbitFingerprint ({0, 5, 6, 10, 11, 12, 16, 17, 23, 27, 28, 29} : Finset Vertex) = 948116577 ∧
    ({0, 5, 6, 10, 11, 12, 16, 17, 23, 27, 28, 29} : Finset Vertex).card = 12 ∧ orbitCodeInverse 948116577 = 115
  decide +kernel

theorem kernel_cert_116 : KernelCertificate 116 := by
  change row ({0, 1, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 22, 23, 24, 29, 30} : Finset Vertex) = {3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 22, 23, 24, 29, 30} : Finset Vertex) = 1640480499 ∧
    ({0, 1, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 22, 23, 24, 29, 30} : Finset Vertex).card = 20 ∧ orbitCodeInverse 1640480499 = 116
  decide +kernel

theorem kernel_cert_117 : KernelCertificate 117 := by
  change row ({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex) = {0, 17, 18, 19, 20, 21, 22, 23, 27, 28, 29} ∧
    orbitFingerprint ({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex) = 4092592120 ∧
    ({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex).card = 26 ∧ orbitCodeInverse 4092592120 = 117
  decide +kernel

theorem kernel_cert_118 : KernelCertificate 118 := by
  change row ({0, 17, 18, 19, 20, 21, 22, 23, 27, 28, 29} : Finset Vertex) = {0, 1, 5, 11, 16, 17, 23, 24, 29, 30} ∧
    orbitFingerprint ({0, 17, 18, 19, 20, 21, 22, 23, 27, 28, 29} : Finset Vertex) = 956170241 ∧
    ({0, 17, 18, 19, 20, 21, 22, 23, 27, 28, 29} : Finset Vertex).card = 11 ∧ orbitCodeInverse 956170241 = 118
  decide +kernel

theorem kernel_cert_119 : KernelCertificate 119 := by
  change row ({0, 1, 5, 11, 16, 17, 23, 24, 29, 30} : Finset Vertex) = {4, 5, 6, 10, 11, 12, 15, 16, 17, 18, 22, 23, 24, 25, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 5, 11, 16, 17, 23, 24, 29, 30} : Finset Vertex) = 1635977251 ∧
    ({0, 1, 5, 11, 16, 17, 23, 24, 29, 30} : Finset Vertex).card = 10 ∧ orbitCodeInverse 1635977251 = 119
  decide +kernel

#print axioms kernel_cert_119
end W04
