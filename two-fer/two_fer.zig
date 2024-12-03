pub fn twoFer(buffer: []u8, name: ?[]const u8) anyerror![]u8 {
    const fmt = @import("std").fmt;
    const them = name orelse "you";
    return try fmt.bufPrint(buffer, "One for {?s}, one for me.", .{them});
}
