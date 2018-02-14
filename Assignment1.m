%% Assignment 1 %%

close all
clear all
clc

%% Read Blade Data %%
blade_data = xlsread('Blade_data') ;

%% Read airfoil Data %%
% cylinder = textread('airfoil_data/AirfoilPCdata/cylinder_ds.txt') ;
% FFA_W3_241 = textread('airfoil_data/AirfoilPCdata/FFA-W3-241_ds.txt');
% FFA_W3_301 = textread('airfoil_data/AirfoilPCdata/FFA-W3-301_ds.txt');
% FFA_W3_360 = textread('airfoil_data/AirfoilPCdata/FFA-W3-360_ds.txt');
% FFA_W3_480 = textread('airfoil_data/AirfoilPCdata/FFA-W3-480_ds.txt');
% FFA_W3_600 = textread('airfoil_data/AirfoilPCdata/FFA-W3-600_ds.txt');

%% Global parameters %%
H = 119 ; % hub height (m)
Ls = 7.1 ; % m
R = 89,17 ; % [m] Rotor radius
B = 3 ; % Number of blades
Pr = 10000*10^3 ; % [W] Rated Power
Vcut_in = 4 ; % [m/s] Cut in speed
Vcut_out = 25 ; % [m/s] Cut out speed
global omega V_0 rho k_emp
omega = 0,673 ; % [rad/s] Constant rotational speed
V_0 = 8 ; % [m/s] Constant wind speed
rho = 1,225 ; % [kg/m3] air mass density
k_emp = 0.6 ; % empirical value used to calculate W_intermediate


global Theta_pitch Theta_cone Theta_tilt Theta_yaw
Theta_pitch = 0 ; % [degre]
Theta_cone = 0 ; % [degre]
Theta_tilt = 0 ; % [degre]
Theta_yaw = 0 ; % [degre]

%% Initialization %%
V0y = 0 ;
V0z = V_0 ;
Wy(1) = 0 ;
Wz(1) = 0 ;
time(1) = 0 ;

% Wind position initialization
Theta_wing1(1) = 0 ; % blade 1
Theta_wing2(1) = Theta_wing1(1) + 2*pi/3 ; % blade 2
Theta_wing3(1) = Theta_wing1(1) + 4*pi/3 ; % blade 3

% Rotation matrix %
% considering no roll %
global a_12 a_21 a_34 a_43

a_12 = [cos(Theta_tilt) sin(Theta_yaw)*sin(Theta_tilt) -cos(Theta_yaw)*sin(Theta_tilt) ;
    0 cos(Theta_yaw) sin(Theta_yaw) ;
    sin(Theta_tilt) -sin(Theta_yaw)*cos(Theta_tilt) cos(Theta_yaw)*cos(Theta_tilt)] ;

a_21 = a_12' ;

a_34 = [cos(Theta_cone) 0 -sin(Theta_cone) ;
    0 1 0 ;
    sin(Theta_cone) 0 cos(Theta_cone)];

a_43 = a_34' ;

%
delta_t = 0.15 ; % [s]
N = 150 ; % [s]
N_element = length(blade_data) ;

%% Loop
for i=2:N+1
    i
    time(i) = time(i-1) + delta_t ;
    Theta_wing1(i) = Theta_wing1(i-1) + omega*delta_t ; % blade 1
    Theta_wing2(i) = Theta_wing1(i) + 2*pi/3 ; % blade 2
    Theta_wing3(i) = Theta_wing1(i) + 4*pi/3 ; % blade 3
    
    for j=1:B
        j
        for k=1:N_element
            k
            [Vrel_y, Vrel_z] = velocity_compute(j, blade_data(k), H, Ls, Wy(i-1), Wz(i-1), Theta_wing1(i), Theta_wing2(i), Theta_wing3(i) ) ;
            
            phi = atan(-Vrel_z/Vrel_y) ;
            alpha = phi - (blade_data(k,3) + Theta_pitch) ;
            
            % first method (doesn't take into account the dynamic stall 
            [Cl, Cd]=interpolation(k, alpha) ;
            % second method
                % calculate Cl_inv , fstatic, Cl_fs using interpolation
                % calculate tau = 4*c/Vrel
                % update fs(i) = fstatic + (fs(i-1)-fstatic)*exp(-delta_t/tau)
                % calculate Cl(i) = fs(i)* Cl,inv + (1-fs(i))*Cl,fs
            
            Vrel_abs = sqrt(Vrel_y^2+Vrel_z^2) ;
            Lift = 0.5*rho*Vrel_abs^2*Cl*blade_data(k,2) ;
            Drag = 0.5*rho*Vrel_abs^2*Cd*blade_data(k,2) ;
            pz(k) = Lift*cos(phi) + Drag*sin(phi) ;
            py(k) = Lift*sin(phi) - Drag*cos(phi) ;
            
            a = Wz(i-1)/V_0 ;
            if a<=1/3
                fg = 1 ;
            else
                fg = 1/4*(5-3*a) ;
            end
            
            % Prand
            f = (B/2)*(R-blade_data(k))/(blade_data(k)*abs(sin(phi)));
            F= 2*acos(exp(-f))/pi;
            
            % New Cl 
            
            % TO BE SOLVED : Wz_qs and Wy_qs depend on i and k right ?
            Wz_qs(i) = - B*Lift*cos(phi)/(4*pi*rho*blade_data(k)*F*(sqrt(V0y^2+(V0z+fg*Wz(i-1))))) ;
            Wy_qs(i) = - B*Lift*sin(phi)/(4*pi*rho*blade_data(k)*F*(sqrt(V0y^2+(V0z+fg*Wz(i-1))))) ;
            
            % W_qs(i) = Wz_qs(i) + Wy_qs(i)
            % tau1 = (1.1/(1-1.3*a))*(R/V_0)
            % tau2 = (0.39-0.26*(r/R)^2)*tau1
            % H = W_qs(i)+k_emp*tau1*(((W_qs(i)-W_qs(i-1)/delta_t)
            % Wint(i) = H + (Wint(i-1)-H)*exp(-delta_t/tau1)
            % W(i) = Wint(i) + (W(i-1)-Wint(i))*exp(-delta_t/tau2)
            
        end
        
    end
end
