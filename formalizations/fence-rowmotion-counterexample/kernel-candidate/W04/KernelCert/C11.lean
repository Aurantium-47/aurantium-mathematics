import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_088 : KernelCertificate 88 := by
  change row ({0, 5, 11, 17, 27, 28, 29} : Finset Vertex) = {0, 1, 4, 5, 6, 10, 11, 12, 16, 17, 18, 23, 29, 30} ∧
    orbitFingerprint ({0, 5, 11, 17, 27, 28, 29} : Finset Vertex) = 939657249 ∧
    ({0, 5, 11, 17, 27, 28, 29} : Finset Vertex).card = 7 ∧ orbitCodeInverse 939657249 = 88
  decide +kernel

theorem kernel_cert_089 : KernelCertificate 89 := by
  change row ({0, 1, 4, 5, 6, 10, 11, 12, 16, 17, 18, 23, 29, 30} : Finset Vertex) = {3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 24, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 4, 5, 6, 10, 11, 12, 16, 17, 18, 23, 29, 30} : Finset Vertex) = 1619467379 ∧
    ({0, 1, 4, 5, 6, 10, 11, 12, 16, 17, 18, 23, 29, 30} : Finset Vertex).card = 14 ∧ orbitCodeInverse 1619467379 = 89
  decide +kernel

theorem kernel_cert_090 : KernelCertificate 90 := by
  change row ({3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 24, 28, 29, 30, 31} : Finset Vertex) = {0, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 27, 28, 29} ∧
    orbitFingerprint ({3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 24, 28, 29, 30, 31} : Finset Vertex) = 4056923896 ∧
    ({3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 24, 28, 29, 30, 31} : Finset Vertex).card = 22 ∧ orbitCodeInverse 4056923896 = 90
  decide +kernel

theorem kernel_cert_091 : KernelCertificate 91 := by
  change row ({0, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex) = {0, 1, 4, 5, 17, 18, 23, 24, 25, 26, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex) = 1004797921 ∧
    ({0, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex).card = 22 ∧ orbitCodeInverse 1004797921 = 91
  decide +kernel

theorem kernel_cert_092 : KernelCertificate 92 := by
  change row ({0, 1, 4, 5, 17, 18, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex) = {3, 4, 5, 6, 11, 16, 17, 18, 19, 22, 23, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 4, 5, 17, 18, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex) = 2139488307 ∧
    ({0, 1, 4, 5, 17, 18, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex).card = 14 ∧ orbitCodeInverse 2139488307 = 92
  decide +kernel

theorem kernel_cert_093 : KernelCertificate 93 := by
  change row ({3, 4, 5, 6, 11, 16, 17, 18, 19, 22, 23, 29, 30, 31} : Finset Vertex) = {0, 5, 6, 7, 10, 11, 12, 15, 16, 17, 21, 22, 23, 24, 28, 29} ∧
    orbitFingerprint ({3, 4, 5, 6, 11, 16, 17, 18, 19, 22, 23, 29, 30, 31} : Finset Vertex) = 3771664504 ∧
    ({3, 4, 5, 6, 11, 16, 17, 18, 19, 22, 23, 29, 30, 31} : Finset Vertex).card = 14 ∧ orbitCodeInverse 3771664504 = 93
  decide +kernel

theorem kernel_cert_094 : KernelCertificate 94 := by
  change row ({0, 5, 6, 7, 10, 11, 12, 15, 16, 17, 21, 22, 23, 24, 28, 29} : Finset Vertex) = {0, 1, 4, 5, 9, 10, 11, 12, 13, 17, 18, 23, 24, 25, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 5, 6, 7, 10, 11, 12, 15, 16, 17, 21, 22, 23, 24, 28, 29} : Finset Vertex) = 837000417 ∧
    ({0, 5, 6, 7, 10, 11, 12, 15, 16, 17, 21, 22, 23, 24, 28, 29} : Finset Vertex).card = 16 ∧ orbitCodeInverse 837000417 = 94
  decide +kernel

theorem kernel_cert_095 : KernelCertificate 95 := by
  change row ({0, 1, 4, 5, 9, 10, 11, 12, 13, 17, 18, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex) = {3, 4, 5, 6, 16, 17, 18, 19, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 4, 5, 9, 10, 11, 12, 13, 17, 18, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex) = 2072395315 ∧
    ({0, 1, 4, 5, 9, 10, 11, 12, 13, 17, 18, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex).card = 18 ∧ orbitCodeInverse 2072395315 = 95
  decide +kernel

#print axioms kernel_cert_095
end W04
