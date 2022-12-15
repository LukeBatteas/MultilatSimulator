classdef trilaterationFrame < frame
    properties
        A
        B
        C
    end
    methods
        function trilaterationFrame = initTrilaterationFrame(trilaterationFrame,frame,P,Q,R)
            phi = 
            psi = 
            Rz = [[cos(phi) -sin(phi) 0]
                  [sin(phi) cos(phi) 0]
                  [0 0 1]];
            Rx = [[1 0 0]
                [0 cos(psi) -sin(psi)]
                [0 sin(psi) cos(psi)]];
            i = (P-Q)./sqrt(dot(P-Q,P-Q));
            %(P-R) dot k = 0
            %(P-Q) dot k = 0
            % k has magnitude 1
            % kx, ky, kz
            

            % (P-R) - (P-Q) dot (P-R)
        end
    end
end