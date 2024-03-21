function [dzhat] = rp_observer(in, p)
%keyboard
ut = in(1);
yt = in(2);
zhat = in(3:6);

%keyboard
dzhat = p.A * zhat + p.B * ut + p.L * (yt - p.C * zhat);

end
