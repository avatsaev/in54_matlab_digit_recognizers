function [ output ] = recognize1( distances )
% recognize1( distances ) calcule la probabilité qu'un symbole 
% correspondent à un chiffre manuscrit de l'image d'apprentissage en 
% utilisant des tableaux de distances des profils de chaque symbole. 

load('Classifieur1_data.mat');

% on calcule la distance euclidienne entre le vecteur d'entrée et les
% vecteurs d'apprentissage
D = zeros(1,size(average_dist,1));

denom = 0;
for symbole_average_distance = 1:size(average_dist,1)
   denom = denom + exp(-norm(distances - average_dist(symbole_average_distance,:)));
end
   
for symbole_line = 1:size(average_dist,1)
   D(symbole_line) = exp(-norm(distances - average_dist(symbole_line,:)))/denom;
end
output = D;
end

