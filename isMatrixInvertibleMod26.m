function isInvertible = isMatrixInvertibleMod26(matrix)
    % Calculate the determinant of the matrix
    detMatrix = round(det(matrix)); % Round to avoid floating point errors

    % Calculate the determinant modulo 26
    detMatrixMod26 = mod(detMatrix, 26);

    % Compute the GCD of the determinant modulo 26 and 26
    gcdValue = gcd(detMatrixMod26, 26);

    % The matrix is invertible if and only if the GCD is 1
    isInvertible = (gcdValue == 1);
end
