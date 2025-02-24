const std = @import("std");
const mem = std.mem;
const ascii = std.ascii;

pub fn abbreviate(allocator: mem.Allocator, 
                  words: []const u8) mem.Allocator.Error![]u8 {
    var acro = std.ArrayList(u8).init(allocator);

    for (words, 0..) |c, i| {
        if (!ascii.isAlphabetic(c)) continue;
        if (i == 0 or wordBoundary(words[i - 1])) 
            try acro.append(ascii.toUpper(c));
    }
    return acro.toOwnedSlice();
}

fn wordBoundary(char: u8) bool {
    return char == ' ' or char == '-' or char == '_';
}