pub fn eggCount(number: usize) usize {
    if (number == 0) return 0;
    return (1 & number) + eggCount(number >> 1);
}
