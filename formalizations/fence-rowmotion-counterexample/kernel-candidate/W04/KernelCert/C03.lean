import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_024 : KernelCertificate 24 := by
  change row ({0, 1, 4, 5, 6, 7, 9, 10, 11, 12, 15, 16, 17, 22, 23, 24, 25, 28, 29, 30} : Finset Vertex) = {3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 4, 5, 6, 7, 9, 10, 11, 12, 15, 16, 17, 22, 23, 24, 25, 28, 29, 30} : Finset Vertex) = 1942200051 ∧
    ({0, 1, 4, 5, 6, 7, 9, 10, 11, 12, 15, 16, 17, 22, 23, 24, 25, 28, 29, 30} : Finset Vertex).card = 20 ∧ orbitCodeInverse 1942200051 = 24
  decide +kernel

theorem kernel_cert_025 : KernelCertificate 25 := by
  change row ({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 27, 28, 29, 30, 31} : Finset Vertex) = {0, 16, 17, 18, 19, 23, 24} ∧
    orbitFingerprint ({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 27, 28, 29, 30, 31} : Finset Vertex) = 4175839224 ∧
    ({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 27, 28, 29, 30, 31} : Finset Vertex).card = 21 ∧ orbitCodeInverse 4175839224 = 25
  decide +kernel

theorem kernel_cert_026 : KernelCertificate 26 := by
  change row ({0, 16, 17, 18, 19, 23, 24} : Finset Vertex) = {0, 1, 5, 11, 15, 16, 17, 22, 23, 24, 25, 29} ∧
    orbitFingerprint ({0, 16, 17, 18, 19, 23, 24} : Finset Vertex) = 26148865 ∧
    ({0, 16, 17, 18, 19, 23, 24} : Finset Vertex).card = 7 ∧ orbitCodeInverse 26148865 = 26
  decide +kernel

theorem kernel_cert_027 : KernelCertificate 27 := by
  change row ({0, 1, 5, 11, 15, 16, 17, 22, 23, 24, 25, 29} : Finset Vertex) = {4, 5, 6, 10, 11, 12, 17, 18, 21, 22, 23, 28, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 11, 15, 16, 17, 22, 23, 24, 25, 29} : Finset Vertex) = 600016931 ∧
    ({0, 1, 5, 11, 15, 16, 17, 22, 23, 24, 25, 29} : Finset Vertex).card = 12 ∧ orbitCodeInverse 600016931 = 27
  decide +kernel

theorem kernel_cert_028 : KernelCertificate 28 := by
  change row ({4, 5, 6, 10, 11, 12, 17, 18, 21, 22, 23, 28, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 16, 17, 18, 19, 23, 24, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 10, 11, 12, 17, 18, 21, 22, 23, 28, 29, 30} : Finset Vertex) = 1894128752 ∧
    ({4, 5, 6, 10, 11, 12, 17, 18, 21, 22, 23, 28, 29, 30} : Finset Vertex).card = 14 ∧ orbitCodeInverse 1894128752 = 28
  decide +kernel

theorem kernel_cert_029 : KernelCertificate 29 := by
  change row ({0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 16, 17, 18, 19, 23, 24, 27, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 6, 7, 8, 9, 10, 11, 15, 16, 17, 22, 23, 24, 25} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 16, 17, 18, 19, 23, 24, 27, 28, 29, 30, 31} : Finset Vertex) = 4186914553 ∧
    ({0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 16, 17, 18, 19, 23, 24, 27, 28, 29, 30, 31} : Finset Vertex).card = 22 ∧ orbitCodeInverse 4186914553 = 29
  decide +kernel

theorem kernel_cert_030 : KernelCertificate 30 := by
  change row ({0, 1, 5, 6, 7, 8, 9, 10, 11, 15, 16, 17, 22, 23, 24, 25} : Finset Vertex) = {4, 5, 11, 12, 17, 18, 21, 22, 23, 29} ∧
    orbitFingerprint ({0, 1, 5, 6, 7, 8, 9, 10, 11, 15, 16, 17, 22, 23, 24, 25} : Finset Vertex) = 63148003 ∧
    ({0, 1, 5, 6, 7, 8, 9, 10, 11, 15, 16, 17, 22, 23, 24, 25} : Finset Vertex).card = 16 ∧ orbitCodeInverse 63148003 = 30
  decide +kernel

theorem kernel_cert_031 : KernelCertificate 31 := by
  change row ({4, 5, 11, 12, 17, 18, 21, 22, 23, 29} : Finset Vertex) = {0, 3, 4, 5, 6, 10, 11, 12, 13, 16, 17, 18, 19, 23, 24, 28, 29, 30} ∧
    orbitFingerprint ({4, 5, 11, 12, 17, 18, 21, 22, 23, 29} : Finset Vertex) = 551950384 ∧
    ({4, 5, 11, 12, 17, 18, 21, 22, 23, 29} : Finset Vertex).card = 10 ∧ orbitCodeInverse 551950384 = 31
  decide +kernel

#print axioms kernel_cert_031
end W04
