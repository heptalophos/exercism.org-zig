const ascii = @import("std").ascii;

pub fn response(query: []const u8) []const u8 {
    if (silent(query)) 
        return "Fine. Be that way!";
    if (yell(query) and question(query)) 
        return "Calm down, I know what I'm doing!";
    if (question(query)) 
        return "Sure.";
    if (yell(s)) 
        return "Whoa, chill out!";
    return "Whatever.";
}

fn silent(query: []const u8) bool {
    for (query) |c| 
        if (!ascii.isWhitespace(c)) 
            return false;
    return true;
}

fn question(query: []const u8) bool {
    for (0..query.len) |i| {
        if (ascii.isWhitespace(s[s.len - i - 1])) 
            continue;
        return s[s.len - i - 1] == '?';
    }
}

fn yell(query: []const u8) bool {
    for (query) |c| {
        if (ascii.isLower(c)) return false;
        if (ascii.isUpper(c)) return true;
    }
}