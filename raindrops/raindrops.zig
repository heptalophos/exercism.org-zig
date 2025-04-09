const fbstream = @import("std").io.fixedBufferStream; 

pub fn convert(buffer: []u8, n: u32) []const u8 {
    var stream = fbstream(buffer);
    if (n % 3 == 0) stream.writer().writeAll("Pling") 
    catch unreachable;
    if (n % 5 == 0) stream.writer().writeAll("Plang") 
    catch unreachable;
    if (n % 7 == 0) stream.writer().writeAll("Plong") 
    catch unreachable;
    if (stream.pos == 0) stream.writer().print("{d}", .{n})
    catch unreachable;
    return stream.getWritten();
}
