pub const TriangleError = error{ Invalid };

pub const Triangle = struct {
    a: f64, b: f64, c: f64,

    pub fn init(a: f64, b: f64, c: f64) TriangleError!Triangle {
        if (2 * @max(a, b, c) < a + b + c and a * b * c > 0)
            return .{.a = a, .b = b, .c = c};
        return TriangleError.Invalid;
    }

    pub fn isEquilateral(self: Triangle) bool {
        const min = @min(self.a, self.b, self.c);
        const max = @max(self.a, self.b, self.c); 
        return min == max;
    }

    pub fn isIsosceles(self: Triangle) bool {
        const x, const y, const z = 
            .{self.a, self.b, self.c};
        return x == y or y == z or z == x;
    }

    pub fn isScalene(self: Triangle) bool {
        const x, const y, const z = 
            .{self.a, self.b, self.c};
        return x != y and y != z and z != x;
    }
};
