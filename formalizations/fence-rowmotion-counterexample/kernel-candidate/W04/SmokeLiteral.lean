import W04.Rowmotion

namespace W04
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem smoke_row_000 : row ({4, 5, 6, 7, 11} : Finset Vertex) = {0, 3, 4, 5, 10, 11, 12, 17, 23, 29} := by
  decide +kernel
#print axioms smoke_row_000

theorem smoke_row_236 : row ({0, 1, 5, 6, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} : Finset Vertex) = {4, 5, 6, 7, 11} := by
  decide +kernel
#print axioms smoke_row_236

theorem smoke_row_012 : row ({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 28, 29, 30, 31} : Finset Vertex) = {17, 18, 27, 28, 29} := by
  decide +kernel
#print axioms smoke_row_012

end W04
