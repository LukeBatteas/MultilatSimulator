function r = trilaterate(A,B,C,r1,r2,r3)
    x = (A^2-r2^2+r1^2)/(2*A);
    y = (B^2+C^2-2*B*x-r3^2+r1^2)/(2*C);
    z = sqrt(r1^2-x^2-y^2);
    r = [x y z].';

end

