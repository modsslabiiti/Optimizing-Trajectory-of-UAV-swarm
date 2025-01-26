
function output = apply(input,param)
   % DynamicSwish activation function
   % input: Input tensor
   % beta: Learnable parameter for Swish component
   % threshold: Threshold for switching to ReLU
   disp('Hello, this is a message from myFunction.');
    threshold=median(median(input));
   output = zeros(size(input));
   for i = 1:numel(input)
       if (input(i)) <= threshold
           output(i) = input(i).*sigmoid(i);
       else
            elliott_output = input(i) ./ (1 + abs(input(i)));
            % Scaled and shifted Gaussian activation
            scale = 0.5;  % Adjust the scale factor
            shift = 0.25; % Adjust the shift factor
            gaussian_output =  scale .* exp(-(i- shift).^2 / 2);
            % Combine using element-wise multiplication
            output(i) = elliott_output .* gaussian_output;
       end
    end
end
% function ell = elliott(input)
%     ell=input./ (1 + abs(input));
% end
function sig = sigmoid(x)
   sig = 1 ./ (1 + exp(-x*0.14));
end
