import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_040 : KernelCertificate 40 := by
  change row ({5, 11, 23, 24, 27, 28, 29} : Finset Vertex) = {0, 4, 5, 6, 10, 11, 12, 17, 22, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({5, 11, 23, 24, 27, 28, 29} : Finset Vertex) = 964692000 ∧
    ({5, 11, 23, 24, 27, 28, 29} : Finset Vertex).card = 7 ∧ orbitCodeInverse 964692000 = 40
  decide +kernel

theorem kernel_cert_041 : KernelCertificate 41 := by
  change row ({0, 4, 5, 6, 10, 11, 12, 17, 22, 23, 24, 25, 29, 30} : Finset Vertex) = {0, 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 16, 17, 18, 21, 22, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 4, 5, 6, 10, 11, 12, 17, 22, 23, 24, 25, 29, 30} : Finset Vertex) = 1673665649 ∧
    ({0, 4, 5, 6, 10, 11, 12, 17, 22, 23, 24, 25, 29, 30} : Finset Vertex).card = 14 ∧ orbitCodeInverse 1673665649 = 41
  decide +kernel

theorem kernel_cert_042 : KernelCertificate 42 := by
  change row ({0, 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 16, 17, 18, 21, 22, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 15, 16, 17, 18, 19, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 16, 17, 18, 21, 22, 23, 28, 29, 30, 31} : Finset Vertex) = 4041686779 ∧
    ({0, 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 16, 17, 18, 21, 22, 23, 28, 29, 30, 31} : Finset Vertex).card = 22 ∧ orbitCodeInverse 4041686779 = 42
  decide +kernel

theorem kernel_cert_043 : KernelCertificate 43 := by
  change row ({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 15, 16, 17, 18, 19, 23, 24, 27, 28, 29} : Finset Vertex) = {11, 12, 22, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 15, 16, 17, 18, 19, 23, 24, 27, 28, 29} : Finset Vertex) = 965709823 ∧
    ({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 15, 16, 17, 18, 19, 23, 24, 27, 28, 29} : Finset Vertex).card = 22 ∧ orbitCodeInverse 965709823 = 43
  decide +kernel

theorem kernel_cert_044 : KernelCertificate 44 := by
  change row ({11, 12, 22, 23, 24, 25, 29, 30} : Finset Vertex) = {0, 5, 10, 11, 12, 13, 17, 21, 22, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({11, 12, 22, 23, 24, 25, 29, 30} : Finset Vertex) = 1673533440 ∧
    ({11, 12, 22, 23, 24, 25, 29, 30} : Finset Vertex).card = 8 ∧ orbitCodeInverse 1673533440 = 44
  decide +kernel

theorem kernel_cert_045 : KernelCertificate 45 := by
  change row ({0, 5, 10, 11, 12, 13, 17, 21, 22, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 4, 5, 6, 9, 10, 11, 16, 17, 18, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 5, 10, 11, 12, 13, 17, 21, 22, 23, 28, 29, 30, 31} : Finset Vertex) = 4041358369 ∧
    ({0, 5, 10, 11, 12, 13, 17, 21, 22, 23, 28, 29, 30, 31} : Finset Vertex).card = 14 ∧ orbitCodeInverse 4041358369 = 45
  decide +kernel

theorem kernel_cert_046 : KernelCertificate 46 := by
  change row ({0, 1, 4, 5, 6, 9, 10, 11, 16, 17, 18, 23, 24, 27, 28, 29} : Finset Vertex) = {3, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 1, 4, 5, 6, 9, 10, 11, 16, 17, 18, 23, 24, 27, 28, 29} : Finset Vertex) = 965152371 ∧
    ({0, 1, 4, 5, 6, 9, 10, 11, 16, 17, 18, 23, 24, 27, 28, 29} : Finset Vertex).card = 16 ∧ orbitCodeInverse 965152371 = 46
  decide +kernel

theorem kernel_cert_047 : KernelCertificate 47 := by
  change row ({3, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 29, 30} : Finset Vertex) = {0, 10, 11, 12, 13, 21, 22, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({3, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 29, 30} : Finset Vertex) = 1674549496 ∧
    ({3, 4, 5, 6, 7, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 29, 30} : Finset Vertex).card = 18 ∧ orbitCodeInverse 1674549496 = 47
  decide +kernel

#print axioms kernel_cert_047
end W04
