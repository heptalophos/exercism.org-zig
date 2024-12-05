pub fn binarySearch(comptime T: anytype, 
                    target: T, 
                    items: ?[]const T) ?usize 
{
    const list = items orelse return null;
    var lo: usize = 0;
    var hi: usize = list.len;
    while (lo < hi) {
        const mid = lo + ((hi - lo) >> 1);
        if (list[mid] == target) return mid;
        if (list[mid] > target) hi = mid else lo = mid + 1;
    }
    return null;
}
