%% This function produces an animation of the aero system.

%{

This function was created by Dr Alejandro Donaire
(version 11 April 2022)

To produce the animation, the function requires the simulation variables:

'time' is the simulation time
'q1' is the pitch angle of the system
'q2' is the yaw angle of the system
Suggestion: For time sample 1/500, use pause(0.04)
For a different time sample, adjust the pause accordingly.

If you do not have the image aero3600_logo.jpg, you can comment the two
consecutive lines starting with 'image_logo = ...' and surf(... 

%}

function [] = aero_animation(ts,q1s,q2s)

disp('Animation started')

t = 0:0.002:ts(end);
q1 = interp1(ts,q1s,t);
q2 = interp1(ts,q2s,t);


disp('Animation started')

%% set axis and figure
f = figure('Visible', 'off');
myaxes = axes(f);
view([-1,1,0.4]);
grid on;
axis equal;
hold on;
xlim([-5 5]);
ylim([-5 6]);
zlim([-2 7]);
myaxes.XTickMode='manual';
myaxes.YTickMode='manual';
myaxes.ZTickMode='manual';
myaxes.XTick=[];
myaxes.YTick=[];
myaxes.ZTick=[];
myaxes.Box='on';

%% Generate cylinder and ellipsoid shapes

[xcy,ycy,zcy]=cylinder([1 1],100);
[xsp,ysp,zsp]=sphere(100);
[xel,yel,zel] = ellipsoid(0,0,0,1,1,1,100);

%% Create (handles) aero system elements from shapes

% Structure yaw
hyaw(1) = surface(xcy*0.2+1,ycy*0.2,zcy*3,'FaceColor',[0.1 0.1 0.1],'EdgeColor','none','FaceLighting','gouraud' );
hyaw(2) = surface(xcy*0.2-1,ycy*0.2,zcy*3,'FaceColor',[0.1 0.1 0.1],'EdgeColor','none','FaceLighting','gouraud' );
hyaw(3) = surface(zcy*2-1,ycy*0.2,xcy*0.2,'FaceColor',[0.1 0.1 0.1],'EdgeColor','none','FaceLighting','gouraud' );
hyaw(4) = surface(xsp*0.2-1,ysp*0.2,zsp*0.2,'FaceColor',[0.1 0.1 0.1],'EdgeColor','none','FaceLighting','gouraud' );
hyaw(5) = surface(xsp*0.2+1,ysp*0.2,zsp*0.2,'FaceColor',[0.1 0.1 0.1],'EdgeColor','none','FaceLighting','gouraud' );
hyaw(6) = surface(xsp*0.3+1,ysp*0.3,zsp*0.3+3,'FaceColor',[0.6 0 0.2],'EdgeColor','none','FaceLighting','gouraud' );
hyaw(7) = surface(xsp*0.3-1,ysp*0.3,zsp*0.3+3,'FaceColor',[0.6 0 0.2],'EdgeColor','none','FaceLighting','gouraud' );

% Structure pitch
hpitch(1) = surface(zcy*2-1,ycy*0.2,xcy*0.2,'FaceColor',[0.7 0.7 0.7],'EdgeColor','none','FaceLighting','gouraud');
hpitch(2) = surface(xcy*0.2,zcy*4-2,ycy*0.2,'FaceColor',[0.7 0.7 0.7],'EdgeColor','none','FaceLighting','gouraud');
hpitch(3) = surface(xcy*1,ycy*1+3,zcy*0.25,'FaceColor',[0.6 0 0.2],'EdgeColor','none','FaceLighting','gouraud');
hpitch(4) = surface(zcy*0.25,ycy*1-3,xcy*1,'FaceColor',[0.6 0 0.2],'EdgeColor','none','FaceLighting','gouraud');
hpitch(5) = surface(xcy*1,ycy*1+3,zcy*0.25-0.25,'FaceColor',[0.1 0.1 0.1],'EdgeColor','none','FaceLighting','gouraud');
hpitch(6) = surface(zcy*0.25-0.25,ycy*1-3,xcy*1,'FaceColor',[0.1 0.1 0.1],'EdgeColor','none','FaceLighting','gouraud');

% Thrusters
hth1(1) = surface(xel*0.5+0.5,yel*0.15,zel*0.05,'FaceColor',[0.5 0.5 0.5],'EdgeColor','none','FaceLighting','gouraud');
hth1(2) = surface(xel*0.5-0.5,yel*0.15,zel*0.05,'FaceColor',[0.5 0.5 0.5],'EdgeColor','none','FaceLighting','gouraud');
hth1(3) = surface(xel*0.15,yel*0.5-0.5,zel*0.05,'FaceColor',[0.5 0.5 0.5],'EdgeColor','none','FaceLighting','gouraud');
hth1(4) = surface(xel*0.15,yel*0.5+0.5,zel*0.05,'FaceColor',[0.5 0.5 0.5],'EdgeColor','none','FaceLighting','gouraud');

hth2(1) = surface(xel*0.05,yel*0.5-0.5,zel*0.15,'FaceColor',[0.5 0.5 0.5],'EdgeColor','none','FaceLighting','gouraud');
hth2(2) = surface(xel*0.05,yel*0.5+0.5,zel*0.15,'FaceColor',[0.5 0.5 0.5],'EdgeColor','none','FaceLighting','gouraud');
hth2(3) = surface(xel*0.05,yel*0.15,zel*0.5+0.5,'FaceColor',[0.5 0.5 0.5],'EdgeColor','none','FaceLighting','gouraud');
hth2(4) = surface(xel*0.05,yel*0.15,zel*0.5-0.5,'FaceColor',[0.5 0.5 0.5],'EdgeColor','none','FaceLighting','gouraud');

% base
vert = [2 2 -0.5;2 -2 -0.5;-2 -2 -0.5;-2 2 -0.5;-2 2 -1.8;-2 -2 -1.8;2 -2 -1.8;2 2 -1.8];
fac  = [1 2 3 4;1 2 7 8;1 4 5 8;3 4 5 6;2 3 6 7;5 6 7 8];
hb   = patch('Vertices',vert,'Faces',fac,'FaceColor','black','FaceLighting','gouraud');
image_logo=imread('aero3600_Logo.jpg');
surf([1.5 -1.5;1.5 -1.5],[2 2;2 2],[-0.5 -0.5;-1.8 -1.8], image_logo,'FaceColor', 'texturemap','EdgeColor', 'none');
vert = [2 2 -0.6;2 -2 -0.6;-2 -2 -0.6;-2 2 -0.6;-2 2 -0.7;-2 -2 -0.7;2 -2 -0.7;2 2 -0.7];
fac  = [1 2 3 4;1 2 7 8;1 4 5 8;3 4 5 6;2 3 6 7;5 6 7 8];
patch('Vertices',vert,'Faces',fac,'FaceColor',[0.2 0.7 0.5],'FaceLighting','gouraud');
vert = [2 2 -1.6;2 -2 -1.6;-2 -2 -1.6;-2 2 -1.6;-2 2 -1.7;-2 -2 -1.7;2 -2 -1.7;2 2 -1.7];
fac  = [1 2 3 4;1 2 7 8;1 4 5 8;3 4 5 6;2 3 6 7;5 6 7 8];
patch('Vertices',vert,'Faces',fac,'FaceColor',[0.7 0.2 0.2],'FaceLighting','gouraud');
hbf  = surface(xcy*0.2,ycy*0.2,-zcy*0.5,'FaceColor',[0.7 0.7 0.7],'EdgeColor','none','FaceLighting','gouraud');
plot3(myaxes,[-1.5 -1.3],[0 0],[-0.5 -0.5],'Color','w','LineWidth',2)
plot3(myaxes,[1.5 1.3],[0 0],[-0.5 -0.5],'Color','w','LineWidth',2)
plot3(myaxes,[0 0],[-1.5 -1.3],[-0.5 -0.5],'Color','w','LineWidth',2)
plot3(myaxes,[0 0],[0.9 1.5],[-0.5 -0.5],'Color',[0.3 0.7 0.9],'LineWidth',2)
ac=(-180:1:180)*pi/180;
xc=1.5*sin(ac);
yc=1.5*cos(ac);
zc=-0.5*ones(1,length(ac));
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

hbf.AmbientStrength = 0.2;
hbf.DiffuseStrength = 0.2; 
hbf.BackFaceLighting = 'lit';
 
hbf.SpecularStrength = 0.5;
hbf.SpecularColorReflectance = .2;
hbf.SpecularExponent = 10;

%% Combine objects and create animation using hgtransform

combinedobjyaw = hgtransform('parent',myaxes);
set(hyaw,'parent',combinedobjyaw);

combinedobjpitch = hgtransform('parent',myaxes);
set(hpitch,'parent',combinedobjpitch);

combinedobjth1 = hgtransform('parent',myaxes);
set(hth1,'parent',combinedobjth1);

combinedobjth2 = hgtransform('parent',myaxes);
set(hth2,'parent',combinedobjth2);

w=0;
time=sprintf('Time %0.1f sec',t(1));
xlabel(time,'BackgroundColor',[1 1 1],'EdgeColor','k','FontSize',18);

try

while w==0

  rotationyaw = makehgtform('zrotate',q2(1));
  translationpitch = makehgtform('translate',[0 0 3]);
  rotationpitch = makehgtform('xrotate',q1(1));
  translationth1 = makehgtform('translate',[0 3 0]);
  translationth2 = makehgtform('translate',[0 -3 0]);

  rotationbladez = makehgtform('zrotate',0);
  rotationbladey = makehgtform('xrotate',0);
 
  set(combinedobjyaw,'matrix',rotationyaw);
  set(combinedobjpitch,'matrix',translationpitch*rotationyaw*rotationpitch);
  set(combinedobjth1,'matrix',translationpitch*rotationyaw*rotationpitch*translationth1*rotationbladez);
  set(combinedobjth2,'matrix',translationpitch*rotationyaw*rotationpitch*translationth2*rotationbladey);
  
  time=sprintf('Time %0.1f sec',t(1));
  xlabel(time,'BackgroundColor',[1 1 1],'EdgeColor','k','FontSize',18);

f.Visible='on';

click_play = title('Click on the Figure to play the animation', 'FontSize',14);
waitforbuttonpress
delete(click_play);

for i = 1:100:length(q1)

    rotationyaw = makehgtform('zrotate',q2(i));
    translationpitch = makehgtform('translate',[0 0 3]);
    rotationpitch = makehgtform('xrotate',q1(i));
    translationth1 = makehgtform('translate',[0 3 0]);
    translationth2 = makehgtform('translate',[0 -3 0]);
 
    set(combinedobjyaw,'matrix',rotationyaw);
    set(combinedobjpitch,'matrix',translationpitch*rotationyaw*rotationpitch);

    time=sprintf('Time %0.1f sec',t(i));
    xlabel(time,'BackgroundColor',[1 1 1],'EdgeColor','k','FontSize',18);

    for j=(0:120:360)*pi/180

    rotationbladez = makehgtform('zrotate',j);
    rotationbladey = makehgtform('xrotate',j);

    set(combinedobjth1,'matrix',translationpitch*rotationyaw*rotationpitch*translationth1*rotationbladez);
    set(combinedobjth2,'matrix',translationpitch*rotationyaw*rotationpitch*translationth2*rotationbladey);

    pause(0.03);

    end

end

click_replay = title('Click on the Figure to replay the animation', 'FontSize',14);
w=waitforbuttonpress;
delete(click_replay);

end

catch
    disp('Animation ended')
end

end