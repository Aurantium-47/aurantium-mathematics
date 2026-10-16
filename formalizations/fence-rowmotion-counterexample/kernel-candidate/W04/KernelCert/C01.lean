import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_008 : KernelCertificate 8 := by
  change row ({0, 1, 21, 22, 23, 24, 25, 29, 30} : Finset Vertex) = {5, 11, 17, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 21, 22, 23, 24, 25, 29, 30} : Finset Vertex) = 1675624451 ∧
    ({0, 1, 21, 22, 23, 24, 25, 29, 30} : Finset Vertex).card = 9 ∧ orbitCodeInverse 1675624451 = 8
  decide +kernel

theorem kernel_cert_009 : KernelCertificate 9 := by
  change row ({5, 11, 17, 28, 29, 30, 31} : Finset Vertex) = {0, 4, 5, 6, 10, 11, 12, 16, 17, 18, 23, 27, 28, 29} ∧
    orbitFingerprint ({5, 11, 17, 28, 29, 30, 31} : Finset Vertex) = 4026664992 ∧
    ({5, 11, 17, 28, 29, 30, 31} : Finset Vertex).card = 7 ∧ orbitCodeInverse 4026664992 = 9
  decide +kernel

theorem kernel_cert_010 : KernelCertificate 10 := by
  change row ({0, 4, 5, 6, 10, 11, 12, 16, 17, 18, 23, 27, 28, 29} : Finset Vertex) = {0, 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 24, 29, 30} ∧
    orbitFingerprint ({0, 4, 5, 6, 10, 11, 12, 16, 17, 18, 23, 27, 28, 29} : Finset Vertex) = 948378737 ∧
    ({0, 4, 5, 6, 10, 11, 12, 16, 17, 18, 23, 27, 28, 29} : Finset Vertex).card = 14 ∧ orbitCodeInverse 948378737 = 10
  decide +kernel

theorem kernel_cert_011 : KernelCertificate 11 := by
  change row ({0, 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 24, 29, 30} : Finset Vertex) = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 24, 29, 30} : Finset Vertex) = 1641004795 ∧
    ({0, 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 22, 23, 24, 29, 30} : Finset Vertex).card = 22 ∧ orbitCodeInverse 1641004795 = 11
  decide +kernel

theorem kernel_cert_012 : KernelCertificate 12 := by
  change row ({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex) = {17, 18, 27, 28, 29} ∧
    orbitFingerprint ({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex) = 4091805695 ∧
    ({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex).card = 27 ∧ orbitCodeInverse 4091805695 = 12
  decide +kernel

theorem kernel_cert_013 : KernelCertificate 13 := by
  change row ({17, 18, 27, 28, 29} : Finset Vertex) = {0, 5, 11, 16, 17, 18, 19, 23, 29, 30} ∧
    orbitFingerprint ({17, 18, 27, 28, 29} : Finset Vertex) = 939917312 ∧
    ({17, 18, 27, 28, 29} : Finset Vertex).card = 5 ∧ orbitCodeInverse 939917312 = 13
  decide +kernel

theorem kernel_cert_014 : KernelCertificate 14 := by
  change row ({0, 5, 11, 16, 17, 18, 19, 23, 29, 30} : Finset Vertex) = {0, 1, 4, 5, 6, 10, 11, 12, 15, 16, 17, 22, 23, 24, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 5, 11, 16, 17, 18, 19, 23, 29, 30} : Finset Vertex) = 1619986465 ∧
    ({0, 5, 11, 16, 17, 18, 19, 23, 29, 30} : Finset Vertex).card = 10 ∧ orbitCodeInverse 1619986465 = 14
  decide +kernel

theorem kernel_cert_015 : KernelCertificate 15 := by
  change row ({0, 1, 4, 5, 6, 10, 11, 12, 15, 16, 17, 22, 23, 24, 28, 29, 30, 31} : Finset Vertex) = {3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 25, 27, 28, 29} ∧
    orbitFingerprint ({0, 1, 4, 5, 6, 10, 11, 12, 15, 16, 17, 22, 23, 24, 28, 29, 30, 31} : Finset Vertex) = 4056128627 ∧
    ({0, 1, 4, 5, 6, 10, 11, 12, 15, 16, 17, 22, 23, 24, 28, 29, 30, 31} : Finset Vertex).card = 18 ∧ orbitCodeInverse 4056128627 = 15
  decide +kernel

#print axioms kernel_cert_015
end W04
