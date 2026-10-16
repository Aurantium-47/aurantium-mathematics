import W04.KernelCert.C00
import W04.KernelCert.C01
import W04.KernelCert.C02
import W04.KernelCert.C03
import W04.KernelCert.C04
import W04.KernelCert.C05
import W04.KernelCert.C06
import W04.KernelCert.C07
import W04.KernelCert.C08
import W04.KernelCert.C09
import W04.KernelCert.C10
import W04.KernelCert.C11
import W04.KernelCert.C12
import W04.KernelCert.C13
import W04.KernelCert.C14
import W04.KernelCert.C15
import W04.KernelCert.C16
import W04.KernelCert.C17
import W04.KernelCert.C18
import W04.KernelCert.C19
import W04.KernelCert.C20
import W04.KernelCert.C21
import W04.KernelCert.C22
import W04.KernelCert.C23
import W04.KernelCert.C24
import W04.KernelCert.C25
import W04.KernelCert.C26
import W04.KernelCert.C27
import W04.KernelCert.C28
import W04.KernelCert.C29
import Mathlib.Tactic.FinCases

namespace W04
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem orbit_start : orbit 0 = {4, 5, 6, 7, 11} := rfl

theorem kernel_certificate : ∀ k : Fin 237, KernelCertificate k := by
  intro k
  fin_cases k
  · exact kernel_cert_000
  · exact kernel_cert_001
  · exact kernel_cert_002
  · exact kernel_cert_003
  · exact kernel_cert_004
  · exact kernel_cert_005
  · exact kernel_cert_006
  · exact kernel_cert_007
  · exact kernel_cert_008
  · exact kernel_cert_009
  · exact kernel_cert_010
  · exact kernel_cert_011
  · exact kernel_cert_012
  · exact kernel_cert_013
  · exact kernel_cert_014
  · exact kernel_cert_015
  · exact kernel_cert_016
  · exact kernel_cert_017
  · exact kernel_cert_018
  · exact kernel_cert_019
  · exact kernel_cert_020
  · exact kernel_cert_021
  · exact kernel_cert_022
  · exact kernel_cert_023
  · exact kernel_cert_024
  · exact kernel_cert_025
  · exact kernel_cert_026
  · exact kernel_cert_027
  · exact kernel_cert_028
  · exact kernel_cert_029
  · exact kernel_cert_030
  · exact kernel_cert_031
  · exact kernel_cert_032
  · exact kernel_cert_033
  · exact kernel_cert_034
  · exact kernel_cert_035
  · exact kernel_cert_036
  · exact kernel_cert_037
  · exact kernel_cert_038
  · exact kernel_cert_039
  · exact kernel_cert_040
  · exact kernel_cert_041
  · exact kernel_cert_042
  · exact kernel_cert_043
  · exact kernel_cert_044
  · exact kernel_cert_045
  · exact kernel_cert_046
  · exact kernel_cert_047
  · exact kernel_cert_048
  · exact kernel_cert_049
  · exact kernel_cert_050
  · exact kernel_cert_051
  · exact kernel_cert_052
  · exact kernel_cert_053
  · exact kernel_cert_054
  · exact kernel_cert_055
  · exact kernel_cert_056
  · exact kernel_cert_057
  · exact kernel_cert_058
  · exact kernel_cert_059
  · exact kernel_cert_060
  · exact kernel_cert_061
  · exact kernel_cert_062
  · exact kernel_cert_063
  · exact kernel_cert_064
  · exact kernel_cert_065
  · exact kernel_cert_066
  · exact kernel_cert_067
  · exact kernel_cert_068
  · exact kernel_cert_069
  · exact kernel_cert_070
  · exact kernel_cert_071
  · exact kernel_cert_072
  · exact kernel_cert_073
  · exact kernel_cert_074
  · exact kernel_cert_075
  · exact kernel_cert_076
  · exact kernel_cert_077
  · exact kernel_cert_078
  · exact kernel_cert_079
  · exact kernel_cert_080
  · exact kernel_cert_081
  · exact kernel_cert_082
  · exact kernel_cert_083
  · exact kernel_cert_084
  · exact kernel_cert_085
  · exact kernel_cert_086
  · exact kernel_cert_087
  · exact kernel_cert_088
  · exact kernel_cert_089
  · exact kernel_cert_090
  · exact kernel_cert_091
  · exact kernel_cert_092
  · exact kernel_cert_093
  · exact kernel_cert_094
  · exact kernel_cert_095
  · exact kernel_cert_096
  · exact kernel_cert_097
  · exact kernel_cert_098
  · exact kernel_cert_099
  · exact kernel_cert_100
  · exact kernel_cert_101
  · exact kernel_cert_102
  · exact kernel_cert_103
  · exact kernel_cert_104
  · exact kernel_cert_105
  · exact kernel_cert_106
  · exact kernel_cert_107
  · exact kernel_cert_108
  · exact kernel_cert_109
  · exact kernel_cert_110
  · exact kernel_cert_111
  · exact kernel_cert_112
  · exact kernel_cert_113
  · exact kernel_cert_114
  · exact kernel_cert_115
  · exact kernel_cert_116
  · exact kernel_cert_117
  · exact kernel_cert_118
  · exact kernel_cert_119
  · exact kernel_cert_120
  · exact kernel_cert_121
  · exact kernel_cert_122
  · exact kernel_cert_123
  · exact kernel_cert_124
  · exact kernel_cert_125
  · exact kernel_cert_126
  · exact kernel_cert_127
  · exact kernel_cert_128
  · exact kernel_cert_129
  · exact kernel_cert_130
  · exact kernel_cert_131
  · exact kernel_cert_132
  · exact kernel_cert_133
  · exact kernel_cert_134
  · exact kernel_cert_135
  · exact kernel_cert_136
  · exact kernel_cert_137
  · exact kernel_cert_138
  · exact kernel_cert_139
  · exact kernel_cert_140
  · exact kernel_cert_141
  · exact kernel_cert_142
  · exact kernel_cert_143
  · exact kernel_cert_144
  · exact kernel_cert_145
  · exact kernel_cert_146
  · exact kernel_cert_147
  · exact kernel_cert_148
  · exact kernel_cert_149
  · exact kernel_cert_150
  · exact kernel_cert_151
  · exact kernel_cert_152
  · exact kernel_cert_153
  · exact kernel_cert_154
  · exact kernel_cert_155
  · exact kernel_cert_156
  · exact kernel_cert_157
  · exact kernel_cert_158
  · exact kernel_cert_159
  · exact kernel_cert_160
  · exact kernel_cert_161
  · exact kernel_cert_162
  · exact kernel_cert_163
  · exact kernel_cert_164
  · exact kernel_cert_165
  · exact kernel_cert_166
  · exact kernel_cert_167
  · exact kernel_cert_168
  · exact kernel_cert_169
  · exact kernel_cert_170
  · exact kernel_cert_171
  · exact kernel_cert_172
  · exact kernel_cert_173
  · exact kernel_cert_174
  · exact kernel_cert_175
  · exact kernel_cert_176
  · exact kernel_cert_177
  · exact kernel_cert_178
  · exact kernel_cert_179
  · exact kernel_cert_180
  · exact kernel_cert_181
  · exact kernel_cert_182
  · exact kernel_cert_183
  · exact kernel_cert_184
  · exact kernel_cert_185
  · exact kernel_cert_186
  · exact kernel_cert_187
  · exact kernel_cert_188
  · exact kernel_cert_189
  · exact kernel_cert_190
  · exact kernel_cert_191
  · exact kernel_cert_192
  · exact kernel_cert_193
  · exact kernel_cert_194
  · exact kernel_cert_195
  · exact kernel_cert_196
  · exact kernel_cert_197
  · exact kernel_cert_198
  · exact kernel_cert_199
  · exact kernel_cert_200
  · exact kernel_cert_201
  · exact kernel_cert_202
  · exact kernel_cert_203
  · exact kernel_cert_204
  · exact kernel_cert_205
  · exact kernel_cert_206
  · exact kernel_cert_207
  · exact kernel_cert_208
  · exact kernel_cert_209
  · exact kernel_cert_210
  · exact kernel_cert_211
  · exact kernel_cert_212
  · exact kernel_cert_213
  · exact kernel_cert_214
  · exact kernel_cert_215
  · exact kernel_cert_216
  · exact kernel_cert_217
  · exact kernel_cert_218
  · exact kernel_cert_219
  · exact kernel_cert_220
  · exact kernel_cert_221
  · exact kernel_cert_222
  · exact kernel_cert_223
  · exact kernel_cert_224
  · exact kernel_cert_225
  · exact kernel_cert_226
  · exact kernel_cert_227
  · exact kernel_cert_228
  · exact kernel_cert_229
  · exact kernel_cert_230
  · exact kernel_cert_231
  · exact kernel_cert_232
  · exact kernel_cert_233
  · exact kernel_cert_234
  · exact kernel_cert_235
  · exact kernel_cert_236

