const std = @import("std");
const ascii = std.ascii;
const bitset = std.bit_set;

pub fn isIsogram(str: []const u8) bool {
    var iso = bitset.IntegerBitSet(26).initEmpty();
    for (str) |c| {
        if (!ascii.isAlphabetic(c)) continue;
        const idx = ascii.toLower(c) - 'a';
        if (iso.isSet(idx)) return false;
        iso.set(idx);
    }
    return true;
}
