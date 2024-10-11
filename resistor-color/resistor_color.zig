pub const ColorBand = enum {
    black, brown, red, orange, yellow, 
    green, blue, violet, grey, white
};

pub fn colorCode(color: ColorBand) usize {
    return @intFromEnum(color);
}

pub fn colors() []const ColorBand {
    const values: fn (comptime ColorBand: type) []const ColorBand =
        @import("std").enums.values;
    return values(ColorBand);
}
