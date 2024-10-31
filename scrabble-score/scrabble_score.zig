const toUpper = @import("std").ascii.toUpper;

pub fn score(s: []const u8) u32 {
    var total: u32 = 0;
    for (s) |letter| {
        total += switch (toUpper(letter)) {
                    'A', 'E', 'I', 'O', 'U' => 1,
                    'L', 'N', 'R', 'S', 'T' => 1,
                    'F', 'H', 'V', 'W', 'Y' => 4,
                    'B', 'C', 'M', 'P' => 3,
                    'D', 'G' => 2,
                    'J', 'X' => 8,
                    'Q', 'Z' => 10,
                    'K' => 5,
                    else => 0,
        };
    }
    return total;
}
