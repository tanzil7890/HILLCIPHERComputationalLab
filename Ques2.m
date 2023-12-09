
%A = [3 10 20; 20 9 17; 9 4 17];

% Define the key matrix and the message
A = [3 10 20; 20 9 17; 9 4 17];
message = 'BUY TEN SHARES TOMORROW';

% Encode the message using the encodeHillCipher function
encodedMessage = encodeHillCipher(message, A);

% Display the encoded message
disp('Encoded Message:');
disp(encodedMessage);




