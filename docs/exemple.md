# Exemplos de scripts/indicadores

## PUT / CALL

Fonte desconhecida, autor Janderson Rocha

``` lua title="PUT / CALL"
--DESENVOLVIDO POR JANDERSON ROCHA - (64)9.9944-5856
--PARA ENTENDER O USO DO SCRIPT ENTRE EM CONTATO
instrument { name = "PUT / CALL", icon="indicators:BB", overlay = true }

input_group {
	"COMPRAR", 
	comprar_color = input {default = "green", type = input.color} 
}

input_group {
	"VENDER", 
	vender_color = input {default = "red", type = input.color} 
}

sec = security (current_ticker_id, "5m")

if sec and sec.open_time == open_time then

	base 	  = sma(open, '10')
	high_band = base + (stdev(open, 10) * 2)
	low_band  = base - (stdev(open, 10) * 2)
	media     = sma(close, '20')
	up_band   = media + (stdev(close, 20) * 2.5)
	down_band = media - (stdev(close, 20) * 2.5)
	expo      = ema(close,'100')
	
--IMPULSOS
	
	plot_shape((open > high_band and close < high_band), 
		"VENDER", 
		shape_style.arrowdown, 
		shape_size.huge,
		vender_color, 
		shape_location.abovebar, 
		0, 
		"VENDA", 
		vender_color)

	plot_shape((open < low_band and close > low_band), 
		"COMPRAR", 
		shape_style.arrowup, 
		shape_size.huge,
		comprar_color, 
		shape_location.belowbar, 
		0, 
		"COMPRA", 
		comprar_color)
		
-- RETRAÇÕES	
	
	plot_shape((open < up_band and high > up_band and close <= up_band and expo > up_band), 
		"VENDER1", 
		shape_style.arrowdown, 
		shape_size.huge,
		vender_color, 
		shape_location.abovebar, 
		0, 
		"VENDA RT", 
		vender_color)

	plot_shape((open > down_band and low < down_band and close >= down_band and expo < down_band), 
		"COMPRAR1", 
		shape_style.arrowup, 
		shape_size.huge,
		comprar_color, 
		shape_location.belowbar, 
		0, 
		"COMPRA RT", 
		comprar_color)
		
end
```

## Simple Reversal Point

[https://github.com/sumanblack666/IQ-Option-Lua-scripts/blob/main/Simple%20Reversal%20Point.lua](Fonte)

``` lua title="Simple Reversal Point.lua"
instrument { name = "imple Reversal Point", overlay = true, icon="indicators:ATR" }

c1 = close[1] < open[1] and close > open
c2 = close > open[1]
c3 = lowest(low,3) < lowest (low,50)[1] or lowest(low,3) < lowest(low,50)[2] or lowest(low,3) < lowest(low,50)[3]
buy = c1 and c2 and c3

c4 = close[1] > open[1] and close < open
c5 = close < open[1]
c6 = highest(high,3) > highest (high,50)[1] or highest(high,3) > highest(high,50)[2] or highest(high,3) > highest(high,50)[3]
sell = c4 and c5 and c6

plot_shape(buy, "long", shape_style.triangleup, shape_size.large, 'green', shape_location.belowbar,0,'BUY', 'green')
plot_shape(sell , "short", shape_style.triangledown, shape_size.large, 'red', shape_location.abovebar,0,'SELL', 'red')
```

----

## Vdubs Mr Mani

[https://github.com/sumanblack666/IQ-Option-Lua-scripts/blob/main/Vdubs%20Mr%20Mani.lua](Fonte)

``` lua title="Vdubs Mr Mani.lua"
instrument { name = "Vdubs Mr Mani", overlay = true, icon="indicators:ATR" }

input_group {
    "front.ind.dpo.generalline",
    up_color = input { default = "#58FF44", type = input.color },
    down_color = input { default = "#57A1D0", type = input.color },
    width = input { default = 1, type = input.line_width }
}

fn     = input (averages.ema, "front.newind.average", input.string_selection, averages.titles)

local avg = averages [fn]
--ema signal 1
src0 = close
len0 = 13
ema0 = ema(src0, len0)
rising1 = ema0[0] > ema0[1] and ema0[1] > ema0[2]
falling1 = ema0[2] > ema0[1] and ema0[1] > ema0[0]
--
direction = iff(rising1, 1,iff(falling1, -1, 0 ))
plot_color = iff(direction > 0 , up_color,iff( direction < 0, down_color , na))
plot(ema0, 'EMA', plot_color , width, -1, style.solid_line, na_mode.continue)
--ema signal 2
src02 = close
len02 = 21
ema02 = ema(src02, len02)
rising2 = ema02[0] > ema02[1] and ema02[1] > ema02[2]
falling2 = ema02[2] > ema02[1] and ema02[1] > ema02[0]
direction2 = iff(rising2, 1,iff(falling2, -1, 0 ))
plot_color2 = iff(direction2 > 0 , up_color,iff( direction2 < 0, down_color , na))
plot(ema02, 'EMA Signal 2', plot_color2 , width, -1, style.solid_line, na_mode.continue)

--ema signal out

fast = 5
slow = 8
avg0 = (low + close)/2
avg1 = (high + close)/2
vh1 = ema(highest(avg0, fast), 5)
vl1 = ema(lowest(avg1, slow), 8)
--print(vl1)

e_ema1 = ema(close, 1)
e_ema2 = ema(e_ema1, 1)
e_ema3 = ema(e_ema2, 1)
tema = 1 * (e_ema1 - e_ema2) + e_ema3
--print(tema)


e_e1 = ema(close, 8)
e_e2 = ema(e_e1, 5)
dema = 2 * e_e1 - e_e2
--print(dema)
signal = iff(tema > dema , max (vh1, vl1) , min (vh1, vl1))
--print(signal)


is_call = tema > dema and signal > low and (signal-signal[1] > signal[1]-signal[2])
is_put = tema < dema and signal < high and (signal[1]-signal > signal[2]-signal[1])


period = 30
plot_shape(iff(is_call and direction > 0 , 1, na), "long", shape_style.triangleup, shape_size.large, 'green', shape_location.belowbar,0,'BUY', 'green')
plot_shape(iff(is_put and direction < 0, 1, na) , "short", shape_style.triangledown, shape_size.large, 'red', shape_location.abovebar,0,'SELL', 'red')
plot (hma (src0, period), "HMA", '#FF00FF', 2)
```