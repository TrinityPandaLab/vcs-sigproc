clear, clc, clf
load output_mfcc
figure(1)
temp = output{10,3}';
h = heatmap(temp, "Colormap", jet);
h.GridVisible = 'off';
h.XLabel = "Time(s)";
h.YLabel = "MFCC Feature number";
h.Title = "MFCC feature seqeuence for sample at R$_3$";
h.FontSize = 25;

for ii = 1:98
    h.XDisplayLabels{ii} = '';
end

h.XDisplayLabels{1} = '0.0';
h.XDisplayLabels{24} = '0.25';
h.XDisplayLabels{49} = '0.5';
h.XDisplayLabels{74} = '0.75';
h.XDisplayLabels{98} = '1.0';

h.YDisplayLabels = num2cell(0:13);


s = struct(h);
s.XAxis.TickLabelRotation = 0;  % vertical

s.XAxis.TickLabelInterpreter = "latex";
s.XAxis.Label.Interpreter = "latex";
s.YAxis.TickLabelInterpreter = "latex";
s.YAxis.Label.Interpreter = "latex";
s.Axes.Title.Interpreter = "latex";
s.Axes.TitleFontSizeMultiplier = 1.5;

%%
k = 500;
x = linspace(-1,1,k);
y = (x+0.15).^3 * 0.45 + 0.3;

figure(2)
plot(y)

%%
figure(1)
coll = hsv2rgb([y(:) ones(k,1) ones(k,1)]);
colormap(coll)