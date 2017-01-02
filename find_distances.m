function [ output ] = find_distances( image,rect,d )
% find_distances( image,rect,d ) renvoie les distances normalisées des 
% profils gauches et droites d'un symbole dans un rectangle rect d'une 
% image. Elle renvoie d/2 valeurs pour chaque profil. 


    vect= zeros(2,0);

    symbole = image(rect(1,2):rect(1,4),rect(1,1):rect(1,3)); 
    
%        figure
%        hold on
%        imshow(symbole);
  
    for i=1:round(d/2)
        % On calcule la distance de séparation entre les segments
        interline_dist=round(size(symbole,1)/(round(d/2)+1)*i);
        % On cherche le premier pixel noir de la ligne 
        segment_1_end = find(symbole(interline_dist,:)==0,1,'first');
        % On cherche le dernier pixel noir de la ligne 
        segment_2_start = find(symbole(interline_dist,:)==0,1,'last');
        % On stocke la distance normalisée du symbole par rapport au cotés du
        % rectangle de chaque ligne à gauche et à droite
        vect =[vect;[segment_1_end size(symbole,2)-segment_2_start]/size(symbole,2)];
        
        
      % Displays the segments
%          line([1 segment_1_end] ,[interline_dist interline_dist])
%          line([segment_2_start size(symbole,2)] ,[interline_dist interline_dist])
    end

% On transforme le résultats en matrice colonne pour faciliter les calcul
% de moyennes
output = [vect(:,1);vect(:,2)];
%[ dg1 ; dg2 ; dg3 ; ... ; dg(d/2) ; dd1 ; dd2 ; dd3 ; ... ; dd(d/2) ] 

end

