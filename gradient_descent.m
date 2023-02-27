function R = gradient_descent(grad, delta, lambda0, tolerance, n_max, r_0)
% Gradient descent algorithm
% Inputs:
%   grad: a function that computes the gradient of the objective function
%   delta: a scalar value that determines the step size for each iteration
%   lambda0: the initial step size
%   tolerance: the convergence tolerance for the norm of the gradient
%   n_max: the maximum number of iterations
%   r_0: the initial guess for the solution
% Outputs:
%   R: a matrix containing the sequence of solutions found by the algorithm

% Initialize variables
n = 0;
r_i = r_0;
grad_i = grad(r_i);
lambda = lambda0;
R = [r_0];

% Loop until convergence or maximum iterations
while n < n_max && norm(grad_i) > tolerance
    % Update the solution and gradient
    r_i = r_i + lambda * grad_i;
    R = [R; r_i];
    grad_i = grad(r_i);
    % Update the step size
    lambda = delta * lambda;
    % Update the iteration counter
    n = n + 1;
end

end
