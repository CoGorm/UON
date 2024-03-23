function [dzhat] = rp_observer(in, p)
%keyboard
ut = in(1);
yt = in(2:3);
zhat = in(4:7);

%keyboard
dzhat = p.A * zhat + p.B * ut + p.L * (yt - p.C * zhat);

end
