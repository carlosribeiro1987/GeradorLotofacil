# GeradorLotofacil
## Gera, confere e imprime jogos da Lotofácil
Projeto desenvolvido como hobby no Delphi 2010. Baseado no último resultado (informado pelo usuário), são gerados 4 jogos que podem ser impressos
e salvos para conferir posteriormente.

## Descrição do programa:
### Informando o ultimo resultado
Ao iniciar, o programa solicita que o usuário informe o último resultado da Lotofácil, que pode ser obtido no [site da Caixa](http://loterias.caixa.gov.br/wps/portal/loterias/landing/lotofacil/).
Posteriormente, essa janela poderá ser substituída por alguma API da Caixa que obtenha o resultado automaticamente (não encontrei até o momento).

![Janela Último Resultado](http://i.imgur.com/JPcSvEW.png)

### **Janela Principal**
Após informar o último resultado, o usuário pode optar por gerar os jogos  automaticamente ou informar manualmente quais números pretende incluir nos jogos gerados.

Gerar jogos automaticamente | Escolher os números manualmente
----------------------------|--------------------------------
![Janela Principal - Gerar Jogos automaticamente](http://i.imgur.com/WzWUEnm.png) | ![Janela Pincipal - Escolher os números manualmente](http://i.imgur.com/zKLUmwR.png)

### Os jogos gerados
Após clicar no botão **Gerar Jogos**, será apresentada uma janela exibindo os quatro jogos gerados pelo programa.
O usuário pode então imprimir e/ou salvar os jogos para conferir através do programa. A imagem abaixo mostra a janela exibindo os jogos gerados.

![Jogos Gerados](http://i.imgur.com/HqHJEw6.png)

### Imprimindo os volantes

Ao clicar no botão **Imprimir**  na janela com os jogos gerados (mostrada acima), é exibida a janela de ajustes de impressão.
Como as medidas dos volantes não seguem um padrão fixo, o usuário deve informar as medidas das regiões exibidas nas imagens.
Os quatro jogos gerados seão impressos em dois volantes da Lotofácil, que o usuário obtém em qualquer casa lotérica.

**Obs:**
_A função de impressão foi testada em uma impressora **HP 3920**._
_Não tive a oportunidade de testá-la em outras marcas/modelos de impressora._

![Impressão dos Volantes](http://i.imgur.com/NkKYOj9.png)

### Conferindo Jogos

O usuário pode conferir os jogos gerados de maneira automática através do botão **Conferir Jogo** na janela principal.
Os jogos salvos são arquivos de texto plano com extensão __*.ltf__.
A figura abaixo mostra a janela com os jogos conferidos.

![Conferir Jogos Salvos](http://i.imgur.com/1cUODPF.png)

### Como os jogos são gerados?

Baseado no último resultado, o algoritmo de geração automática de jogos escolhe:

* __Dezenas fixas__
 * Quatro dezenas ímpares que saíram no último sorteio
 * Quatro dezenas pares que saíram no último sorteio
 * Uma dezena ímpar e uma dezena par que não saíram no último sorteio

* __Primeira Combinação__
 * Duas dezenas ímpares que não saíram no último sorteio
 * Três dezenas pares que não saíram no último sorteio

* __Segunda Combinação__
 * Duas dezenas pares
 * Três dezenas ímpares

* __Terceira Combinação__
 * As dezenas restantes não incluídas nas combinações anteriores.
  
Dessa forma, acertando as dezenas fixas e uma das combinações, ganha-se o prêmio máximo. O mesmo ocorre caso não acerte nenhuma das dezenas fixas.
No método manual, a escolha das dezenas fica a critério do usuário

## Licença:
Este programa está sob a licença [GPL 3.0](https://www.gnu.org/licenses/gpl-3.0.txt)
Você pode alterar e distribuir este programa, desde que mantido os créditos do criador. Para mais informações, consulte a [licença GPL v.3](https://www.gnu.org/licenses/gpl-3.0.txt).

