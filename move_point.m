% moves between two points by first rotating and then moving in a straight line
function [target_angle, cord2] = move_point(cur_angle, cord1, cord2, sensors, vels)
    MAX_SPEED = 0.3; 
    WHEEL_BASE = 0.245; 

    % rotate to angle 
    target_angle = atan((cord2(2)-cord1(2)) / (cord2(1) - cord1(1)));
    if(cord2(1) < cord1(1))
        target_angle = target_angle + pi;
    end
    target_angle * (180 / pi)
    omega_vel = (MAX_SPEED * 2) / WHEEL_BASE;
    rotation_time = abs(cur_angle - target_angle) / omega_vel;

    tic; 
    while(toc < rotation_time)
        if(target_angle > cur_angle) 
           vels.lrWheelVelocitiesInMetersPerSecond = [-0.3, 0.3];
        else
            vels.lrWheelVelocitiesInMetersPerSecond = [0.3, -0.3];
        end
    end

    % move!!
    target_distance = sqrt(((cord1(1) - cord2(1)) .^ 2) + ((cord1(2) - cord2(2)) .^ 2));
    drive_time = target_distance / MAX_SPEED;
    tic; 
    while(toc < drive_time)
        vels.lrWheelVelocitiesInMetersPerSecond = [0.3, 0.3];
    end

    vels.lrWheelVelocitiesInMetersPerSecond = [0, 0];
end