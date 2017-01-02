clearvars -except d K

if (exist('d','var') == 0)  
    d = 25;
end

app = imread('app.tif');
load('Symboles_coords_data.mat')

sample_dens = zeros(size(symbole_coords,1),d);


for symbole_line=1:size(symbole_coords,1)

 sample_dens(symbole_line,:) = find_densities( app,symbole_coords(symbole_line,:),d);

   %average_dens(line,:) = densities/size(cols,1).';
end

save('Classifieur2_data.mat', 'sample_dens');

