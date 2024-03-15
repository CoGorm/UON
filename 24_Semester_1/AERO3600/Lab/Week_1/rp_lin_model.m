function dx = rp_lin_model(in, p)

vm = in(1);
x1 = in(2);
x2 = in(3);
x3 = in(4);
x4 = in(5);

dx = p.A*[x1;x2;x3;x4] + p.B*vm;
