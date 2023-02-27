function lambda = backtracking_line_search(f, grad, r_i, alpha, beta)
% Backtracking line search algorithm
% Inputs:
%   f: the objective function
%   grad: a function that computes the gradient of the objective function
%   r_i: the current solution
%   alpha: a parameter for controlling the sufficient decrease condition
%   beta: a parameter for controlling the step size reduction
% Output:
%   lambda: the step size for the current iteration

% Initialize variables
lambda = 1;
sufficient_decrease = false;

% Loop until a sufficient decrease in the function value is found
while ~sufficient_decrease
    % Compute the next solution candidate
    r_next = r_i + lambda * grad(r_i);
    % Check if the candidate satisfies the sufficient decrease condition
    if f(r_next) <= f(r_i) + alpha * lambda * norm(grad(r_i))^2
        sufficient_decrease = true;
    else
        % Reduce the step size and try again
        lambda = beta * lambda;
    end
end

end