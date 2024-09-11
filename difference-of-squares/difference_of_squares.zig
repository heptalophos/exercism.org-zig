pub fn squareOfSum(number: usize) usize {
    var sum: usize = 0;
    var n: usize = 1;
    while (n <= number) : (n += 1) sum += n;
    return sum * sum;
}

pub fn sumOfSquares(number: usize) usize {
    var sum: usize = 0;
    var n: usize = 1;
    while (n <= number) : (n += 1) sum += n * n;
    return sum;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
