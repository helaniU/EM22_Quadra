% Example plotting load voltage
t = V1.Time;                % changed from V_load to V1
Va = V1.Data(:,1);
Vb = V1.Data(:,2);
Vc = V1.Data(:,3);

figure; 
plot(t,Va); hold on; 
plot(t,Vb); 
plot(t,Vc);
legend('Va','Vb','Vc'); 
xlabel('Time (s)'); 
ylabel('Voltage (V)');

% Average powers
t_end = P_gen1.Time(end);
idx = P_gen1.Time > (t_end-0.2);  % last 0.2 seconds
P1 = mean(P_gen1.Data(idx));
P2 = mean(P_gen2.Data(idx));
P3 = mean(P_gen3.Data(idx));
P_load_avg = mean(P_load.Data(idx));
loss = P1 + P2 + P3 - P_load_avg;

fprintf('Gen1: %.0f W, Gen2: %.0f W, Gen3: %.0f W\n',P1,P2,P3);
fprintf('Load: %.0f W, Loss: %.0f W\n',P_load_avg,loss);
