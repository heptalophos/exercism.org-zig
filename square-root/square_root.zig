const math = @import("std").math;

pub fn squareRoot(radicand: usize) usize {
    var candidate: usize = 0;
    while (candidate < radicand) : (candidate += 1) {
        if (candidate * candidate != radicand) continue;
        return candidate;
    }
    return radicand;
}
