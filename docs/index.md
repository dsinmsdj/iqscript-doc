---
hide:
  - navigation
  - toc
---

# O que é o IQ Script?

Basicamente, é um sistema projetado para rodar localmente grande parte dos scripts em Lua feitos para a IQ Option.

Não é necessário utilizar nenhum sistema extra, o script que irá rodar no IQ Script não precisa nem estar na plataforma pois tudo é calculado em tempo real pelo sistema.


## Change Logs

#### 27/12/2021 - v1.2

* O sistema agora consegue identificar a direção do sinal baseado na direção da seta(arrowup/arrowdown) do plot_shape()
* Correção nos calculos referente as funções/dados build-in
* input_group{} Ajustado

----

#### 16/12/2021 - v1.1

* Adicionado a opção de passar a fonte e o periodo em string para os indicadores(sma, rma, ema, etc)
* rma() adicinado (indicador rolling moving average)
* vwma() adicinado (indicador volume weighted moving average)
* nz() adicionado
* get_value() corrigido
* na() corrigido
* tr adicionado
* highest() retrabalhado para funcionar igual o da IQ Option
* lowest() retrabalhado para funcionar igual o da IQ Option
* Soros adicionado

!!! danger "Sobre o indicado SSMA"
	ssma() está sendo trabalhando ainda, o retorno do indicador esta vindo com a 5º casa numérica (taxa menores que 0. é na 5º casa decimal) errada, resultando em um funcionamento incorreto.
	A utilização deste indicador não é recomendada até que seja ajustado, use por sua conta e risco.

----

#### 17/11/2021 - v1.0

* Primeira versão disponibilizada

----

## Contato

-  :fontawesome-brands-telegram:{ .telegram } – [Telegram ](https://t.me/iqcoding_vip)
-  :fontawesome-brands-youtube:{ .youtube } – [Youtube ](https://t.me/iqcoding_vip)
-  :fontawesome-brands-instagram:{ .instagram } – [Instagram ](https://instagram.com/iq.coding)
