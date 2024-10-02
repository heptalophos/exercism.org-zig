/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    var i: usize = 1; 
    while (i <= s.len) : (i += 1) {
        buffer[i - 1] = s[s.len - i];
    }
    return buffer;
}
