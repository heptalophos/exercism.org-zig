const mem = @import("std").mem;

pub fn rotate(allocator: mem.Allocator, 
              text: []const u8, 
              shiftKey: u5
             ) mem.Allocator.Error![]u8 
{
    const cipher = try allocator.alloc(u8, text.len);

    for (text, 0..) |char, idx| {
        if ((char | 32 ) < 'a' or (char | 32) > 'z' or shiftKey == 0) {
            cipher[idx] = char;
            continue;
        }
        const alpha: u8 = if(char >= 'A' and char <= 'Z') 'A' else 'a';
        var shift = char - alpha;
        shift += shiftKey;
        shift %= 26;
        cipher[idx] = alpha + shift;
    }
    return cipher;
}
