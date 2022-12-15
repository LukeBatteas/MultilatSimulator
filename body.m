classdef body
    properties
      %Position vector of Point
      %With respect to this Frame

      %Body frame, moves with body
      F

      %Define particles relative to the particle to which the body frame is
      %attached 
      particles

    end
   methods
       function body = initBody(body, Frame)
              %assign body frame
              body.F = Frame;
    
       end

       %Add a particle in the body frame
       function body = addParticle(body, r)
           body.particles = [body.particles r];
       end

       %Returns the nth particle
       function r = getParticle(body, n)
           r = body.particles(:,n);
       end

       %returns point of particle in ground frame
       function r = getPointOfParticle(body,n)
           r = body.F.Tout*[[body.getParticle(n)];1];
           r = [r(1);r(2);r(3)];
       end

       function body = rotateBody(body,R)
           body.F = body.F.rotateFrame(R);
       end

       function body = translateBody(body, r)
           body.F = body.F.moveOrigin(r);
       end
   end

       
    
  
end

