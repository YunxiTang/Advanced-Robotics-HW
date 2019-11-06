function T = TransMatrix(theta,d,a,alpha)
% generate the transformation matrix for link

T = Rot('X',alpha)*Trans('X',a)*Rot('Z',theta)*Trans('Z',d);
end

