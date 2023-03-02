function [R] = backtracking_descent()
    % given function
    syms x y;
    f = 16 * exp(-(x.^2)/2 - (y.^2)/2 - (x*y)/2 ) + 4 * exp(-(x + 1.5).^2 - (y + 2.5).^2);
    
    % starting position
    R = [-2 0];
    
    % symbolically find the gradient function
    del_x = gradient(f, x);
    del_y = gradient(f, y);
    
    % functions for evaluating the gradient at specific points
    eval_grad_x = (@(pos) double(subs((subs(del_x, x, pos(1))), y, pos(2))));
    eval_grad_y = (@(pos) double(subs((subs(del_y, x, pos(1))), y, pos(2))));
    eval_grad = (@(pos) ([eval_grad_x(pos), eval_grad_y(pos)]));
    
    % evaluate the objective function at a point
    eval_gain = @(pos) double(subs(subs(f, x, pos(1)), y, pos(2)));

    % gradient ascent with backtracking line search
    alpha = 0.0001; % threshold typically between [0,0.5]
    beta = 0.5; % scaler typically between [0,1) that sets the decay factor
    tolerance = 0.1; % when to stop optimizing near a critical point
    while(norm(eval_grad(R(end,:))) > tolerance)
        cur_pos = R(end,:);
        lambda = 1.0;
        % quadratic decay with respect to the gradient
        while(eval_gain(cur_pos + lambda*eval_grad(cur_pos)) < eval_gain(cur_pos) + alpha*lambda*norm(eval_grad(cur_pos)).^2)
            lambda = lambda*beta; % decay the step
        end
        new_loc = eval_grad(cur_pos)*lambda + cur_pos; 
        R = [R; new_loc(1) new_loc(2)];
    end

end


