% 3 .Decode the phrase KSKBHXKDYRVTKRZTQE which was encoded using the key matrix A from the example on page 3.
%FVRMTGJTJJRMULSIRGBEMRNVFRC 
% Define a matrix
B = [3 10 20; 20 9 17; 9 4 17];



%B = [3 10 20; 20 9 17; 9 4 17];
encodedMessage = 'KSKBHXKDYRVTKRZTQE';

% Decode the message using the decodeHillCipher function
decodedMessage = decodeHillCipher(encodedMessage, B);

% Display the decoded message
disp('Decoded Message:');
disp(decodedMessage);


