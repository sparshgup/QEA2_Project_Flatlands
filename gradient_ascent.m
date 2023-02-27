function R = gradient_ascent(f, grad, alpha, beta, tolerance, n_max, r_0)
% Gradient ascent algorithm with backtracking line search
% Inputs:
%   f: the objective function
%   grad: a function that computes the gradient of the objective function
%   alpha: a parameter for controlling the sufficient decrease condition in the line search
%   beta: a parameter for controlling the step size reduction in the line search
%   tolerance: the convergence tolerance for the norm of the gradient
%   n_max: the maximum number of iterations
%   r_0: the initial guess for the solution
% Outputs:
%   R: a matrix containing the sequence of solutions found by the algorithm

% Initialize variables
n = 0;
r_i = r_0;
grad_i = grad(r_i);
R = [r_0];

% Loop until convergence or maximum iterations
while n < n_max && norm(grad_i) > tolerance
    % Compute the step size using backtracking line search
    lambda = backtracking_line_search(f, grad, r_i, alpha, beta);
    % Update the solution and gradient
    r_i = r_i + lambda * grad_i;
    R = [R; r_i];
    grad_i = grad(r_i);
    % Update the iteration counter
    n = n + 1;
end

end
