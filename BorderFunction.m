function [ X Y ] = BorderFunction( PkX,PkY,PkZ,shX,shY,lCCD )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

handles.S=SetSystem;

handles.S.Pk(1)=PkX;
handles.S.Pk(2)=PkY;
handles.S.Pk(3)=PkZ;
handles.shX=shX;
handles.shY=shY;
handles.S.lCCD=lCCD;

Br = zeros(4*handles.S.N,3);       % vector of border points
% calculation of position for the 4 outer points
alpha = asin(handles.S.dW/2/handles.S.R_midl_El);
[X(1),Y(1)] = pol2cart(alpha,handles.S.R_midl_El);
[X(2),Y(2)] = pol2cart(-alpha,handles.S.R_midl_El);
Z(1) = -handles.S.dH/2;
Z(2) = handles.S.dH/2;
P(1,:) = [X(1),Y(1),Z(1)];
P(2,:) = [X(1),Y(1),Z(2)];
P(3,:) = [X(2),Y(2),Z(2)];
P(4,:) = [X(2),Y(2),Z(1)];

V = P(4,:) - handles.S.Pk; % left (or right) border
V = V/norm(V);
A = V(1)^2 + V(2)^2;
B = 2*(V(1)*handles.S.Pk(1)+V(2)*handles.S.Pk(2));
C = handles.S.Pk(1)^2 + handles.S.Pk(2)^2 - (handles.S.R_dis_Ring)^2;
D = B^2-4*A*C;
t = (-B+sqrt(D) )/2/A;
P(5,:) = [ handles.S.Pk(1)+V(1)*t handles.S.Pk(2)+V(2)*t -handles.S.dH/2];

V = P(1,:) - handles.S.Pk; % left (or right) border
V = V/norm(V);
A = V(1)^2 + V(2)^2;
B = 2*(V(1)*handles.S.Pk(1)+V(2)*handles.S.Pk(2));
C = handles.S.Pk(1)^2 + handles.S.Pk(2)^2 - (handles.S.R_dis_Ring)^2;
D = B^2-4*A*C;
t = (-B+sqrt(D) )/2/A;
P(6,:) = [ handles.S.Pk(1)+V(1)*t handles.S.Pk(2)+V(2)*t -handles.S.dH/2];

P(7,1:2) = P(6,1:2);
P(7,3)   = handles.S.dH/2;

P(8,1:2) = P(5,1:2);
P(8,3)   = handles.S.dH/2;
%
Br(1:handles.S.N,1) = ones(1,handles.S.N)*P(1,1);
Br(1:handles.S.N,2) = ones(1,handles.S.N)*P(1,2);
Br(1:handles.S.N,3) = linspace(P(2,3),P(1,3),handles.S.N);
V1 = P(6,:); % directing vector from origin to point 6
V2 = P(5,:); % directing vector from origin to point 5
Bt1 = acos( dot( V1(1:2) ,[1,0])/norm( V1(1:2) ));
Bt2 = acos( dot(V2(1:2),[1,0])/norm(V2(1:2)));
VBt = linspace(Bt1,-Bt2,handles.S.N);
%
[X,Y] = pol2cart(VBt,handles.S.R_dis_Ring);

Br((handles.S.N+1):2*handles.S.N,1) = X;
Br((handles.S.N+1):2*handles.S.N,2) = Y;
Br((handles.S.N+1):2*handles.S.N,3) = -ones(1,handles.S.N)*handles.S.dH/2;

Br((2*handles.S.N+1):3*handles.S.N,1) = ones(1,handles.S.N)*P(4,1);
Br((2*handles.S.N+1):3*handles.S.N,2) = ones(1,handles.S.N)*P(4,2);
Br((2*handles.S.N+1):3*handles.S.N,3) = linspace(P(4,3),P(3,3),handles.S.N);

VBt = linspace(-Bt2,Bt1,handles.S.N);
%
[X,Y] = pol2cart(VBt,handles.S.R_dis_Ring);
Br((3*handles.S.N+1):4*handles.S.N,1) = X;
Br((3*handles.S.N+1):4*handles.S.N,2) = Y;
Br((3*handles.S.N+1):4*handles.S.N,3) = ones(1,handles.S.N)*handles.S.dH/2;

handles.Br=Br;

for i = 1:size(handles.Br,1)
       Pd = [ handles.Br(i,1), handles.Br(i,2), handles.Br(i,3) ]; % Points on the diaphragm plane 
       P = RayTracing(Pd,handles.S);
%              if size(P,1) == 7
                 W1(i) = P(7,2);
                 Hi1(i) = P(7,3);
%              else 
              % Terminate the rays that don't hit the CCD element   
%                  W1(i) = NaN;
%                  Hi1(i) = NaN;
%              end
 end
% Recalculation meters to pixels
% shifting the  origin to middle of the image.
% The center of image isn't placed  on [0,0] point, but on [240,320] point
 handles.R1(1,:) = (handles.S.CCDW/2 + W1)/handles.S.PixSize;  % [ Pix ]
 handles.R1(2,:) = (handles.S.CCDH/2 + Hi1)/handles.S.PixSize; % [ Pix ]
  

X = handles.R1(1,:) +  handles.shX;
Y = handles.R1(2,:) + handles.shY;

end
