function V=velocity_turbulence(r,theta,time)
% r element of the blade, theta position of the blade

global u Mx My


index_z=1; % to be changed, depends on the time (which layer we take)
ut=zeros(32,32);
for i=1:32
    for j=1:32
        ut(i,j)=u(index_z,i,j);
    end
end

y=r*sin(theta);
x=r*cos(theta);

V=interp2(Mx,My,ut,x,y);



end
