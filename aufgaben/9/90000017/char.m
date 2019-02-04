#
# char.m -- characteristics
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
global s;
s = 1;
N = 105;
t = 1.05 * (0:N) / N;
x0 = [ 0; ];

function xdot = g(x, t)
	global s;
	xdot = [ 1 + s * sqrt(1 + exp(-x)); ];
endfunction

results(1:N+1,1) = t;

s = 1;
results(:,2) = lsode(@g, x0, t);

fid = fopen("red.tex", "w");
fprintf(fid, "\\def\\rot{\\draw[color=red] (0,0)\n");
for i = (2:106)
	fprintf(fid, "--(%.4f,%.4f)\n", results(i,1), results(i,2));
end
fprintf(fid, ";}\n");
fclose(fid);

s = -1;
results(:,2) = lsode(@g, x0, t);

fid = fopen("green.tex", "w");
fprintf(fid, "\\def\\gruen{\\draw[color=darkgreen] (0,0)\n");
for i = (2:106)
	fprintf(fid, "--(%.4f,%.4f)\n", results(i,1), results(i,2));
end
fprintf(fid, ";}\n");

fprintf(fid, "\\def\\gruenundef{\\fill[color=darkgreen!20] (0,1)\n");
for i = (2:101)
	fprintf(fid, "--(%.4f,%.4f)\n", results(i,1), results(i,2)+1);
end
fprintf(fid, "--(1,1)--cycle;\n}\n");


fclose(fid);
