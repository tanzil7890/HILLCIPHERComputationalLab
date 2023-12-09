B = [4 9 15; 15 17 6; 24 0 17];

%Ques (d)

encodedMessage1 = 'FVRMTGJTJJRMULSIRGBEMRNVFRC';
decodedMessage = decodeHillCipher(encodedMessage1, B);
disp('Answer(d): Decoded Message FVRMTGJTJJRMULSIRGBEMRNVFRC');
disp(decodedMessage);

%------
% Ques c
% Compute its modular inverse
B_inv_mod = modularInverseMatrix(B);

% Display the result
disp('Answer (c): Modular Inverse of B:');
disp(B_inv_mod);


% Solution for B^-1*B
% Convert B_inv_mod to double for matrix multiplication
B_inv_mod_double = double(B_inv_mod);

% Calculate B_inv_mod * B under modulo 26
result = mod(B_inv_mod_double * B, 26);

% Display the result
disp('Result of B_inv_mod * B mod 26:');
disp(result)

%-------------
% Ques (a)
% Define the encoded message
encodedMessage = 'MARYHADALITTLELAMB';

encodedMessage = encodeHillCipher(encodedMessage, keyMatrix);

% Display the encoded message
disp('Answer (a): Encoded Message Ques (a):');
disp(encodedMessage);


%--------
% Ques (b.) Show that the matrix B is invertible. 
% Check if matrices are invertible modulo 26 and display results

disp("\n\n Question (b)")
checkAndDisplayInvertibility(B, 'B');


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

