function [a] = DigitAligner(I)
    a = flip(I);
    a = rot90(a,3);
end