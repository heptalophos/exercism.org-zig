pub const TriangleError = error{ Invalid };

pub const Triangle = struct {
    a: f64, b: f64, c: f64,

    pub fn init(a: f64, b: f64, c: f64) TriangleError!Triangle {
        if (noZeroSides(a, b, c) and triangleInequality(a, b, c))
            return .{.a = a, .b = b, .c = c};
        return TriangleError.Invalid;
    }

    pub fn isEquilateral(self: Triangle) bool {
        return self.a == self.b and self.b == self.c;
    }

    pub fn isIsosceles(self: Triangle) bool {
        return self.a == self.b or self.b == self.c or self.c == self.a;
    }

    pub fn isScalene(self: Triangle) bool {
        return !self.isIsosceles();
    }
};

// Auxiliary fcns

fn noZeroSides( a: f64, b: f64, c: f64) bool { 
    return a * b * c > 0; 
}

fn triangleInequality( a: f64, b: f64, c: f64) bool {
        return 2 * @max(a, b, c) < a + b + c; 
}