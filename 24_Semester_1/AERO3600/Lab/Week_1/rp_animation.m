%% This function produces an animation of the furuta pendulum system.

%{

This function was created by Dr Alejandro Donaire
(version 11 April 2022)

To produce the animation, the function requires the simulation variables:

'time' is the simulation time
'q1' is the angle of the arm
'q2' is the angle of the pendulum from downward rest position
Suggestion: For time sample 1/500, use pause(0.03)
For a different time sample, adjust the pause accordingly.

If you do not have the image aero3600_logo.jpg, you can comment the two
consecutive lines starting with 'image_logo = ...' and surf(... 

%}

function [] = rp_animation(ts,q1s,q2s)

disp('Animation started')

t = 0:0.005:ts(end);
q1 = interp1(ts,q1s,t);
q2 = interp1(ts,q2s,t);

%% set axis and figure
f = figure('Visible', 'off');
myaxes = axes(f);
view([1,1,0.4]);
grid on;
axis equal;
hold on;
xlim([-6 6]);
ylim([-6 6]);
zlim([-4 4]);
myaxes.XTickMode='manual';
myaxes.YTickMode='manual';
myaxes.ZTickMode='manual';
myaxes.XTick=[];
myaxes.YTick=[];
myaxes.ZTick=[];
myaxes.Box='on';

%% Generate cylinder and ellipsoid shapes

[xcy,ycy,zcy]=cylinder([0.2 0.2],100);
[xel,yel,zel] = ellipsoid(0,0,0,0.2,0.2,0.2,100);

%% Create (handles) Furuta pendulum elements from shapes

% arm
harm(1) = surface(zcy*4.2,xcy*0.7,ycy*0.7,'FaceColor',[0.7 0.7 0.7],'EdgeColor','none','FaceLighting','gouraud' );
harm(2) = surface(xel*0.2+4.2,yel*0.7,zel*0.7,'FaceColor',[0.7 0.7 0.7],'EdgeColor','none','FaceLighting','gouraud');

% Encoder
harm(3) = surface((zcy-0.5)*1.2,xcy*2.5,ycy*2.5,'FaceColor',[0.6 0 0.2],'EdgeColor','none','FaceLighting','gouraud');
harm(4) = surface(xel*0.5-0.5*1.2,yel*2.5,zel*2.5,'FaceColor',[0.6 0 0.2],'EdgeColor','none','FaceLighting','gouraud');
harm(5) = surface(xel*0.5+0.5*1.2,yel*2.5,zel*2.5,'FaceColor',[0.6 0 0.2],'EdgeColor','none','FaceLighting','gouraud');

% Pendulum
hpen(1) = surface(xcy*0.8+4,ycy*0.8,-zcy*4+0.3,'FaceColor',[0.6 0 0.2],'EdgeColor','none','FaceLighting','gouraud');
hpen(2) = surface(xel*0.7+4,yel*0.7,zel*0.2+0.3,'FaceColor',[0.6 0 0.2],'EdgeColor','none','FaceLighting','gouraud');
hpen(3) = surface(xel*0.7+4,yel*0.7,zel*0.2-3.7,'FaceColor',[0.6 0 0.2],'EdgeColor','none','FaceLighting','gouraud');


% base
vert = [2 2 -0.7;2 -2 -0.7;-2 -2 -0.7;-2 2 -0.7;-2 2 -4;-2 -2 -4;2 -2 -4;2 2 -4];
fac  = [1 2 3 4;1 2 7 8;1 4 5 8;3 4 5 6;2 3 6 7;5 6 7 8];
hb = patch('Vertices',vert,'Faces',fac,'FaceColor',[0.1 0.1 0.1],'FaceLighting','gouraud');
image_logo=imread('aero3600_Logo.jpg');
surf([2 2;2 2],[-2 2;-2 2],[-0.7 -0.7;-4 -4], image_logo,'FaceColor', 'texturemap','EdgeColor', 'none');
vert = [2 2 -1;2 -2 -1;-2 -2 -1;-2 2 -1;-2 2 -1.2;-2 -2 -1.2;2 -2 -1.2;2 2 -1.2];
fac  = [1 2 3 4;1 2 7 8;1 4 5 8;3 4 5 6;2 3 6 7;5 6 7 8];
patch('Vertices',vert,'Faces',fac,'FaceColor',[0.2 0.7 0.5],'FaceLighting','gouraud');
vert = [2 2 -3.5;2 -2 -3.5;-2 -2 -3.5;-2 2 -3.5;-2 2 -3.7;-2 -2 -3.7;2 -2 -3.7;2 2 -3.7];
fac  = [1 2 3 4;1 2 7 8;1 4 5 8;3 4 5 6;2 3 6 7;5 6 7 8];
patch('Vertices',vert,'Faces',fac,'FaceColor',[0.7 0.2 0.2],'FaceLighting','gouraud');
hbf  = surface(xcy*2,ycy*2,-zcy,'FaceColor',[0.7 0.7 0.7],'EdgeColor','none','FaceLighting','gouraud');
plot3(myaxes,[0 1.5],[0 0],[-0.7 -0.7],'Color','w','LineWidth',2)
plot3(myaxes,[0 0],[-1.5 1.5],[-0.7 -0.7],'Color','w','LineWidth',2)
ac=(0:1:180)*pi/180;
xc=1.5*sin(ac);
yc=1.5*cos(ac);
zc=-0.7*ones(1,length(ac));
plot3(myaxes,xc,yc,zc,'Color','w','LineWidth',2)

%% Light effects

l1 = light;
l1.Position = [-3,3,3]*4;
l1.Style = 'infinite';
l1.Color = [0.9 0.9 0.9];
 
l2 = light;
l2.Position = [-4 1 1]*4;
l2.Style = 'infinite';
l2.Color = [0.9 0.9 0.9];

l3 = light;
l3.Position = [3,-3,3]*4;
l3.Style = 'infinite';
l3.Color = [0.9 0.9 0.9];

hb.AmbientStrength = 0.2;
hb.DiffuseStrength = 0.7; 
hb.BackFaceLighting = 'lit';
 
hb.SpecularStrength = 0.5;
hb.SpecularColorReflectance = 0.3;
hb.SpecularExponent = 4;
hb.EdgeLighting = 'gouraud';

hbf.AmbientStrength = 0.2;
hbf.DiffuseStrength = 0.2; 
hbf.BackFaceLighting = 'lit';
 
hbf.SpecularStrength = 0.5;
hbf.SpecularColorReflectance = .2;
hbf.SpecularExponent = 10;

%% Combine objects and create animation using hgtransform

combinedobjarm = hgtransform('parent',myaxes);
set(harm,'parent',combinedobjarm);

combinedobjpen = hgtransform('parent',myaxes);
set(hpen,'parent',combinedobjpen);

w=0;
time=sprintf('Time %0.1f sec',t(1));
xlabel(time,'BackgroundColor',[1 1 1],'EdgeColor','k','FontSize',18);

try

while w==0

rotationarm = makehgtform('zrotate',q1(1));
rotationpen = makehgtform('xrotate',q2(1));

set(combinedobjarm,'matrix',rotationarm);
set(combinedobjpen,'matrix',rotationarm*rotationpen);

time=sprintf('Time %0.1f sec',t(1));
xlabel(time,'BackgroundColor',[1 1 1],'EdgeColor','k','FontSize',18);
  
f.Visible='on';

click_play = title('Click on the Figure to play the animation', 'FontSize',14);
waitforbuttonpress
delete(click_play);

for i = 1:10:length(q1)

    rotationarm = makehgtform('zrotate',q1(i)); 
    rotationpen = makehgtform('xrotate',q2(i));
    
    set(combinedobjarm,'matrix',rotationarm);
    set(combinedobjpen,'matrix',rotationarm*rotationpen);
    
    time=sprintf('Time %0.1f sec',t(i));
    xlabel(time,'BackgroundColor',[1 1 1],'EdgeColor','k','FontSize',18);

    pause(0.03);

end

click_replay = title('Click on the Figure to replay the animation', 'FontSize',14);
w=waitforbuttonpress;
delete(click_replay);

end

catch
    disp('Animation ended')
end

end