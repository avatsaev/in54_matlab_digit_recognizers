function [ output ] = search_rectangle(lines,cols )
%search_rectangle(lines,cols ) calcule les coordonnées du rectangle à
%partir des coordonnées des cotés horizontaux lines(x1,x2) et des cotés 
%verticaux cols(y1,y2) du rectangle englobant le symbole

    output = zeros(4,0);
    for i=1:size(lines,1)        
        for j=1:size(cols,1)
           output = [output ; [cols(j,1) lines(i,1) cols(j,2) lines(i,2)]];% [x1 y1 x2 y2] 
        end
      
    end
end

% rectangle('position',[h(1,1) h(1,2) h(1,3)-h(1,1) h(1,4)-h(1,2)])
