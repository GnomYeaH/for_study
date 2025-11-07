function [y] = rele(x, c, b)
    
    if ode45(x)
        y = c*sign(x-b); 
    else
        y = c*sign(x+b);
    end

end