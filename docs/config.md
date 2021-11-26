# Uma gama de configurações a principio limitadas, mas estamos trabalhando nisso..

Nesta primeira versão, você tem disponibilizado uma gama básica de configurações, em parte pelas limitações que ocorre pelo sistema rodar via terminal, mas estamos 
trabalhando em uma versão com interface, onde a gama de configurações será expandida, então sempre que lançarmos uma versão nova, não deixe de conferir as novidades pela documentação.


## Timeframes de Analise do Gráfico

* [x] 1 segundo
* [x] 5 segundos
* [x] 10 segundos
* [x] 15 segundos
* [x] 30 segundos
* [x] 1 minuto
* [x] 2 minutos
* [x] 5 minutos
* [x] 10 minutos
* [x] 15 minutos
* [x] 30 minutos
* [x] 1 hora
* [x] 2 horas
* [x] 4 horas
* [x] 8 horas
* [x] 12 horas
* [x] 1 dia
* [x] 1 semana
* [x] 1 mês

----

## Timeframes de Operação

* [x] 1 minuto
* [x] 5 minutos
* [x] 15 minutos

!!! note ""
	Em breve todos os timeframes serão liberados, por enquanto somente os "básicos"(1,5 e 15) estão adicionados pois são os mais comuns, mas todos serão adicionados para serem utilizados.

----

## "Tipos de Operação"

* [x] Digital
* [x] Binária
* [x] Maior Payout

!!! note ""
	Os payouts e pares de um modo geral são atualizados a cada 180 segundos.

----

## Recuperações

* [x] Martingale na próxima vela

----

## Alavancagem

-	* [x] Soros
	* [x] Quantia de niveis/mãos de Soros

!!! note "" 
	A porcentagem atual utilizada pelo Soros é de 100%

----

## Controle de ganhos/perca

* [x] Stop Loss com Valor Fixo
* [x] Stop Win/Take com Valor Fixo

----

## Outros

* [x] Valor de entrada fixo
* [x] Payout Minimo
* [x] Calculo do Martingale utilizando "Fator Martingale"

----

## Configurações manuais

As configurações manuais são as que você não consegue fazer pelo robo, mas que você ainda assim pode personalizar, as configurações devem ser alteradas diretamente no arquivo db.json.

!!! danger "Cuidado"
	A alteração dessas configurações afetam diretamente o modo que o sistema trabalha, então cuidado ao edita-las.
	
- * [x] Polling Time
	* Delay minimo para o ciclo de analise do script/indicador, você pode visualizar essa info quando o sistema está rodando na parte inferior do terminal, está referenciado como "delay de 0.04" por exemplo, o tempo é passado será considerado como segundos, então se desejar passar um milisegundo, utilize 0.1, 0.05, etc.

- * [x]	Candle Return
	* Quantas velas são capturadas da IQ Option, o valor é limitado em 1000 pela API.



