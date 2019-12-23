function [u] = control_torque(t,P,x,control_method)
%CONTROL_LAW design the controller
%   passive: u = 0
%   PD controller
switch control_method
    case 'Passive_Control'
         u = Passive_Control(t,P,x);
    case 'PD_Control'
         u = PD_Control(t,P,x);
end
end

