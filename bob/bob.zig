const std = @import("std");
const ascii = std.ascii;
const mem = std.mem;

pub fn response(s: []const u8) []const u8 {
    const query = mem.trim(u8, s, &ascii.whitespace);
    if (query.len == 0) return "Fine. Be that way!";
    return  if (query[query.len - 1] == '?')
                if(!anyUpperz(query)) "Sure."
                else "Calm down, I know what I'm doing!"
            else
                if(!anyUpperz(query)) "Whatever."
                else "Whoa, chill out!";
}

fn anyUpperz(s: []const u8) bool {
    var someUpperz = false;
    for (s) |c| {
        if (ascii.isLower(c)) return false;
        someUpperz = someUpperz or ascii.isUpper(c);
    }
    return someUpperz;
}
