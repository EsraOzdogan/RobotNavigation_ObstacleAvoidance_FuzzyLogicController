function triangleFISInput(lowerbound,a,c,b,upperbound,input)

global mu_input;

alfa=1;

if input>=a && input<=c
    mu_input = alfa*(input-a)/(c-a);
elseif input>=c && input<=b
    mu_input = alfa*(input-b)/(c-b);
else
    mu_input = 0;
    
end