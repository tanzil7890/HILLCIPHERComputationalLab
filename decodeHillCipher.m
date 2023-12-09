function decoded_message = decodeHillCipher(encodedMessage, keyMatrix)
    % Compute the modular inverse of the key matrix
    B_inv_mod = modularInverseMatrix(keyMatrix);

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

    % Convert B_inv_mod to double for matrix multiplication
    B_inv_mod_double = double(B_inv_mod);

    % Calculate B_inv_mod * C under modulo 26
    decoded_matrix = mod(B_inv_mod_double * C, 26);

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
end
