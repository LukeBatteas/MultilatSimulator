



rP = [1 0 0];
rQ = [0 1 0];
rR = [1 1 0];
rO = [1 1 1].';
a = 1;
b = 1;
c = 1;

R = [[1 0 0]
     [0 1 0]
     [0 0 1]];

block = block;
block = block.initBlock(rO,R,a,b,c);


sim = initSimulation(rP,rQ,rR,rO,a,b,c);











function [] = visualizeBlock(block)

O = block.O;
F = block.F;
G = block.G;
H = block.H;
A = block.A;
B = block.B;
C = block.C;
D = block.D;

color = ones([8 1]);

figure;
fill3([A(1) B(1) C(1) D(1) O(1) F(1) G(1) H(1)], [A(2) B(2) C(2) D(2) O(2) F(2) G(2) H(2)],[A(3) B(3) C(3) D(3) O(3) F(3) G(3) H(3)], color) 
end