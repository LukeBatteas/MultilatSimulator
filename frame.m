classdef frame
    properties
      %Origin w.r.t ground frame
      O
      %Orientation w.r.t ground frame
      R
      %Points defined in this frame
      points 
      %Transformation matrix from ground frame INTO this frame
      Tin
      %Transformation matrix from this frame OUT of it into ground frame
      Tout
      %Body frame angular velocity
      w

    end
   methods
       function frame = initFrame(frame,O, R)
           frame.O = O;
           %Sets the orientation of t
           frame.R = R;
           frame.Tout = [[R O]
               [0 0 0 1]];
           frame.Tin = inv(frame.Tout);
           frame.w=[0 0 0].';
    
    end
    
    function frame = updateTransform(frame)
        frame.Tout = [[frame.R frame.O]
               [0 0 0 1]];
        frame.Tin = inv(frame.Tout);
    end
    %Add point to a point matrix stored in frame
    %ALL POINTS HERE ARE WITH RESPECT TO THE FRAME ITSELF!!!!
    function frame = addPoint(frame, r)
        frame.points = [frame.points r];
    
    end

    %Set orientation to some rotaiton matrix w.r.t ground frame
    function frame = setOrientation(frame, R)
        %Convert points to ground frame
        frame.points = frame.R*frame.points;
        %Rotate frame by R
        frame = rotateFrame(frame,R);
        frame = frame.updateTransform();
    end

    %Rotaton w.r.t this frame 
    function frame = rotateFrame(frame, R)
        %Update orientation
        frame.R = frame.R*R;
        %Rotate points
        
        if not(size(frame.points)==[0 0])
        frame.points = R.'*frame.points;
        end
        frame = frame.updateTransform();
    end
    
    %Translate w.r.t this frame
    function frame = moveOrigin(frame, r)
        %Add offset to all points invluding origin
        if not(size(frame.points)==[0 0])
        frame.points = frame.points+r*ones(length(frame.points(:,1)));
        end
        frame.O=frame.O+frame.R.'*r;
        frame = frame.updateTransform();
    end
    
    %Set origin w.r.t ground frame
    function frame = setOrigin(frame, O)
        %Convert to ground frame
        
    end

    function r = getPoint(frame, n)
        r = frame.points(:,n);
    end
    
    function frame = addPointFromFrame(frame, f2, n)
        r = frame.Tin*f2.Tout*[[f2.getPoint(n)];1];
        r = [r(1);r(2);r(3)];
        frame = frame.addPoint(r);
    end

    function r = getPointInGroundFrame(frame, n)
        r = frame.Tout*[[frame.getPoint(n)];1];
        r = [r(1);r(2);r(3)];
    end

    function frame = rotateAtAngularSpeed(frame, w, dt)
    
        frame.w=w;
        w_norm = sqrt(dot(w,w));
        w = w./w_norm;
        W = [[0 -w(3) w(2)];
             [w(3) 0 -w(1)];
             [-w(2) w(1) 0]];

        
        Rf = eye(3)+W.*sin(w_norm*dt)+W*W.*(1-cos(w_norm*dt));
        
        frame = frame.rotateFrame(Rf);

    end

    %Should I make a removePoints Function?
    %Probably for a robust program
    %But I put the bust in robust so...
   end 
end

