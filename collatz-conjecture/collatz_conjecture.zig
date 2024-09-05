pub const ComputationError = error { IllegalArgument };

pub fn steps(number: usize) ComputationError!usize {
    var x: usize = number; 
    var stepz: usize = 0;
    if (x <= 0) { 
        return ComputationError.IllegalArgument; 
    }
    while (x > 1) : (stepz += 1) {
        if (x & 1 == 0) { 
            x >>= 1; 
        } else { 
            x *= 3; 
            x += 1; 
        }
    }
    return stepz;
}