theorem orbit_step : ∀ k : Fin 237, row (orbit k) = orbit (next k) :=
  fun k => (kernel_certificate k).1

def prev (k : Fin 237) : Fin 237 := ⟨(k.val + 236) % 237, Nat.mod_lt _ (by decide)⟩

theorem next_prev : ∀ k : Fin 237, next (prev k) = k := by decide +kernel

theorem orbit_lower : ∀ k : Fin 237, LowerIdeal (orbit k) := by
  intro k
  have h := orbit_step (prev k)
  rw [next_prev k] at h
  rw [← h]
  exact row_lowerIdeal _

theorem orbit_fingerprint_eq_code :
    ∀ k : Fin 237, orbitFingerprint (orbit k) = orbitCode k :=
  fun k => (kernel_certificate k).2.1

theorem orbitCode_leftInverse (k : Fin 237) : orbitCodeInverse (orbitCode k) = k.val :=
  (kernel_certificate k).2.2.2

theorem orbitCode_injective : Function.Injective orbitCode := by
  intro i j h
  apply Fin.ext
  calc
    i.val = orbitCodeInverse (orbitCode i) := (orbitCode_leftInverse i).symm
    _ = orbitCodeInverse (orbitCode j) := congrArg orbitCodeInverse h
    _ = j.val := orbitCode_leftInverse j

/-- Only the codes of these 237 states need to be distinct; no global assertion
    that the fingerprint is injective is used. -/
theorem orbit_injective : Function.Injective orbit := by
  intro i j hij
  apply orbitCode_injective
  rw [← orbit_fingerprint_eq_code i, ← orbit_fingerprint_eq_code j]
  exact congrArg orbitFingerprint hij

theorem orbit_card_eq (k : Fin 237) : (orbit k).card = orbitCard k :=
  (kernel_certificate k).2.2.1

theorem orbit_sum : (∑ k : Fin 237, (orbit k).card) = 3774 := by
  calc
    (∑ k : Fin 237, (orbit k).card) = ∑ k : Fin 237, orbitCard k :=
      Finset.sum_congr rfl (fun k _ => orbit_card_eq k)
    _ = 3774 := by decide +kernel

#print axioms orbit_lower
#print axioms orbit_step
#print axioms orbit_fingerprint_eq_code
#print axioms orbitCode_injective
#print axioms orbit_injective
#print axioms orbit_sum
end W04
