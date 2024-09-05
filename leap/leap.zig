pub fn isLeapYear(year: u32) bool {
    if (@mod(year, 100) == 0) {
        return @mod(year, 400) == 0;
    } else {
        return @mod(year, 4) == 0;
    }
}
