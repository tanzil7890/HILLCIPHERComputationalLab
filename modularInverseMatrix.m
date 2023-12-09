function A_inv_mod = modularInverseMatrix(A)
    % Ensure the matrix A is square
    if size(A, 1) ~= size(A, 2)
        error('Matrix must be square');
    end

    % Calculate the determinant of A and ensure it's an integer
    detA = round(det(A)); % Round to the nearest integer to avoid floating point errors
    detA_mod = mod(detA, 26);

    % Find the modular multiplicative inverse of the determinant
    detA_inv = modInverse(detA_mod, 26);

    % Return an error if the matrix is not invertible
    if detA_inv == -1
        error('Matrix is not invertible under modulo 26');
    end

    % Calculate the adjugate of A
    adjA = adjointMatrix(A);

    % Calculate the modular inverse of A
    A_inv_mod = int32(mod(detA_inv * adjA, 26));
end

% ... (rest of the functions remain the same)


function adjA = adjointMatrix(A)
    % Calculate the cofactor matrix
    cofactorMatrix = zeros(size(A));
    for row = 1:size(A, 1)
        for col = 1:size(A, 2)
            minor = A;
            minor(row, :) = [];
            minor(:, col) = [];
            cofactorMatrix(row, col) = (-1)^(row + col) * det(minor);
        end
    end
    % Transpose the cofactor matrix to get the adjugate
    adjA = cofactorMatrix';
end

function inv = modInverse(a, m)
    % Find modular multiplicative inverse of a under modulo m
    [g, x, ~] = gcd(a, m);
    if g ~= 1
        inv = -1; % Modular inverse does not exist
    else
        inv = mod(x, m);
    end
end
