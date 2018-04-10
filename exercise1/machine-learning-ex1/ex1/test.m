function run()
    data = load('ex1data1.txt');

    a = data(:, 1);
    a = [ones(m, 1), data(:,1)]; % Add a column of ones to x
    theta1 = zeros(2, 1);
    z = data(:, 2);
    m = length(z);
end