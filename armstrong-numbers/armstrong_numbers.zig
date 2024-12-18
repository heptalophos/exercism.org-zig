const math = @import("std").math;

pub fn isArmstrongNumber(num: u128) bool {
    var ds: u16, var x: u128 = .{0, num};
    while (x != 0) : ( x /= 10 ) ds += 1;
    x = num; // again
    var sum: u128 = 0;
    while (x != 0) : (x /= 10)
        sum += math.powi(u128, x % 10, ds) 
        catch return false;
    return sum == num;
}
