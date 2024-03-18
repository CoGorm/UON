function [C0check, K] = rp_sfc_design(A,B,Ec)
CAB = ctrb(A,B);

rankCAB = rank(CAB);

if rankCAB == length(A)
  C0check = 1;
  display("System is completely controllable")
else
  C0check = 2;
  display("System is not completely controllable")
end

K = place(A,B, Ec);
end
