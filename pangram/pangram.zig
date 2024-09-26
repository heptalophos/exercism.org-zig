const ascii = @import("std").ascii;

pub fn isPangram(str: []const u8) bool {
    var present: u32 = 0;
    for (str) |ch| {
        const upch = ascii.toUpper(ch);
        if ( ascii.isAlphabetic(ch) ) {
            present |= @as(u32, 1) << @intCast(upch - 'A');
        }
        else continue; 
    }
    return present == (1 << 26) - 1;
}
