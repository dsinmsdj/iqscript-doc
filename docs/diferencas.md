# IQ Script não é igual ao sistema da IQ Option

Infelizmente, não conseguimos recriar todas as funcionalidades que a IQ Option fornece, grande parte delas está disponível ( leia mais abaixo ), mas ainda assim o sistema tem limitações.

No momento, o sistema comporta apenas analise de 1 paridade por vez, caso queira executar mais de um script ou executar em varias paridades, será necessário abrir mais instancias do bot e deixalo rodando.

## Funcionalidades comportadas

Aqui, usarei o mesmo "modelo" de apresentação que é utilizado na [documentação da IQ Option](https://quadcode-tech.github.io/quadcodescript-docs/).

----

### Built-in series


- [x] open
	* overlayable - Open value of the current candle
	
- [x] close
	* overlayable - Close value of the current candle
	
- [x] high	
	* overlayable - High value of the current candle
	
- [x] low	
	* overlayable - Low value of the current candle
	
- [x] volume	
	* overlayable - Volume value of the current candle
	
- [x] hml
	* overlayable - high - low
	
- [x] hl2	
	* overlayable - (high + low) / 2
	
- [x] hlc3	
	* overlayable - (high + low + close) / 3 (aka typical price)
	
- [x] ohlc4	
	* overlayable - (open + high + low + close) / 4
	
- [x] hlcc4	
	* overlayable - (high + low + close + close) / 4
	
- [ ] tr	
	* NÃO ESTÁ DISPONÍVEL

- [x] close_time
	* Candle closing time (unix time)
	
- [x] open_time
	* Candle opening time (unix time)
	
- [x] day
	* Candle opening time (day number in a year)
	
- [x] week_day
	* Candle opening time (day number in a week)
	
- [x] month	
	* Candle opening time (month)
	
- [x] year	
	* Candle opening time (year)
	
- [x] hour	
	* Candle opening time (hour)
	
- [x] minute	
	* Candle opening time (minute)
	
- [x] second	
	* Candle opening time (second)

----
### Built-in functions

Por conveniencia e performance, o IQ Script fornece também grande parte das funções que a IQ Option fornece.

Para consultar como cada função funciona, por favor, utilize a [documentação oficial da IQ Option](https://quadcode-tech.github.io/quadcodescript-docs/).

----

#### Averages

* [x] alma
* [x] ema
* [x] hma
* [ ] rma
* [x] sma
* [x] ssma
* [x] tma
* [x] vidya
* [ ] vwma
* [x] wma

----

#### User Input

* [x] input
* [x] input_group

----

#### Plots

* [ ] fill - DESATIVADO
* [ ] fill_area - DESATIVADO
* [ ] hline - DESATIVADO
* [ ] plot - DESATIVADO
* [ ] plot_candle - DESATIVADO
* [x] plot_shape
* [ ] rect - DESATIVADO

!!! note "Nenhum dos plots irá funcionar, porem o plot_candle é trabalhado de um modo diferente."
	No caso do plot_candle(), o IQ Script é capaz de interpretá-lo como um gatilho de entrada, ele só precisa que no nome do objeto ou no texto que é exibido do grafico tenha:

	* Para CALL: comprar/buy/call
	* Para PUT: vender/sell/put
	
	Explicação sobre a função open_order no final da página.

----

#### Math

* [x] abs
* [x] acos
* [x] asin
* [ ] atan
* [x] ceil
* [x] change
* [ ] correlation
* [x] cos
* [x] deg
* [x] exp
* [x] floor
* [ ] linreg
* [x] log
* [x] mad
* [x] max
* [x] median
* [x] min
* [x] modf
* [ ] percentile_linear_interpolation
* [ ] percentile_nearest_rank
* [x] rad
* [x] round
* [x] sin
* [x] sqrt
* [x] stdev
* [x] sum
* [x] tan



----

#### Oscillators

* [x] cci
* [x] cmo
* [x] stochastic

----

#### Momentum Instruments

* [x] roc
* [x] rsi

----

#### Miscellaneous

* [ ] advise
* [ ] assert
* [ ] bars_since
* [x] bars_since_highest
* [x] bars_since_lowest
* [ ] conditional
* [x] date
* [ ] drop_plot_value
* [x] error
* [x] fixnan
* [ ] get_name
* [x] get_value
* [x] highest
* [x] iff
* [ ] index_range
* [x] instrument
* [ ] is_series
* [x] is_value
* [x] isnan
* [ ] lower_prime
* [x] lowest
* [ ] make_series
* [x] na
* [ ] nz
* [ ] prime_bands
* [ ] print
* [ ] rgb
* [ ] rgba
* [x] sar
* [ ] upper_prime
* [ ] value_when
* [x] version

----

#### Security

* [ ] get_ticker_id
* [x] security

----

#### State Variables

* [ ] current_bar_id
* [ ] current_ticker_id
* [ ] is_daily
* [ ] is_dwm
* [ ] is_intraday
* [ ] is_intrahour
* [ ] is_monthly
* [ ] is_weekly
* [ ] resolution
* [x] runtime_version
* [x] Built-in Types

----

#### Função própria

* [x] open_order

Nesta função é passado a condicional para abertura de entrada e a direção que deve ser feita a entrada.

``` lua

open_order(open > close, 'call')

```

Caso você queira fazer a entrada assim que a função open_order for chamada, basta setar como true.

``` lua

open_order(true, 'call')

```

Se a operação for aberta, a execução do script/indicador é parada até o momento da finalização da operação.