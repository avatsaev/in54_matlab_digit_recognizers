clearvars -except d K

app = imread('app.tif');
load('Symboles_coords_data.mat')
nb_lines = 10;
nb_cols = 20;
d=10;
average_dist = zeros(nb_lines,d);


% On parcours les lignes 
for line=1:nb_lines
    distances = zeros(d,1); 
    % On parcours les colonnes
    for col=1:nb_cols   
        distances = distances + find_distances( app,symbole_coords((line-1)*nb_cols+col,:),d);
    end 
   % Pour chaque chiffre manuscrit on fait la moyenne des distances de ses
   % symboles 
   average_dist(line,:) = distances/nb_cols.';
end

save('Classifieur1_data.mat', 'average_dist');