A=[11 20 20; 2 1 24; 9 3 3];

%Ques (d)

encodedMessage1 = 'IWGEJLFWRBUEUOWBHPZMLMXNXUBOEUAHG';
decodedMessage = decodeHillCipher(encodedMessage1, A);
disp('Answer(d): Decoded Message IWGEJLFWRBUEUOWBHPZMLMXNXUBOEUAHG');
disp(decodedMessage);

%------
% Ques c
% Compute its modular inverse
A_inv_mod = modularInverseMatrix(A);

% Display the result
disp('Answer (c): Modular Inverse of A:');
disp(A_inv_mod);


% Solution for A^-1*A
% Convert A_inv_mod to double for matrix multiplication
A_inv_mod_double = double(A_inv_mod);

% Calculate A_inv_mod * A under modulo 26
result = mod(A_inv_mod_double * A, 26);

% Display the result
disp('Result of A_inv_mod * A mod 26:');
disp(result)

%-------------
% Ques (a)
% Define the encoded message
encodedMessage = 'RED SKY AT NIGHT';

encodedMessage = encodeHillCipher(encodedMessage, keyMatrix);

% Display the encoded message
disp('Answer (a): Encoded Message Ques (a):');
disp(encodedMessage);


%--------
% Ques (b.) Show that the matrix B is invertible. 
% Check if matrices are invertible modulo 26 and display results

disp("\n\n Question (b)")
checkAndDisplayInvertibility(A, 'A');


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



%--------------------------------------------------------------

