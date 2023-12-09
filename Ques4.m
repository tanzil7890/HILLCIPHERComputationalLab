% Main script code
% Define the matrices
A = [11 20 20; 2 1 24; 9 3 3];
B = [2 5 0; 22 9 4; 17 21 8];
C = [3 1 24; 20 11 25; 12 4 19];

% Check if matrices are invertible modulo 26 and display results
checkAndDisplayInvertibility(A, 'A');
checkAndDisplayInvertibility(B, 'B');
checkAndDisplayInvertibility(C, 'C');

% Local function to check invertibility and display result
function checkAndDisplayInvertibility(matrix, matrixName)
    if isMatrixInvertibleMod26(matrix)
        fprintf('Matrix %s is invertible modulo 26: True\n', matrixName);
    else
        fprintf('Matrix %s is invertible modulo 26: False\n', matrixName);
    end
end

% Local function definition
function isInvertible = isMatrixInvertibleMod26(matrix)
    detMatrix = round(det(matrix)); % Calculate the determinant
    detMatrixMod26 = mod(detMatrix, 26); % Modulo 26 of the determinant
    gcdValue = gcd(detMatrixMod26, 26); % GCD of the determinant modulo 26 and 26
    isInvertible = (gcdValue == 1); % The matrix is invertible if gcd is 1
end
