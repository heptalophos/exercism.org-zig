const std = @import("std");
const mem = std.mem;
const ascii = std.ascii;
const A = 65; const space = 32;
const a = 97; const z = 122;

/// Encodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn encode(allocator:mem.Allocator, s:[]const u8) mem.Allocator.Error![]u8 { 
    var cs = std.ArrayList(u8).init(allocator);
    defer cs.deinit();
    for (s) |c| {
        if (!ascii.isAlphanumeric(c)) continue;
        if ((cs.items.len + 1) % 6 == 0) try cs.append(space);
        try cs.append(if (c >= A) a + z - (c | space) else c);
    }
    return cs.toOwnedSlice();
}

/// Decodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn decode(allocator:mem.Allocator, s:[]const u8) mem.Allocator.Error![]u8 { 
    var cs = std.ArrayList(u8).init(allocator);
    defer cs.deinit();
    for (s) |c| {
        if (!ascii.isAlphanumeric(c)) continue;
        try cs.append(if (c >= A) a + z - (c | space) else c);
    }
    return cs.toOwnedSlice(); 
}
