
% Define a matrix
B = [3 10 20; 20 9 17; 9 4 17];

% Compute its modular inverse
B_inv_mod = modularInverseMatrix(B);

% Display the result
disp('Modular Inverse of B:');
disp(B_inv_mod);


% Solution for A^-1*A
% Convert B_inv_mod to double for matrix multiplication
B_inv_mod_double = double(B_inv_mod);

% Calculate B_inv_mod * B under modulo 26
result = mod(B_inv_mod_double * B, 26);

% Display the result
disp('Result of B_inv_mod * B mod 26:');
disp(result);

%-------------------------------------
% Define the encoded message
encodedMessage = 'KSKBHXKDYRVTKRZTQE';

% Convert the message to uppercase (if not already)
encodedMessage = upper(encodedMessage);

% Preallocate the matrix C
numLetters = length(encodedMessage);
C = zeros(3, ceil(numLetters / 3));

% Fill the matrix C with numeric values
for i = 1:numLetters
    % Convert character to its numeric value (A=0, B=1, ..., Z=25)
    numericValue = encodedMessage(i) - 'A';
    
    % Determine the column and row in C to place the numeric value
    col = ceil(i / 3);
    row = mod(i-1, 3) + 1;

    % Assign the numeric value to the matrix C
    C(row, col) = numericValue;
end

% Display the coded message matrix C
disp('Coded Message Matrix C:');
disp(C);



%-------------------------
% Solution for B^-1*C
% Convert B_inv_mod to double for matrix multiplication
B_inv_mod_double = double(B_inv_mod);

% Calculate B_inv_mod * B under modulo 26
decoded_matrix = mod(B_inv_mod_double * C, 26);

% Display the result
disp('Result of B_inv_mod * B mod 26:');
disp(decoded_matrix);


%-----------------

% Reshape the matrix into a single row
decoded_numeric = reshape(decoded_matrix, 1, []);

% Initialize an empty string for the decoded message
decoded_message = '';

% Convert each numeric value back to a character
for i = 1:length(decoded_numeric)
    % Convert number to letter (0=A, 1=B, ..., 25=Z)
    letter = char(decoded_numeric(i) + 'A');
    % Append the letter to the decoded message
    decoded_message = [decoded_message letter];
end

% Display the decoded message
disp('Decoded Message:');
disp(decoded_message);
