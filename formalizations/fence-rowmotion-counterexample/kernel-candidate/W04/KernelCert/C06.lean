import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_048 : KernelCertificate 48 := by
  change row ({0, 10, 11, 12, 13, 21, 22, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 9, 10, 11, 17, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 10, 11, 12, 13, 21, 22, 23, 28, 29, 30, 31} : Finset Vertex) = 4041227265 ∧
    ({0, 10, 11, 12, 13, 21, 22, 23, 28, 29, 30, 31} : Finset Vertex).card = 12 ∧ orbitCodeInverse 4041227265 = 48
  decide +kernel

theorem kernel_cert_049 : KernelCertificate 49 := by
  change row ({0, 1, 5, 9, 10, 11, 17, 23, 24, 27, 28, 29} : Finset Vertex) = {4, 5, 6, 11, 12, 16, 17, 18, 22, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 9, 10, 11, 17, 23, 24, 27, 28, 29} : Finset Vertex) = 964824611 ∧
    ({0, 1, 5, 9, 10, 11, 17, 23, 24, 27, 28, 29} : Finset Vertex).card = 12 ∧ orbitCodeInverse 964824611 = 49
  decide +kernel

theorem kernel_cert_050 : KernelCertificate 50 := by
  change row ({4, 5, 6, 11, 12, 16, 17, 18, 22, 23, 24, 25, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 6, 7, 10, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 11, 12, 16, 17, 18, 22, 23, 24, 25, 29, 30} : Finset Vertex) = 1673992304 ∧
    ({4, 5, 6, 11, 12, 16, 17, 18, 22, 23, 24, 25, 29, 30} : Finset Vertex).card = 14 ∧ orbitCodeInverse 1673992304 = 50
  decide +kernel

theorem kernel_cert_051 : KernelCertificate 51 := by
  change row ({0, 3, 4, 5, 6, 7, 10, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 6, 7, 10, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 28, 29, 30, 31} : Finset Vertex) = 4042243321 ∧
    ({0, 3, 4, 5, 6, 7, 10, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 28, 29, 30, 31} : Finset Vertex).card = 22 ∧ orbitCodeInverse 4042243321 = 51
  decide +kernel

theorem kernel_cert_052 : KernelCertificate 52 := by
  change row ({0, 1, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = {5, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 1, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = 973078019 ∧
    ({0, 1, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex).card = 21 ∧ orbitCodeInverse 973078019 = 52
  decide +kernel

theorem kernel_cert_053 : KernelCertificate 53 := by
  change row ({5, 23, 24, 25, 29, 30} : Finset Vertex) = {0, 4, 5, 6, 11, 17, 22, 23, 28, 29, 30, 31} ∧
    orbitFingerprint ({5, 23, 24, 25, 29, 30} : Finset Vertex) = 1669333024 ∧
    ({5, 23, 24, 25, 29, 30} : Finset Vertex).card = 6 ∧ orbitCodeInverse 1669333024 = 53
  decide +kernel

theorem kernel_cert_054 : KernelCertificate 54 := by
  change row ({0, 4, 5, 6, 11, 17, 22, 23, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 3, 4, 5, 6, 7, 10, 11, 12, 16, 17, 18, 21, 22, 23, 24, 27, 28, 29} ∧
    orbitFingerprint ({0, 4, 5, 6, 11, 17, 22, 23, 28, 29, 30, 31} : Finset Vertex) = 4039247985 ∧
    ({0, 4, 5, 6, 11, 17, 22, 23, 28, 29, 30, 31} : Finset Vertex).card = 12 ∧ orbitCodeInverse 4039247985 = 54
  decide +kernel

theorem kernel_cert_055 : KernelCertificate 55 := by
  change row ({0, 1, 3, 4, 5, 6, 7, 10, 11, 12, 16, 17, 18, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = {0, 1, 2, 3, 4, 5, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 23, 24, 25, 29, 30} ∧
    orbitFingerprint ({0, 1, 3, 4, 5, 6, 7, 10, 11, 12, 16, 17, 18, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex) = 971447547 ∧
    ({0, 1, 3, 4, 5, 6, 7, 10, 11, 12, 16, 17, 18, 21, 22, 23, 24, 27, 28, 29} : Finset Vertex).card = 20 ∧ orbitCodeInverse 971447547 = 55
  decide +kernel

#print axioms kernel_cert_055
end W04
