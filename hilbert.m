function hilbert(pl,pm,pr,level)
%HILBERT   Recursively generated Hilbert curve.
%          HILBERT(PL, PM, PR, LEVEL) recursively generates a Hilbert curve, where
%          PL ,PM and PR are the current left , middle and right points entered as
%          column vectors and LEVEL is the level of recursion.

A = [0 1; -1 0];         % To rotate pi/2 clockwise 

if level == 0
    
    plot([pl(1),pm(1),pr(1)],[pl(2),pm(2),pr(2)],'b');      % Join pl and pr.
    hold on
    xlim([0,1])     % Sets the x and y axes to range from 0 to 1
    ylim([0,1])
  
  
elseif pl(1)>pr(1) || pl(2)>pr(2)      % Recursion is different in this case
       
    pleft = pl - abs(A * (pl - pr)/2);                      % Left lower branch.
    pmleft = (pl + pleft)/2 - abs(A * (pl - pleft)/2);
    hilbert(pl, pmleft, pleft, level-1)    
    
    pmtopl = (pleft + pm)/2 - abs(A * (pleft - pm)/2);      % Left Upper branch. 
    hilbert(pleft, pmtopl, pm, level-1)  
    
    pright = pr - abs(A*(pl-pr)/2);                         % Right upper branch.
    pmtopr = (pm + pright)/2 - abs(A * (pm - pright)/2);
    hilbert(pm, pmtopr, pright, level-1)           

    pmright = (pright + pr)/2 + abs(A * (pright - pr)/2);   % Right lower branch. 
    hilbert(pright, pmright, pr, level-1)            
  
       
else
    pleft = pl + abs(A * (pl - pr)/2);                      % Left lower branch.
    pmleft = (pl + pleft)/2 + abs(A * (pl - pleft)/2);
    hilbert(pl, pmleft, pleft, level-1)    
 
    pmtopl = (pleft + pm)/2 + abs(A * (pleft - pm)/2);      % Left upper branch.
    hilbert(pleft, pmtopl, pm, level-1)          
    
    pright = pr + abs(A*(pl-pr)/2);                         % Right upper branch.
    pmtopr = (pm + pright)/2 + abs(A * (pm - pright)/2);
    hilbert(pm, pmtopr, pright, level-1)
   
    pmright = (pright + pr)/2 - abs(A * (pright - pr)/2);   % Right lower branch. 
    hilbert(pright, pmright, pr, level-1)
end

end