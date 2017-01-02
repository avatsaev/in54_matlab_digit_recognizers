app = imread('app.tif');
test = imread('test.tif');

lines = search_line(app);
cols = search_col(app,lines);

symbole_coords = create_rectangles( app, lines);

average_dist = Classifieur1( app,lines,cols, symbole_coords, 10 );