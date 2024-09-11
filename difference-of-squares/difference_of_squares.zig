pub fn squareOfSum(number: usize) usize {
    var sum: usize = 0;
    for (0..number) |x| { sum += x; }
    return square(sum + number);
}

pub fn sumOfSquares(number: usize) usize {
    var sum: usize = 0;
    for (0..number) |x| { sum += square(x); }
    return sum + square(number);
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}

// Auxiliary

fn square(x: usize) usize {
    return x * x;
}