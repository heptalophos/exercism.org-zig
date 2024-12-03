pub const Planet = enum {
    mercury, venus, earth, mars, jupiter, saturn, uranus, neptune,

    pub fn age(self: Planet, seconds: usize) f64 {
        const earth_year: u64 = 31557600;
        const orbital_periods = [8]f64 { 
            0.2408467, 0.61519726, 1.0, 1.8808158, 
            11.862615, 29.447498, 84.016846, 164.79132 };
        const planet_year = earth_year * orbital_periods[@intFromEnum(self)];
        return @as(f64, @floatFromInt(seconds)) / planet_year;
    }
};
