const ascii = @import("std").ascii;

pub fn clean(phrase: []const u8) ?[10]u8 {
    var number = [_]u8{0} ** 10;
    var index: u8 = 0;
    for (phrase) |d| {
        if (ascii.isDigit(d)) {
            if ((index == 0 or index == 3) and d == '0') 
                return null;
            if (index == 0 and d == '1') 
                continue;
            if (index == 3 and d == '1') 
                return null;
            if (index == 10) return null;
            number[index] = d;
            index += 1;
        }
    }
    if (index != 10) return null;
    return number;
}
