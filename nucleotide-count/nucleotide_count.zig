const ascii = @import("std").ascii;

pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32,
    c: u32,
    g: u32,
    t: u32,
};

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var cs: Counts = .{ .a = 0, .c = 0, .g = 0, .t = 0};
    for (s) |n| {
        const nucl: *u32 = switch (ascii.toUpper(n)) {
            'A' => &cs.a,
            'C' => &cs.c,
            'G' => &cs.g,
            'T' => &cs.t,
            else => { return NucleotideError.Invalid; }
        };
        nucl.* += 1;
    }
    return cs;
}
