function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = length(theta)
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
temp = X*theta;
answer = sigmoid(temp);
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

for i = 1:m
     J = J + ((-y(i))*log(answer(i)) - (1-y(i))*log(1-answer(i)));
end

J = J/m;

for i = 2:n
    J = J + (lambda)*(theta(i,1)^2)/(2*m);
end


for j = 1:m
    grad(1,1) = grad(1,1) + (answer(j)-y(j))*X(j,1);
end
grad(1,1) = grad(1,1)/m;


for i = 2:size(theta)
    sum = 0;
    for j = 1:m
        sum = sum + (answer(j)-y(j))*X(j,i); 
    end
    grad(i,1) = sum + (lambda)*(theta(i,1));
    grad(i,1) = grad(i,1)/m;
end



% =============================================================

end
