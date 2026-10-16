import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_056 : KernelCertificate 56 := by
  change row ({0, 1, 2, 3, 4, 5, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 23, 24, 25, 29, 30} : Finset Vertex) = {5, 6, 11, 12, 13, 14, 15, 16, 17, 22, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 2, 3, 4, 5, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 23, 24, 25, 29, 30} : Finset Vertex) = 1670364735 ∧
    ({0, 1, 2, 3, 4, 5, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 23, 24, 25, 29, 30} : Finset Vertex).card = 21 ∧ orbitCodeInverse 1670364735 = 56
  decide +kernel

theorem kernel_cert_057 : KernelCertificate 57 := by
  change row ({5, 6, 11, 12, 13, 14, 15, 16, 17, 22, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 4, 5, 6, 7, 10, 11, 17, 18, 21, 22, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({5, 6, 11, 12, 13, 14, 15, 16, 17, 22, 23, 28, 29, 30, 31} : Finset Vertex) = 4039374944 ∧
    ({5, 6, 11, 12, 13, 14, 15, 16, 17, 22, 23, 28, 29, 30, 31} : Finset Vertex).card = 15 ∧ orbitCodeInverse 4039374944 = 57
  decide +kernel

theorem kernel_cert_058 : KernelCertificate 58 := by
  change row ({0, 4, 5, 6, 7, 10, 11, 17, 18, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = {0, 1, 3, 4, 5, 9, 10, 11, 12, 16, 17, 18, 19, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 4, 5, 6, 7, 10, 11, 17, 18, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = 971377905 ∧
    ({0, 4, 5, 6, 7, 10, 11, 17, 18, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex).card = 16 ∧ orbitCodeInverse 971377905 = 58
  decide +kernel

theorem kernel_cert_059 : KernelCertificate 59 := by
  change row ({0, 1, 3, 4, 5, 9, 10, 11, 12, 16, 17, 18, 19, 23, 24, 25, 29, 30} : Finset Vertex) = {0, 1, 2, 3, 4, 5, 6, 11, 12, 13, 15, 16, 17, 22, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 3, 4, 5, 9, 10, 11, 12, 16, 17, 18, 19, 23, 24, 25, 29, 30} : Finset Vertex) = 1670323771 ∧
    ({0, 1, 3, 4, 5, 9, 10, 11, 12, 16, 17, 18, 19, 23, 24, 25, 29, 30} : Finset Vertex).card = 18 ∧ orbitCodeInverse 1670323771 = 59
  decide +kernel

theorem kernel_cert_060 : KernelCertificate 60 := by
  change row ({0, 1, 2, 3, 4, 5, 6, 11, 12, 13, 15, 16, 17, 22, 23, 28, 29, 30, 31} : Finset Vertex) = {5, 6, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 1, 2, 3, 4, 5, 6, 11, 12, 13, 15, 16, 17, 22, 23, 28, 29, 30, 31} : Finset Vertex) = 4039358591 ∧
    ({0, 1, 2, 3, 4, 5, 6, 11, 12, 13, 15, 16, 17, 22, 23, 28, 29, 30, 31} : Finset Vertex).card = 19 ∧ orbitCodeInverse 4039358591 = 60
  decide +kernel

theorem kernel_cert_061 : KernelCertificate 61 := by
  change row ({5, 6, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = {0, 4, 5, 9, 10, 11, 17, 18, 19, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({5, 6, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = 971504864 ∧
    ({5, 6, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex).card = 19 ∧ orbitCodeInverse 971504864 = 61
  decide +kernel

theorem kernel_cert_062 : KernelCertificate 62 := by
  change row ({0, 4, 5, 9, 10, 11, 17, 18, 19, 23, 24, 25, 29, 30} : Finset Vertex) = {0, 1, 3, 4, 5, 6, 11, 12, 16, 17, 22, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 4, 5, 9, 10, 11, 17, 18, 19, 23, 24, 25, 29, 30} : Finset Vertex) = 1670254129 ∧
    ({0, 4, 5, 9, 10, 11, 17, 18, 19, 23, 24, 25, 29, 30} : Finset Vertex).card = 14 ∧ orbitCodeInverse 1670254129 = 62
  decide +kernel

theorem kernel_cert_063 : KernelCertificate 63 := by
  change row ({0, 1, 3, 4, 5, 6, 11, 12, 16, 17, 22, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 15, 16, 17, 18, 21, 22, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 1, 3, 4, 5, 6, 11, 12, 16, 17, 22, 23, 28, 29, 30, 31} : Finset Vertex) = 4039317627 ∧
    ({0, 1, 3, 4, 5, 6, 11, 12, 16, 17, 22, 23, 28, 29, 30, 31} : Finset Vertex).card = 16 ∧ orbitCodeInverse 4039317627 = 63
  decide +kernel

#print axioms kernel_cert_063
end W04
