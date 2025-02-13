pub const Relation = enum {
    equal,
    sublist,
    superlist,
    unequal,
};

pub fn compare(list_one: []const i32, list_two: []const i32) Relation {
    if (list_one.len == list_two.len) {
        for (list_one, list_two) |x, y| {
            if (x != y) return .unequal;
        }
        return .equal;
    }
    if (list_one.len < list_two.len) {
        return  if (sublist(list_one, list_two)) .sublist 
                else .unequal;
    } else {
        return  if (sublist(list_two, list_one)) .superlist 
                else .unequal;
    }
}

fn sublist(min: []const i32, max: []const i32) bool {
    if (min.len == 0) return true;
    if (max.len <= min.len) return false;
    for (0..max.len - min.len + 1) |x| {
        var avoid_label = true;
        for (0..min.len) |y| {
            if (min[y] == max[x + y]) continue;
            avoid_label = false;
        }
        if (avoid_label) return true;
    }
    return false;
}