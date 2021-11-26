# Com o IQ Script, você pode proteger seus indicadores!

Tendo o metatrader como inspiração, toda vez que você abrir o IQ Script, ele irá analisar os scripts/indicadores que estiverem na pasta scripts e se tudo estiver certo com eles, será gerado um arquivo .iqs.

Este arquivo {++.iqs++}, é protegido por criptografia, com isto você pode ter segurança em repassar ou revender seus scripts/indicadores para terceiros!

Além disso, adicionamos o metodo "key" e "email", com estes metodos você tem 3 metodos possíveis de segurança.

Caso o arquivo tenha algum dos metodos de segurança inserido, assim que o scripts/indicador for executado pelo IQ Script, será solicitado a chave caso o metodo key tenha sido passado, caso tenha sido o metodo email ele irá verificar por conta.

----

## Onde colocar estes metodos

Ambos os metodos devem ser colocados dentro do instrument {}, exemplo:

``` lua title="exemplo_instrument.lua"
instrument { 
	name="Codigo de exemplo",
	short_name="C.E",
	overlay="True",
	key="12345678",
	email="exemplo@gmail.com"
}
```

----

## Metodo key

Com o metodo key, você estará definindo uma chave de acesso para o scripts/indicador ser executado.
Quando o IQ Script iniciar o seu script/indicador, ele irá reconhecer o metodo e solicitar a chave ao usuário, o sistema só irá processeguir após uma chave correta ser inserida.
Esta chave fica salva localmente para o usuário não precisar ficar tendo que reinserir toda vez que inicia, por isto é tido como um metodo mais simples de proteção.

``` lua title="exemplo_instrument_key.lua"
instrument { 
	name="Codigo de exemplo",
	short_name="C.E",
	overlay="True",
	key="12345678"
}
```

----

## Metodo email

Com o metodo email, o script/indicador só irá executar caso o email que foi indicado para logar na IQ, ou seja, operar, for o mesmo que está definido no script pela chave email, este metodo é mais seguro caso você queira
 garantir que somente aquele usuário especifico irá conseguir executar seu script/indicador.

``` lua title="exemplo_instrument_email.lua"
instrument { 
	name="Codigo de exemplo",
	short_name="C.E",
	overlay="True",
	email="exemplo@gmail.com"
}
```

----

## Utilizando ambos

Se você deseja o máximo de segurança, é recomendado utilizar ambos os metodos, assim você tem dupla proteção para caso o seu cliente deseje tente enviar seu script/indicador para terceiros, ele não irá conseguir executar mesmo tendo o arquivo em maos.

``` lua title="exemplo_instrument_ambos.lua"
instrument { 
	name="Codigo de exemplo",
	short_name="C.E",
	overlay="True",
	key="12345678",
	email="exemplo@gmail.com"
}
```




