pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

pub fn classify(n: u64) Classification {
    @import("std").debug.assert(n > 0);
    var aliquot: u64 = 0;
    for (1..n) |i| {
        if (i > (n >> 1)) break;
        if (n % i == 0) aliquot += i;
    }
    if (aliquot < n) return .deficient;
    if (aliquot > n) return .abundant;
    return .perfect;
    
}
