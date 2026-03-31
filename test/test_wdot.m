a = [1, 2, 3, 4, 5];
b = [2, 3, 4, 5, 6];
result = wdot(a, b);
disp(result);
expected = sum(a .* b);
assert(result == expected, 'wdot result does not match expected value');
disp('PASSED');
