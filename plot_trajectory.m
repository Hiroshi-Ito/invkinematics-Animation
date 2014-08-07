clear all
close all
%initialize
Pos.x = 72.0;
Pos.y = 0.0;
angles = [0, 0];

L1 = 26.0;
L2 = 46.0;


numer = sqrt( 4*L1^2*L2^2 - ((Pos.x^2 + Pos.y^2) - (L1^2 + L2^2))^2)
denom = 2*L1^2 + (Pos.x^2 + Pos.y^2) - (L1^2 + L2^2)
theta0 = atan(Pos.y/Pos.x) - atan(numer/denom);
theta1 = acos( (Pos.x^2 + Pos.y^2 - L1^2 - L2^2) / (2*L1*L2) );


x0 = 0;
y0 = 0;
x1 = L1*cos(theta0);
y1 = L1*sin(theta0);
x2 = x1 + L2*cos(theta0 + theta1);
y2 = y1 + L2*sin(theta0 + theta1);


figure;
axesHandle = gca;

xlim(axesHandle, [(0) (73)]);
ylim(axesHandle, [(-73) (73)]);

lineHandle1 = line([x1 x0],[y1 y0]); %link segments
lineHandle2 = line([x2 x1],[y2 y1]); %link segments
rectHandle0 = rectangle('Position',[x1-1 y1-1 2 2],  'Curvature',[1,1],'FaceColor','b');%link segment ends
rectHandle1 = rectangle('Position',[x2-1 y2-1 2 2],  'Curvature',[1,1],'FaceColor','g');%link segment ends

hold on
set(lineHandle1,'Color','b');   %line 1 color
set(lineHandle2,'Color','g');   %line 2 color
set(rectHandle0,'Position',[x1-1 y1-1 2 2]);
set(rectHandle1,'Position',[x2-1 y2-1 2 2]);

hold off

j = 52
axis equal
axis(axis)

for j=53:72
%while(1)
%    j = j+1;
    drawnow; %Forces MATLAB to render the snake
    
    Pos.x = j
    Pos.y = 0 
    %recalculate positions - 
    numer = sqrt( 4*L1^2*L2^2 - ((Pos.x^2 + Pos.y^2) - (L1^2 + L2^2))^2)
    denom = 2*L1^2 + (Pos.x^2 + Pos.y^2) - (L1^2 + L2^2)
    theta0 = atan(Pos.y/Pos.x) - atan(numer/denom);
    theta1 = acos( (Pos.x^2 + Pos.y^2 - L1^2 - L2^2) / (2*L1*L2) );

    x1 = L1*cos(theta0);
    y1 = L1*sin(theta0);
    x2 = x1 + L2*cos(theta0 + theta1);
    y2 = y1 + L2*sin(theta0 + theta1);

     
    %redraw links
    set(rectHandle0,'Position',[x1-1 y1-1 2 2]);
    set(rectHandle1,'Position',[x2-1 y2-1 2 2]);
     
    %redraw snake
    set(lineHandle1,'XData',[x1 x0],'YData',[y1 y0]);
    set(lineHandle2,'XData',[x2 x1],'YData',[y2 y1]);
     
    pause(0.1)
%    if j == 72
%        j = 53
%    end
end