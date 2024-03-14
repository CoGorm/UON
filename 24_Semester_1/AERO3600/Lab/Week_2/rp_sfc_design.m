function [C0check, K] = rp_sfc_design(A,B,Ec)
CAB = ctrb(A,B);

rankCAB = rank(CAB);

if rankCAB == length(A)
  C0check =1;
else
  C0check = 2;
end

K = place(A,B, Ec);
end
