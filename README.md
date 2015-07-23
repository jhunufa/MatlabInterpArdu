# MatlabInterpArdu

Interpolador de dados estatísticos recebidos via Arduino:

Proposta:
  Uma rotina no programa MATLAB que recebe, através do Arduino, dados amostrais discretos de um fenômeno e interpola para reproduzir o fenômeno na totalidade.

Para entrar em contato use o GitHub ou o email jhunu.fernandes@gmail.com
--------------------------------------------------------------------------------
Funcionamento:

  No Arduino:
    O controlador recebe as instruções do MATLAB e retorna as leituras solicitadas. Neste script em questão, a leitura feita corresponde à da porta analógica 1 (A1). Nesta exemplificação foi usado um potencômetro de 10Kohms

  No MATLAB:
    Cria um objeto Arduino e solicita ao mesmo que leia a porta A1.

    Obs: É necessário estar atento à porta COM que o Arduino está conectado.

    Solicita ao usuário que informe as seguintes informaçõesa respeito da interpolação (explicação da teoria posteriormente): Extensão da leitura, Escala da leitura, Intervalo entre as medidas, Precisão da interpolação. Plota em um gráfico as leituras do fenômeno na totalidade e salva uma fração destas para ser usada na interpolação. Realiza três interpolações e plota cada uma delas das curvas geradas para ser analisada e comparada com a curva origial e completa do fenômeno.
--------------------------------------------------------------------------------
Componentes:

  1) Arduino ou equivalente com pelo menos 1 portas analógica e saída Serial.

  5) MATLAB com o Patch ARDUINO/IO
--------------------------------------------------------------------------------
Interfaces:

  1) Arduino
  2) MATLAB

  1) Arduino:
    Recebe as instruções das ações a serem realizadas pelo MATLAB. É upado com o sketch ADIOES.pde ou ADIOES.ino.

  2) MATLAB:
    A plotagem dos dados totais do fenômeno é apenas para expressividade da qualidade da interpolação. A rotina guarda apenas uma fração das amostras lidas. A partir destas amostras que é feita a interpolação por três métodos. As variáveis: extensao, escala_leitura e precisao fornece controle sobre como são feitas as obtenções das amostras de dados.

    Modificar a extensao permite maiores e menores intervalos de amostragens. A medida padrão é entre 100 e 1000 e retornará neste número de medidas do evento.

    Modificar a escala apenas converte os valores obtidos na leitura para sua escala de interesse. Não há valor padrão.

    Modificar o intervalo permite maiores e menores quantidades de amostras que serão interpoladas. Isto interfere diretamente na qualidade da  interpolação. A medida padrão é 10 e retornará em amostras apenas 10% de todas as leituras do fenômeno.

    Modificar precisao permite maiores e menores pontos para serem interpolados. Isto interfere diretamente na curvinialidade da interpolação. A medida padrão é 1.

  Obs: Alterações na extensão criam programas que podem ser muito longos para serem executados. Alterações na precisão podem criar curvas definitivamente demoradas de serem plotadas.
