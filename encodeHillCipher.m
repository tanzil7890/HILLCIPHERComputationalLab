function encoded_message = encodeHillCipher(message, keyMatrix)
    % Convert the message to uppercase (if not already)
    message = upper(message);

    % Remove spaces from the message
    message = message(message ~= ' ');

    % Preallocate the matrix C
    numLetters = length(message);
    C = zeros(3, ceil(numLetters / 3));

    % Fill the matrix C with numeric values
    for i = 1:numLetters
        % Convert character to its numeric value (A=0, B=1, ..., Z=25)
        numericValue = message(i) - 'A';

        % Determine the column and row in C to place the numeric value
        col = ceil(i / 3);
        row = mod(i-1, 3) + 1;

        % Assign the numeric value to the matrix C
        C(row, col) = numericValue;
    end

    % Encode the message using the key matrix
    encoded_matrix = mod(keyMatrix * C, 26);

    % Reshape the matrix into a single row
    encoded_numeric = reshape(encoded_matrix, 1, []);

    % Initialize an empty string for the encoded message
    encoded_message = '';

    % Convert each numeric value back to a character
    for i = 1:length(encoded_numeric)
        % Convert number to letter (0=A, 1=B, ..., 25=Z)
        letter = char(encoded_numeric(i) + 'A');
        % Append the letter to the encoded message
        encoded_message = [encoded_message letter];
    end
end
