# MultilatSimulator
Multilateration simulator for rigid bodies
Determining the position and orientation of an object allows for the object’s motion profile to be 
mapped. This is used in pathfinding for mobile robotics as knowing where an object is, is the essential 
step before making decisions on how to move. This project evaluates the use of trilateration to 
determine the position and orientation of an object. Trilateration is the use of three distances from 
known points to determine position of an unknown particle. In addition, the use of an onboard gyro sensor to determine orientation is 
explored. The combined information of the gyro sensor and the trilateration is used to determine the 
best possible of the estimate of the orientation given noise in the system
