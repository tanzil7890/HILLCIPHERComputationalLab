%Question 1
% Define the mod26 function
mod26 = @(x) mod(x, 26);

% a. 17 + 24 mod 26
result_a = mod26(17 + 24);

% b. 20 × 5 mod 26
result_b = mod26(20 * 5);

% c. 7*[4; 12; 21] - 3*[14; 5; 16] mod 26
vector1 = [4; 12; 21];
vector2 = [14; 5; 16];
result_c = mod26(7 * vector1 - 3 * vector2);

% d. Matrix multiplication mod 26
matrix1 = [11 22 14; 7 9 21; 17 0 3];
matrix2 = [3 10 20; 20 9 17; 9 4 17];
result_d = mod26(matrix1 * matrix2);

% Display results
disp('Result a:');
disp(result_a);
disp('Result b:');
disp(result_b);
disp('Result c:');
disp(result_c);
disp('Result d:');
disp(result_d);