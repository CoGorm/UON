function [O_check, L] = rp_obs_design(A, C, Eo)

if rank(obsv(A, C)) == length(A)
    O_check = 1;
else
    O_check = 0;
end

L = place(A.', C.', Eo).';
end