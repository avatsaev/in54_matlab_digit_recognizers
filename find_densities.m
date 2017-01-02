function [ output ] = find_densities( imge, symbole_rect, d  )
% find_densities(imge, symbole_rect, d) renvoie les densités de pixels
% noirs d'un symbole dans un rectangle englobant symbole_rect d'une image
% imge. Le rectangle découpé en d zones. Chaque valeur de densité 
% correspond à une de ces zones.


% On calcule la largeur et la hauteur de chaque échantillon
height = round((symbole_rect(1,4) -  symbole_rect(1,2))/sqrt(d));
width = round((symbole_rect(1,3) -  symbole_rect(1,1))/sqrt(d));

% On initialise le tableau de densité
densities = zeros(1,d); 

% On parcourt les zones sur la hauteur et la largeur
%figure
for i=1:sqrt(d)
    for j=1:sqrt(d)
        % On calcules les coordonnées des zones
        x = symbole_rect(1,1) + (j-1)*width;
        y = symbole_rect(1,2) + (i-1)*height;

        % On fait la somme des pixels noirs
        densities((i-1)*sqrt(d)+j) = sum(sum(imge(y+1:y+height,x+1:x+width) == 0));
     
         % On affiche les zones
%         subplot(sqrt(d),sqrt(d),(i-1)*sqrt(d)+j);
%         imshow(imge(y:y+height, x:x+width))
%         title(densities((i-1)*sqrt(d)+j))
    end
end

% On affiche le symbole
% figure
% imshow(imge(symbole_rect(1,2):symbole_rect(1,4),symbole_rect(1,1):symbole_rect(1,3)))

% On divise les densités par la surface d'une pour les normaliser
output = densities/(height*width);
end

