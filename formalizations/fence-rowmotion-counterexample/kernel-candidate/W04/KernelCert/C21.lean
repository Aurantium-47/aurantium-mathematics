import W04.KernelData

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem kernel_cert_168 : KernelCertificate 168 := by
  change row ({4, 5, 6, 7, 10, 11, 12, 16, 17, 18, 22, 23, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 24, 28, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 7, 10, 11, 12, 16, 17, 18, 22, 23, 29, 30} : Finset Vertex) = 1623661808 ∧
    ({4, 5, 6, 7, 10, 11, 12, 16, 17, 18, 22, 23, 29, 30} : Finset Vertex).card = 14 ∧ orbitCodeInverse 1623661808 = 168
  decide +kernel

theorem kernel_cert_169 : KernelCertificate 169 := by
  change row ({0, 3, 4, 5, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 24, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 6, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 27, 28, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 24, 28, 29, 30, 31} : Finset Vertex) = 4059020857 ∧
    ({0, 3, 4, 5, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 24, 28, 29, 30, 31} : Finset Vertex).card = 22 ∧ orbitCodeInverse 4059020857 = 169
  decide +kernel

theorem kernel_cert_170 : KernelCertificate 170 := by
  change row ({0, 1, 5, 6, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex) = {4, 5, 6, 7, 10, 11, 23, 24, 25, 26, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 6, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex) = 1006631011 ∧
    ({0, 1, 5, 6, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 27, 28, 29} : Finset Vertex).card = 22 ∧ orbitCodeInverse 1006631011 = 170
  decide +kernel

theorem kernel_cert_171 : KernelCertificate 171 := by
  change row ({4, 5, 6, 7, 10, 11, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 9, 10, 11, 12, 17, 22, 23, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 7, 10, 11, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex) = 2139098352 ∧
    ({4, 5, 6, 7, 10, 11, 23, 24, 25, 26, 27, 28, 29, 30} : Finset Vertex).card = 14 ∧ orbitCodeInverse 2139098352 = 171
  decide +kernel

theorem kernel_cert_172 : KernelCertificate 172 := by
  change row ({0, 3, 4, 5, 9, 10, 11, 12, 17, 22, 23, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 6, 11, 12, 13, 16, 17, 18, 21, 22, 23, 24, 28, 29} ∧
    orbitFingerprint ({0, 3, 4, 5, 9, 10, 11, 12, 17, 22, 23, 29, 30, 31} : Finset Vertex) = 3770818105 ∧
    ({0, 3, 4, 5, 9, 10, 11, 12, 17, 22, 23, 29, 30, 31} : Finset Vertex).card = 14 ∧ orbitCodeInverse 3770818105 = 172
  decide +kernel

theorem kernel_cert_173 : KernelCertificate 173 := by
  change row ({0, 1, 5, 6, 11, 12, 13, 16, 17, 18, 21, 22, 23, 24, 28, 29} : Finset Vertex) = {4, 5, 6, 7, 10, 11, 15, 16, 17, 18, 19, 23, 24, 25, 27, 28, 29, 30} ∧
    orbitFingerprint ({0, 1, 5, 6, 11, 12, 13, 16, 17, 18, 21, 22, 23, 24, 28, 29} : Finset Vertex) = 837236835 ∧
    ({0, 1, 5, 6, 11, 12, 13, 16, 17, 18, 21, 22, 23, 24, 28, 29} : Finset Vertex).card = 16 ∧ orbitCodeInverse 837236835 = 173
  decide +kernel

theorem kernel_cert_174 : KernelCertificate 174 := by
  change row ({4, 5, 6, 7, 10, 11, 15, 16, 17, 18, 19, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex) = {0, 3, 4, 5, 9, 10, 11, 12, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} ∧
    orbitFingerprint ({4, 5, 6, 7, 10, 11, 15, 16, 17, 18, 19, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex) = 2073005296 ∧
    ({4, 5, 6, 7, 10, 11, 15, 16, 17, 18, 19, 23, 24, 25, 27, 28, 29, 30} : Finset Vertex).card = 18 ∧ orbitCodeInverse 2073005296 = 174
  decide +kernel

theorem kernel_cert_175 : KernelCertificate 175 := by
  change row ({0, 3, 4, 5, 9, 10, 11, 12, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex) = {0, 1, 5, 6, 11, 12, 13, 17, 21, 22, 23} ∧
    orbitFingerprint ({0, 3, 4, 5, 9, 10, 11, 12, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex) = 4290780729 ∧
    ({0, 3, 4, 5, 9, 10, 11, 12, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex).card = 18 ∧ orbitCodeInverse 4290780729 = 175
  decide +kernel

#print axioms kernel_cert_175
end W04
