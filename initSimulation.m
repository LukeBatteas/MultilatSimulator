function [ground_Frame] = initSimulation(rP,rQ,rR,rO,a,b,c)

block.a=a;
block.b=b;
block.c=c;
block.i_true = [1 0 0];
block.j_true = [0 1 0];
block.k_true = [0 0 1];
block.i_est = block.i_true;
block.j_est = block.j_true;
block.k_est = block.k_true;
block.O_true=rO;
block.O_est = [0 0 0];
block.H_true = rO+block.i_true*block.c;
block.H_est = [0 0 0];
block.F_true = rO+block.j_true*block.a;
block.F_est = [0 0 0];
block.G_true = rO+block.i_true*block.c+block.j_true*block.a;
block.G_est = [0 0 0];


ground_Frame.P=rP;
ground_Frame.Q=rQ;
ground_Frame.R=rR;


ground_Frame.lengths = zeros(3);


phi = atan2(rQ(2)-rP(2),rQ(1)-rP(1));
ground_Frame.phi = phi;

T1_0 = [[cos(phi) -sin(phi) 0 rP(1)]
        [sin(phi) cos(phi) 0 rP(2)]
        [0 0 1 rP(3)]
        [0 0 0 1]];

T0_1 = inv(T1_0);

temp_Frame.Q = T0_1*[rQ 1].';
temp_Frame.R = T0_1*[rR 1].';

ground_Frame.F1 = temp_Frame;

R = [block.i_true.' block.j_true.' block.k_true.'];

ground_Frame.R_true = R;
ground_Frame.R_1 = R;
ground_Frame.R_2 = R;
ground_Frame.T1_0 = T1_0;
ground_Frame.T0_1 = T0_1;

ground_Frame.block = block;

end