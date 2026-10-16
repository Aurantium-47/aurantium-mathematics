import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_032 : KernelCertificate 32 := by
  change row ({0, 3, 4, 5, 6, 10, 11, 12, 13, 16, 17, 18, 19, 23, 24, 28, 29, 30} : Finset Vertex) = {0, 1, 5, 6, 7, 9, 10, 11, 15, 16, 17, 22, 23, 24, 25, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 10, 11, 12, 13, 16, 17, 18, 19, 23, 24, 28, 29, 30} : Finset Vertex) = 1905212537 ∧
    ({0, 3, 4, 5, 6, 10, 11, 12, 13, 16, 17, 18, 19, 23, 24, 28, 29, 30} : Finset Vertex).card = 18 ∧ orbitCodeInverse 1905212537 = 32
  decide +kernel

theorem kernel_cert_033 : KernelCertificate 33 := by
  change row ({0, 1, 5, 6, 7, 9, 10, 11, 15, 16, 17, 22, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex) = {4, 5, 6, 7, 8, 9, 10, 11, 12, 17, 18, 21, 22, 23, 24, 25, 26, 27, 28, 29} ∧
    orbitFingerprint ({0, 1, 5, 6, 7, 9, 10, 11, 15, 16, 17, 22, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex) = 4223897315 ∧
    ({0, 1, 5, 6, 7, 9, 10, 11, 15, 16, 17, 22, 23, 24, 25, 27, 28, 29, 30, 31} : Finset Vertex).card = 20 ∧ orbitCodeInverse 4223897315 = 33
  decide +kernel

theorem kernel_cert_034 : KernelCertificate 34 := by
  change row ({4, 5, 6, 7, 8, 9, 10, 11, 12, 17, 18, 21, 22, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex) = {0, 3, 4, 5, 11, 12, 13, 16, 17, 18, 19, 29, 30} ∧
    orbitFingerprint ({4, 5, 6, 7, 8, 9, 10, 11, 12, 17, 18, 21, 22, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex) = 1072046064 ∧
    ({4, 5, 6, 7, 8, 9, 10, 11, 12, 17, 18, 21, 22, 23, 24, 25, 26, 27, 28, 29} : Finset Vertex).card = 20 ∧ orbitCodeInverse 1072046064 = 34
  decide +kernel

theorem kernel_cert_035 : KernelCertificate 35 := by
  change row ({0, 3, 4, 5, 11, 12, 13, 16, 17, 18, 19, 29, 30} : Finset Vertex) = {0, 1, 5, 6, 10, 11, 15, 16, 17, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 3, 4, 5, 11, 12, 13, 16, 17, 18, 19, 29, 30} : Finset Vertex) = 1611610169 ∧
    ({0, 3, 4, 5, 11, 12, 13, 16, 17, 18, 19, 29, 30} : Finset Vertex).card = 13 ∧ orbitCodeInverse 1611610169 = 35
  decide +kernel

theorem kernel_cert_036 : KernelCertificate 36 := by
  change row ({0, 1, 5, 6, 10, 11, 15, 16, 17, 23, 28, 29, 30, 31} : Finset Vertex) = {4, 5, 6, 7, 9, 10, 11, 12, 17, 18, 22, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 1, 5, 6, 10, 11, 15, 16, 17, 23, 28, 29, 30, 31} : Finset Vertex) = 4035152995 ∧
    ({0, 1, 5, 6, 10, 11, 15, 16, 17, 23, 28, 29, 30, 31} : Finset Vertex).card = 14 ∧ orbitCodeInverse 4035152995 = 36
  decide +kernel

theorem kernel_cert_037 : KernelCertificate 37 := by
  change row ({4, 5, 6, 7, 9, 10, 11, 12, 17, 18, 22, 23, 24, 27, 28, 29} : Finset Vertex) = {0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({4, 5, 6, 7, 9, 10, 11, 12, 17, 18, 22, 23, 24, 27, 28, 29} : Finset Vertex) = 969285360 ∧
    ({4, 5, 6, 7, 9, 10, 11, 12, 17, 18, 22, 23, 24, 27, 28, 29} : Finset Vertex).card = 16 ∧ orbitCodeInverse 969285360 = 37
  decide +kernel

theorem kernel_cert_038 : KernelCertificate 38 := by
  change row ({0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 25, 29, 30} : Finset Vertex) = {0, 1, 15, 16, 17, 18, 19, 20, 21, 22, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 25, 29, 30} : Finset Vertex) = 1676623865 ∧
    ({0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 16, 17, 18, 19, 21, 22, 23, 24, 25, 29, 30} : Finset Vertex).card = 23 ∧ orbitCodeInverse 1676623865 = 38
  decide +kernel

theorem kernel_cert_039 : KernelCertificate 39 := by
  change row ({0, 1, 15, 16, 17, 18, 19, 20, 21, 22, 23, 28, 29, 30, 31} : Finset Vertex) = {5, 11, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 1, 15, 16, 17, 18, 19, 20, 21, 22, 23, 28, 29, 30, 31} : Finset Vertex) = 4043276291 ∧
    ({0, 1, 15, 16, 17, 18, 19, 20, 21, 22, 23, 28, 29, 30, 31} : Finset Vertex).card = 15 ∧ orbitCodeInverse 4043276291 = 39
  decide +kernel

#print axioms kernel_cert_039
end W04
