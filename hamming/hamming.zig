pub const DnaError = error { EmptyDnaStrands, UnequalDnaStrands };

pub fn compute(fst: []const u8, snd: []const u8) DnaError!usize {
    if (fst.len * snd.len == 0) return DnaError.EmptyDnaStrands;
    if (fst.len != snd.len) return DnaError.UnequalDnaStrands;
    var hamming: usize = 0;
    for (0..fst.len) |i| hamming += if (fst[i] == snd[i]) 0 else 1;
    return hamming;
}
