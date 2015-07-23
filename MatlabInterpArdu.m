% Rotina do MATLAB

a=arduino('COM3');

clc
extensao = input('Extenção da leitura: '); % default 100 a 1000
escala_leitura = input('Escala da leitura: '); % default 10
intervalo_medidas = input('Intervalo entre as medidas: '); % default 10
precisao = input('Precisão da interpolação: '); % default 1
data1 = zeros(1,extensao/intervalo_medidas);
x = linspace(1,extensao,length(data1));
clc

for i = 1:extensao
    leitura = a.analogRead(1);
    leitura = leitura*escala_leitura/1023;
    subplot(2,2,1)
    plot(i,leitura,'k.');
    title('Leitura da porta analógica')
    axis([1 extensao 0 escala_leitura])
    if mod(i,intervalo_medidas) == 0
        for j=2:4
            subplot(2,2,j)
            plot(i,leitura,'ko')
            title('Interpolação')
            axis([1 extensao 0 escala_leitura])
            data1(i/intervalo_medidas) = leitura;
            hold on
        end
    end
    hold on
    pause(0.001)
end

for i = 1:precisao:extensao
    for j = 2:4
        subplot(2,2,j)
        if j == 2
            interpolacao = interp1(x,data1,i,'linear');
            plot(i,interpolacao,'r.')
            title('Interpolação Linear')
            axis([1 extensao 0 escala_leitura])
        elseif j == 3
            interpolacao = interp1(x,data1,i,'pchip');
            plot(i,interpolacao,'r.','lineWidth',5)
            title('Interpolação Cúbica')
            axis([1 extensao 0 escala_leitura])
        else
            interpolacao = interp1(x,data1,i,'spline');
            plot(i,interpolacao,'r.','lineWidth',5)
            title('Interpolação Spline')
            axis([1 extensao 0 escala_leitura])
        end
        pause(0.00001)
        hold on
    end
end

fprintf('Fim de execução\n')
