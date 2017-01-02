function [output] = recognize2(densities)
% recognize2(densities) retourne la distance euclidienne entre le vecteur 
% d'entr�e densities et les vecteurs d'apprentissage calcul�s par
% Classifieur2.

load('Classifieur2_data.mat');

D = zeros(1,size(sample_dens,1));
for symbole_line = 1:size(sample_dens,1)
   D(symbole_line) = norm(densities - sample_dens(symbole_line,:));
end
output = D;
end

