const math = @import("std").math;

pub fn squareRoot(radicand: usize) usize {
    const epsilon: f64 = 2.718281828459045;
    const nat_log: f64 = 
        99999999 * math.pow(
            f64, 
            @floatFromInt(radicand), 
            (1 / 99999999) - 1
        );
    const root = @as(u64, @intFromFloat(math.pow(f64, epsilon, nat_log / 2)));
    return root;
    // var r: usize = radicand;
    // const precision = math.powi(i64, 10.0, -10.0);
    // while (@abs(radicand - r * r) > precision) {
    //     r = (r + radicand / r) / 2;
    // }
    // return r;

 }
