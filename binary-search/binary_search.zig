pub fn binarySearch(comptime T: anytype, 
                    target: T, 
                    items: ?[]const T) ?usize 
{
    const buffer = items orelse return null;
    var min: usize = 0;
    var max: usize = buffer.len;
    while (min < max) {
        const mid = min + ((max - min) >> 1);
        if (buffer[mid] == target) return mid;
        if (buffer[mid] > target) max = mid else min = mid + 1;
    }
    return null;
}
