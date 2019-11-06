function qc = qc_generate(t)
%   Generate the qc command
    % freqency(Hz)
    f = 1;
    qc = ones(6,1);
    qc(2) = deg2rad(45)*sin(2*pi*f*t);
    qc(5) = deg2rad(45)*sin(2*pi*f*t);
    qc(1) = 0.2*sin(2*pi*f*t);
    qc(6) = 0.2*sin(2*pi*f*t);
    qc(3) = deg2rad(0);
    qc(4) = deg2rad(0);
end

