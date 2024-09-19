pub const ChessboardError = error { IndexOutOfBounds };

pub fn square(index: usize) ChessboardError!u64 {
    if (index == 0 or index > 64) 
        return ChessboardError.IndexOutOfBounds;
    return @as(u64, 1) << @intCast(index - 1);
}

pub fn total() u64 {
    const zero64 = @as(u64, 0);
    return complement(zero64);
}

// Auxiliary

fn complement(x: usize) usize {
    return ~x;
}