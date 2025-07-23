```matlab
initialValue = 4           % variable name
transmission = DriveTrain  % class name

```

```matlab
data = {datetime "abc" 123};
arrays = {rand(1,10) zeros(2,4) eye(5)};
missions = ["Mercury" "Gemini" "Apollo"];
```

```matlab
% Find the indices of all primes in matrix A
% Requires 6 levels of nesting
index = false(size(A));
for m = 1:size(A,1)
    for n = 1:size(A,2)
        if A(m, n) > 1
            if (A(m, n) == 2) || (A(m, n) == 3)
                index(m, n) = true;
            elseif (mod(A(m, n), 2) ~= 0) && (mod(A(m, n), 3) ~= 0)
                index(m, n) = true;
                maxFactors = floor((sqrt(A(m, n))+1)/6);
                for p = 1:maxFactors
                    if (mod(A(m, n), 6*p-1) == 0 || ...
                        mod(A(m, n), 6*p+1) == 0)
                        index(m, n) = false;
                    end
                end
            end
        end
    end
end
```

```matlab
classdef Rectangle
    properties
        Origin (1,2) double {mustBeReal}
        Width  (1,1) double {mustBeReal, mustBeNonnegative}
        Height (1,1) double {mustBeReal, mustBeNonnegative}
    end

    properties (Dependent)
        Area
    end

    methods
        % Area calculated from Width and Height
        function area = get.Area(obj)  
            area = obj.Width*obj.Height;
        end
    end
end
```