const std = @import("std");
const mem = std.mem;

pub const Signal = enum(u5) {
    no_signal = 0,
    wink = 1 << 0,
    double_blink = 1 << 1,
    close_your_eyes = 1 << 2,
    jump = 1 << 3,
};

pub fn calculateHandshake(allocator: mem.Allocator, 
                          number: u5) mem.Allocator.Error![]const Signal 
{
    var signals = std.ArrayList(Signal).init(allocator);
    defer signals.deinit();
    if (number & 0x01 != 0) try signals.append(.wink);
    if (number & 0x02 != 0) try signals.append(.double_blink);
    if (number & 0x04 != 0) try signals.append(.close_your_eyes);
    if (number & 0x08 != 0) try signals.append(.jump);
    // If bit 4 is set, reverse the order
    if (number & 0x10 != 0) {
        mem.reverse(Signal, signals.items);
    }
    
    return signals.toOwnedSlice();
}
