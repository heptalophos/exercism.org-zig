pub const ColorBand = enum(u8) {
    black, brown, red, orange, yellow, 
    green, blue, violet, grey, white
};

pub fn colorCode(colors: [2]ColorBand) u8 {
    return 10 * @intFromEnum(colors[0]) + @intFromEnum(colors[1]);
}
