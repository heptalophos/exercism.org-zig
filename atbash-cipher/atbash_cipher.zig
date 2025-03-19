const std = @import("std");
const mem = std.mem;
const ascii = std.ascii;

/// Encodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn encode(allocator: mem.Allocator, s: []const u8) 
    mem.Allocator.Error![]u8 { return atbash(allocator, s, true); }

/// Decodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn decode(allocator: mem.Allocator, s: []const u8) 
    mem.Allocator.Error![]u8 { return atbash(allocator, s, false); }

fn atbash(allocator: mem.Allocator, s: []const u8, encFlag: bool) 
          mem.Allocator.Error![]u8 {
    var cs = std.ArrayList(u8).init(allocator);
    defer cs.deinit();
    for (s) |c| {
        if (!ascii.isAlphanumeric(c)) continue;
        if (encFlag and (cs.items.len + 1) % 6 == 0) try cs.append(' ');
        try cs.append(if (c >= 'A') 'a' + 'z' - (c | ' ') else c);
    }
    return cs.toOwnedSlice();
}