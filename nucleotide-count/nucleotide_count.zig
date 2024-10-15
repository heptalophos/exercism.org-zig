pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32,
    c: u32,
    g: u32,
    t: u32,
};

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    const ascii = @import("std").ascii;
    var cs: Counts = .{ .a = 0, .c = 0, .g = 0, .t = 0};
    for (s) |n| {
        const nucl: *u32 = switch (ascii.toLower(n) | ' ') {
            'a' => &cs.a,
            'c' => &cs.c,
            'g' => &cs.g,
            't' => &cs.t,
            else => { return NucleotideError.Invalid; }
        };
        nucl.* += 1;
    }
    return cs;
}
