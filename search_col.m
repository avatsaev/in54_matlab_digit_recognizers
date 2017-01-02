function [ output ] = search_col( image, lines)
%search_col( image, lines) s�pare tous les �l�ments affich�s dans
%l'intervalle de deux lignes (donn�s par les valeurs des ordonn�es 
%englobant une ligne de symboles) d'une image binaire en colonne.
%Cette fonction renvoie un tableau de coordonn�es N*2 avec
%N le nombre de symboles dans la ligne. Pour chaque symbole de la ligne
%on renvoie les coordonn�es dans l'image des abscisses englobant la ligne
%de symboles
    output =zeros(2,0);
    for j=1:size(lines,1)
        batch_start = lines(j,1);
        batch_end = lines(j,2);
        SUM_ = sum(image(batch_start:batch_end,:)<50,1);
        temp = [0 0];
        for i=2:size(SUM_,2) 
            if (SUM_(i)>0) & (SUM_(i-1)==0) 
                temp(1) = i;
            elseif (SUM_(i)==0) & (SUM_(i-1)>0)
                temp(2) = i;
                output=[output;temp];
            end
        end
    end
end

