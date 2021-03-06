function S = SetSystem
%  This function creates initial structure for objective and CCD
%  parameters.
%  All lengths are in [ mm ]
%  The origin of the coordinate system is in the center of the trap.
%

% Parameters of lens (from Mr. W�dka workshop):
S.D    = 12.4-2*0.14142;   % lens diametr. Set 15 instead of 12.5 (real aperture) is convenient for calculations
                        % 0.2 is th edge cut --> 0.14142 in diam. and length 
S.R(1)    = 10.3; % radius of lens curvature first lens
S.R(2)    = 10.3; % radius of lens curvature second lens
S.tc   = 1.975+0.14142;  % thickness of the lenses barrel - this parameter -
                 % is uniquely determined by the radius of curvature,
                 % diameter of the lens and thickness of the whole lens along
                 % optical axes & 1.8 by GD
S.g    = 4.01;  % thickness of the whole lens along optical axes
% Distances:
S.ld   = 15;   % Distance between center of the trap and  first diaphragm
S.R_dis_Ring = 29.68/2; % outer radius of electrode distancing ring
S.R_midl_El  = 29.64/2;  % outer radius of midle electrode of trap

S.l1   = 17;   % Distance between center of the trap and  first lens
%S.ll   = 37.4;   % Distance between lenses apex-apex + optical length in polarizer - small chamber
S.ll   = 37.4+1.3;   % Distance between lenses apex-apex + optical length in polarizer - big chamber
S.ld2  = 58.3 + S.l1; % 58.3 - distence from first lens to second diafragm  %76.6; % Distance to second diaphragm
% Wavelength of incident ray
S.lambda = 513; %lambda can has the structure of RGB lambda(1:3) = [R,G,B];
S.N  =   60;    % number of points per border side
% Effective lens aperture (diameter) % 11.8 suggested by GD
S.efD  = effective_aperture(S.D/2,S.tc,S.l1,S.lambda,25);
% First Diaphragm
S.dW   = 9;    % width of diaphragm
S.dH   = 4.27;    % height of diaphragm
% Second diaphragm
% S.RDph  = 1;   % Radius of aperture - small chamber
S.RDph  = 0.5;   % Radius of aperture - big chamber
S.W2    = 1;   % thickness of the diaphragm wall
% CCD parameters
S.lCCD = 82.8; % Distance to CCD detector
S.CCDPH = 480; % width of CCD [ Pix ]
S.CCDPW = 640; % height of CCD [Pix ]
S.PixSize = 7.4e-3; % Pixel size[ mm ] Pike
S.CCDH = S.CCDPH * S.PixSize;  % height of CCD
S.CCDW = S.CCDPW * S.PixSize;  % width  of CCD
% Droplet position 
S.Pk   = [0,0,0]; % Position of droplet relativ to the origin of coordinat system



