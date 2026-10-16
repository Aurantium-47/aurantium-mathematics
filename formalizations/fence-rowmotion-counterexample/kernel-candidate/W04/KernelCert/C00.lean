import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_000 : KernelCertificate 0 := by
  change row ({4, 5, 6, 7, 11} : Finset Vertex) = {0, 3, 4, 5, 10, 11, 12, 17, 23, 29} ∧
    orbitFingerprint ({4, 5, 6, 7, 11} : Finset Vertex) = 2288 ∧
    ({4, 5, 6, 7, 11} : Finset Vertex).card = 5 ∧ orbitCodeInverse 2288 = 0
  decide +kernel

theorem kernel_cert_001 : KernelCertificate 1 := by
  change row ({0, 3, 4, 5, 10, 11, 12, 17, 23, 29} : Finset Vertex) = {0, 1, 5, 6, 9, 10, 11, 12, 13, 16, 17, 18, 22, 23, 24, 28, 29, 30} ∧
    orbitFingerprint ({0, 3, 4, 5, 10, 11, 12, 17, 23, 29} : Finset Vertex) = 545397817 ∧
    ({0, 3, 4, 5, 10, 11, 12, 17, 23, 29} : Finset Vertex).card = 10 ∧ orbitCodeInverse 545397817 = 1
  decide +kernel

theorem kernel_cert_002 : KernelCertificate 2 := by
  change row ({0, 1, 5, 6, 9, 10, 11, 12, 13, 16, 17, 18, 22, 23, 24, 28, 29, 30} : Finset Vertex) = {4, 5, 6, 7, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 5, 6, 9, 10, 11, 12, 13, 16, 17, 18, 22, 23, 24, 28, 29, 30} : Finset Vertex) = 1908883043 ∧
    ({0, 1, 5, 6, 9, 10, 11, 12, 13, 16, 17, 18, 22, 23, 24, 28, 29, 30} : Finset Vertex).card = 18 ∧ orbitCodeInverse 1908883043 = 2
  decide +kernel

theorem kernel_cert_003 : KernelCertificate 3 := by
  change row ({4, 5, 6, 7, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex) = {0, 3, 4, 5, 11, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29} ∧
    orbitFingerprint ({4, 5, 6, 7, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex) = 4226777328 ∧
    ({4, 5, 6, 7, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex).card = 19 ∧ orbitCodeInverse 4226777328 = 3
  decide +kernel

theorem kernel_cert_004 : KernelCertificate 4 := by
  change row ({0, 3, 4, 5, 11, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex) = {0, 1, 5, 6, 10, 11, 12, 16, 17, 29, 30} ∧
    orbitFingerprint ({0, 3, 4, 5, 11, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex) = 1073612857 ∧
    ({0, 3, 4, 5, 11, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex).card = 18 ∧ orbitCodeInverse 1073612857 = 4
  decide +kernel

theorem kernel_cert_005 : KernelCertificate 5 := by
  change row ({0, 1, 5, 6, 10, 11, 12, 16, 17, 29, 30} : Finset Vertex) = {4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 5, 6, 10, 11, 12, 16, 17, 29, 30} : Finset Vertex) = 1610816611 ∧
    ({0, 1, 5, 6, 10, 11, 12, 16, 17, 29, 30} : Finset Vertex).card = 11 ∧ orbitCodeInverse 1610816611 = 5
  decide +kernel

theorem kernel_cert_006 : KernelCertificate 6 := by
  change row ({4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 28, 29, 30, 31} : Finset Vertex) = 4035428080 ∧
    ({4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 28, 29, 30, 31} : Finset Vertex).card = 18 ∧ orbitCodeInverse 4035428080 = 6
  decide +kernel

theorem kernel_cert_007 : KernelCertificate 7 := by
  change row ({0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 27, 28, 29} : Finset Vertex) = {0, 1, 21, 22, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 27, 28, 29} : Finset Vertex) = 969932793 ∧
    ({0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 27, 28, 29} : Finset Vertex).card = 24 ∧ orbitCodeInverse 969932793 = 7
  decide +kernel

#print axioms kernel_cert_007
end W04
