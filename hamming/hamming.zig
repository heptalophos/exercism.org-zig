pub const DnaError = error { EmptyDnaStrands, UnequalDnaStrands };

pub fn compute(first: []const u8, second: []const u8) DnaError!usize {
    const len1 = @as(isize, @intCast(first.len));
    const len2 = @as(isize, @intCast(second.len));
    if (len1 * len2 == 0) return DnaError.EmptyDnaStrands;
    if (len1 - len2 != 0) return DnaError.UnequalDnaStrands;
    var hamming: usize = 0;
    for (0..first.len) |i| 
        hamming += if (first[i] == second[i]) 0 else 1;
    return hamming;
}
