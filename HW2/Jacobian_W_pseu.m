function J_W_pseu = Jacobian_W_pseu(J)
% To compute the Weighted Pseudoinverse Matrix JW*
W = [4 0 0;0 1 0;0 0 1];
[U,S,V]=svd(J);
J_W_pseu = inv(W)*V*(S'*inv((S*V'*inv(W)*V*S')))*U';
end
