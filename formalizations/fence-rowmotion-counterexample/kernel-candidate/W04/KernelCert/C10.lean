import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_080 : KernelCertificate 80 := by
  change row ({4, 5, 6, 7, 9, 10, 11, 12, 17, 23, 24, 25, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 16, 17, 18, 22, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 7, 9, 10, 11, 12, 17, 23, 24, 25, 29, 30} : Finset Vertex) = 1669471984 ∧
    ({4, 5, 6, 7, 9, 10, 11, 12, 17, 23, 24, 25, 29, 30} : Finset Vertex).card = 14 ∧ orbitCodeInverse 1669471984 = 80
  decide +kernel

theorem kernel_cert_081 : KernelCertificate 81 := by
  change row ({0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 16, 17, 18, 22, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 15, 16, 17, 18, 19, 21, 22, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 16, 17, 18, 22, 23, 28, 29, 30, 31} : Finset Vertex) = 4039589881 ∧
    ({0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 16, 17, 18, 22, 23, 28, 29, 30, 31} : Finset Vertex).card = 21 ∧ orbitCodeInverse 4039589881 = 81
  decide +kernel

theorem kernel_cert_082 : KernelCertificate 82 := by
  change row ({0, 1, 15, 16, 17, 18, 19, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = {5, 11, 17, 18, 19, 20, 21, 22, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 1, 15, 16, 17, 18, 19, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = 971997187 ∧
    ({0, 1, 15, 16, 17, 18, 19, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex).card = 14 ∧ orbitCodeInverse 971997187 = 82
  decide +kernel

theorem kernel_cert_083 : KernelCertificate 83 := by
  change row ({5, 11, 17, 18, 19, 20, 21, 22, 23, 24, 25, 29, 30} : Finset Vertex) = {0, 4, 5, 6, 10, 11, 12, 16, 17, 28, 29, 30, 31} ∧
    orbitFingerprint ({5, 11, 17, 18, 19, 20, 21, 22, 23, 24, 25, 29, 30} : Finset Vertex) = 1677592608 ∧
    ({5, 11, 17, 18, 19, 20, 21, 22, 23, 24, 25, 29, 30} : Finset Vertex).card = 13 ∧ orbitCodeInverse 1677592608 = 83
  decide +kernel

theorem kernel_cert_084 : KernelCertificate 84 := by
  change row ({0, 4, 5, 6, 10, 11, 12, 16, 17, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 27, 28, 29} ∧
    orbitFingerprint ({0, 4, 5, 6, 10, 11, 12, 16, 17, 28, 29, 30, 31} : Finset Vertex) = 4026735729 ∧
    ({0, 4, 5, 6, 10, 11, 12, 16, 17, 28, 29, 30, 31} : Finset Vertex).card = 13 ∧ orbitCodeInverse 4026735729 = 84
  decide +kernel

theorem kernel_cert_085 : KernelCertificate 85 := by
  change row ({0, 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 27, 28, 29} : Finset Vertex) = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 29, 30} ∧
    orbitFingerprint ({0, 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 27, 28, 29} : Finset Vertex) = 948420347 ∧
    ({0, 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 23, 27, 28, 29} : Finset Vertex).card = 20 ∧ orbitCodeInverse 948420347 = 85
  decide +kernel

theorem kernel_cert_086 : KernelCertificate 86 := by
  change row ({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 29, 30} : Finset Vertex) = {21, 22, 23, 24, 25, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 29, 30} : Finset Vertex) = 1641021439 ∧
    ({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 29, 30} : Finset Vertex).card = 25 ∧ orbitCodeInverse 1641021439 = 86
  decide +kernel

theorem kernel_cert_087 : KernelCertificate 87 := by
  change row ({21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex) = {0, 5, 11, 17, 27, 28, 29} ∧
    orbitFingerprint ({21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex) = 4091543552 ∧
    ({21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex).card = 9 ∧ orbitCodeInverse 4091543552 = 87
  decide +kernel

#print axioms kernel_cert_087
end W04
