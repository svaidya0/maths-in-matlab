function N = ball(R)

%BALL     Counts the number N(R) of integer points that lie in the closed
%         ball centred at 0 with radius R inside the 2 dimensional integer 
%         lattice Z^2.


N = 1;     % Since origin will always be inside ball

for x = 0:floor(R)    % Since x must be integer
    
    y = 1;
    
    while sqrt(x^2 + y^2) <= R
        
        % By symmetry (x,-y) (-x,y) (-x, -y) are also in the ball
        N = N + 4;     
        y = y + 1;
        
    end
end
        
end