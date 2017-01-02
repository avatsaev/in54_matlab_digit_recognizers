function [ output ] = search_line( image )
%search_line( image ) parcourt une image binaire et sépare horizontalement
%les lignes de symboles de l'image.
%Cette fonction renvoie un tableau de coordonnées N*2 avec
%N le nombre de lignes de symboles trouvé. Pour chaque ligne on renvoie les
%coordonnées dans l'image des ordonnées englobant la ligne de symboles
    SUM_ = sum(image<50,2);
    output =zeros(2,0);
    temp = [0 0];
    for i=2:size(SUM_) 
        if (SUM_(i)>0) & (SUM_(i-1)==0) 
            temp(1) = i;
        elseif (SUM_(i)==0) & (SUM_(i-1)>0)
            temp(2) = i;
            output=[output;temp];
        end
    end  
end

