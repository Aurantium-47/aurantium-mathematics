import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_016 : KernelCertificate 16 := by
  change row ({3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex) = {0, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18, 19, 23, 24, 25, 26, 27, 28, 29, 30} ∧
    orbitFingerprint ({3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex) = 1004945144 ∧
    ({3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex).card = 20 ∧ orbitCodeInverse 1004945144 = 16
  decide +kernel

theorem kernel_cert_017 : KernelCertificate 17 := by
  change row ({0, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18, 19, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex) = {0, 1, 4, 5, 11, 12, 15, 16, 17, 22, 23, 29, 30, 31} ∧
    orbitFingerprint ({0, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18, 19, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex) = 2140082145 ∧
    ({0, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18, 19, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex).card = 20 ∧ orbitCodeInverse 2140082145 = 17
  decide +kernel

theorem kernel_cert_018 : KernelCertificate 18 := by
  change row ({0, 1, 4, 5, 11, 12, 15, 16, 17, 22, 23, 29, 30, 31} : Finset Vertex) = {3, 4, 5, 6, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 28, 29} ∧
    orbitFingerprint ({0, 1, 4, 5, 11, 12, 15, 16, 17, 22, 23, 29, 30, 31} : Finset Vertex) = 3770914867 ∧
    ({0, 1, 4, 5, 11, 12, 15, 16, 17, 22, 23, 29, 30, 31} : Finset Vertex).card = 14 ∧ orbitCodeInverse 3770914867 = 18
  decide +kernel

theorem kernel_cert_019 : KernelCertificate 19 := by
  change row ({3, 4, 5, 6, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 28, 29} : Finset Vertex) = {0, 5, 6, 7, 9, 10, 11, 16, 17, 18, 19, 23, 24, 25, 27, 28, 29, 30} ∧
    orbitFingerprint ({3, 4, 5, 6, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 28, 29} : Finset Vertex) = 837172344 ∧
    ({3, 4, 5, 6, 10, 11, 12, 13, 17, 18, 21, 22, 23, 24, 28, 29} : Finset Vertex).card = 16 ∧ orbitCodeInverse 837172344 = 19
  decide +kernel

theorem kernel_cert_020 : KernelCertificate 20 := by
  change row ({0, 5, 6, 7, 9, 10, 11, 16, 17, 18, 19, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex) = {0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 17, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({0, 5, 6, 7, 9, 10, 11, 16, 17, 18, 19, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex) = 2072973025 ∧
    ({0, 5, 6, 7, 9, 10, 11, 16, 17, 18, 19, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex).card = 18 ∧ orbitCodeInverse 2072973025 = 20
  decide +kernel

theorem kernel_cert_021 : KernelCertificate 21 := by
  change row ({0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 17, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex) = {3, 4, 5, 11, 12, 13, 17, 18, 21, 22, 23} ∧
    orbitFingerprint ({0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 17, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex) = 4291010547 ∧
    ({0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 17, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex).card = 24 ∧ orbitCodeInverse 4291010547 = 21
  decide +kernel

theorem kernel_cert_022 : KernelCertificate 22 := by
  change row ({3, 4, 5, 11, 12, 13, 17, 18, 21, 22, 23} : Finset Vertex) = {0, 5, 6, 10, 11, 16, 17, 18, 19, 23, 24, 29} ∧
    orbitFingerprint ({3, 4, 5, 11, 12, 13, 17, 18, 21, 22, 23} : Finset Vertex) = 15087672 ∧
    ({3, 4, 5, 11, 12, 13, 17, 18, 21, 22, 23} : Finset Vertex).card = 11 ∧ orbitCodeInverse 15087672 = 22
  decide +kernel

theorem kernel_cert_023 : KernelCertificate 23 := by
  change row ({0, 5, 6, 10, 11, 16, 17, 18, 19, 23, 24, 29} : Finset Vertex) = {0, 1, 4, 5, 6, 7, 9, 10, 11, 12, 15, 16, 17, 22, 23, 24, 25, 28, 29, 30} ∧
    orbitFingerprint ({0, 5, 6, 10, 11, 16, 17, 18, 19, 23, 24, 29} : Finset Vertex) = 563022945 ∧
    ({0, 5, 6, 10, 11, 16, 17, 18, 19, 23, 24, 29} : Finset Vertex).card = 12 ∧ orbitCodeInverse 563022945 = 23
  decide +kernel

#print axioms kernel_cert_023
end W04
