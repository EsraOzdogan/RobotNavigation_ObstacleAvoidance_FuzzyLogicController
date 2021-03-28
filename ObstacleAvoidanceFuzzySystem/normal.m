function normal()
	fis = newfis('robot');

	fis = addvar(fis, 'input', 'angle', [0 40]);
    fis = addmf(fis, 'input', 1, 'small', 'trapmf', [0 0 10 20]);
    fis = addmf(fis, 'input', 1, 'medium', 'trimf', [10 20 30]);
    fis = addmf(fis, 'input', 1, 'large', 'trapmf', [25 35 40 40]);

    fis = addvar(fis, 'input', 'distance', [0 20]);
    fis = addmf(fis, 'input', 2, 'near', 'trapmf', [0 0 6 8]);
    fis = addmf(fis, 'input', 2, 'far', 'trimf', [5 10 15]);
    fis = addmf(fis, 'input', 2, 'veryfar', 'trapmf', [12 15 20 20]);

    fis = addvar(fis, 'output', 'speed', [0 100]);
    fis = addmf(fis, 'output', 1, 'veryslow', 'trapmf', [0 0 10 20]);
    fis = addmf(fis, 'output', 1, 'slow', 'trimf', [10 25 40]);
    fis = addmf(fis, 'output', 1, 'fast', 'trimf', [30 45 60]);
    fis = addmf(fis, 'output', 1, 'fastfast', 'trimf', [50 60 70]);
    fis = addmf(fis, 'output', 1, 'veryfast', 'trimf', [65 75 90]);
    fis = addmf(fis, 'output', 1, 'topspeed', 'trapmf', [75 90 100 100]);


	rules = [1 1 1 1 1;
			 1 2 2 1 1;
			 1 3 4 1 1;
			 2 1 2 1 1;
			 2 2 3 1 1;
			 2 3 5 1 1;
			 3 2 3 1 1;
			 3 2 5 1 1;
			 3 3 6 1 1];

	fis = addRule(fis, rules);

	fig_handle = figure;
	set(fig_handle, 'Position', [50 50 1300 600])
	subplot(2, 2, 1)
	plotfis(fis)

	subplot(2, 2, 2)
	plotmf(fis, 'input', 1)

	subplot(2, 2, 3)
	plotmf(fis, 'output', 1)

	subplot(2, 2, 4)
	plotmf(fis, 'input', 2)

	% test values
	angles = [10; 15; 25; 40];
	distances = [3.5; 15; 12; 8];
	speeds = zeros(4, 1);

	for i = 1:4
		speeds(i, :) = evalfis([angles(i, :), distances(i, :)], fis);
	end
	table_ = table(angles, distances, speeds)
end