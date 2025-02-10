pub const Plant = enum {
    clover,
    grass,
    radishes,
    violets,
};

fn decodePlant(p: u8) Plant {
    return switch (p) {
        'C' => .clover,
        'G' => .grass,
        'R' => .radishes,
        'V' => .violets,
        else => @panic("not a plant"),
    };
}

pub fn plants(diagram: []const u8, student: []const u8) [4]Plant {
    const row_len = diagram.len / 2 + 1;
    const index = 2 * (student[0] - 'A');
    return .{
        decodePlant(diagram[index]),
        decodePlant(diagram[index + 1]),
        decodePlant(diagram[index + row_len]),
        decodePlant(diagram[index + row_len + 1]),
    };
}
