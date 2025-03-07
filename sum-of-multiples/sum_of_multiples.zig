const mem = @import("std").mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    _ = allocator;
    
    var total: u64 = 0;

    for (factors, 0..factors.len) |factor, index| {
        if (factor == 0) continue;
        var f = factor;
        while (f < limit) : (f += factor) {
            var avoid_label = true;
            if (f % factor == 0) {
                for (0..index) |i| {
                    if (f % factors[i] == 0) {
                        avoid_label = false;
                        continue;
                    }
                }
            if (avoid_label) total += f;  
            }
        }
    }
    return total;
}
