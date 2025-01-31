const mem = @import("std").mem;
const RNAError = error{OutOfMemory};

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    const rna = try allocator.alloc(u8, dna.len);
    for (rna, dna) |*rn, dn|
        rn.* = switch (dn) {
            'A' => 'U',
            'C' => 'G',
            'G' => 'C',
            'T' => 'A',
            else => return RNAError.OutOfMemory,
        };
        return rna;
}
