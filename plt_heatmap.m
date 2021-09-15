load output_mfcc
figure(2)
clf
h = heatmap((output{10,3})', "Colormap", jet);
h.GridVisible = 'off';
h.XLabel = "Time(s)";
h.YLabel = "MFCC Feature number";
h.Title = "MFCC feature seqeuence for sample at R3";
h.FontSize = 20;



for ii = 1:98
    h.XDisplayLabels{ii} = '';
end

h.XDisplayLabels{1} = '0.0';
h.XDisplayLabels{24} = '0.25';
h.XDisplayLabels{49} = '0.5';
h.XDisplayLabels{74} = '0.75';
h.XDisplayLabels{98} = '1.0';

s = struct(h);
s.XAxis.TickLabelRotation = 0;  % vertical

s.XAxis.TickLabelInterpreter = "latex";
s.XAxis.Label.Interpreter = "latex";
s.YAxis.TickLabelInterpreter = "latex";
s.YAxis.Label.Interpreter = "latex";
s.Axes.Title.Interpreter = "latex";
s.Axes.TitleFontSizeMultiplier = 1.5;
