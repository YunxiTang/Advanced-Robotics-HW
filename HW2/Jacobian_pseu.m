function J_pseu = Jacobian_pseu(J)
% To compute the Pseudoinverse Matrix J*
[U,S,V]=svd(J);
J_pseu = V*(S'*inv(S*S'))*U';
end

