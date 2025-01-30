const rand = @import("std").rand;

pub fn modifier(score: i8) i8 {
    return score - 10 >> 1;
}

pub fn ability() i8 {
    var randGen = rand.DefaultPrng.init(357111317);
    var dice: @Vector(4, i8) = [_]i8{0} ** 4;
    var i: usize = 0;
    while (i < 4) : (i += 1) { 
        dice[i] = randGen.random().intRangeAtMost(i8, 1, 6);
    }
    const sum = @reduce(.Add, dice);
    const min = @reduce(.Min, dice);
    return sum - min;
}

pub const Character = struct {
    strength: i8,
    dexterity: i8,
    constitution: i8,
    intelligence: i8,
    wisdom: i8,
    charisma: i8,
    hitpoints: i8,

    pub fn init() Character {
        const constitution = ability();
        return .{
            .strength = ability(), 
            .dexterity = ability(),
            .constitution = constitution, 
            .intelligence = ability(),
            .wisdom = ability(), 
            .charisma = ability(),
            .hitpoints = 10 + modifier(constitution)
        };
    }
};
