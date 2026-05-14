#58. Entrar com o numero de termos da serie (n), (n > 0 e, caso não seja, deve ser novamente solicitado),
#e imprimir o valor de H, sendo: H = 1*2+3*2+5*2+... Observacao: cada multiplicacao e um termo. Entender a
#serie e fundamental para a resolucao do problema. - Link Tarefa: https://forms.gle/JuoyFW24HuodeQou37

.data
		msg1: .asciiz "\nInsira um numero maior do que zero: "
		msg2: .asciiz "\nValor da serie H = "
.text
main:
	#Recebendo a entrada:
	
		li $v0, 4
		la $a0, msg1
		syscall
		
		li $v0, 5
		syscall
		add $t1, $v0, 0 #Adiciona o valor lido em $v0 ao registrador $t1 para nao perder a entrada.
		
		blt $t1, 1, main #A entrada deve ser maior do que zero, caso contrario, deve ser solicitada novamente.
		
		add $t2, $t2, 1 #O registrador $t2 sera onde vamos reservar os termos da serie ate chegar no termo $t1.
		mul $t3, $t2, 2 #Registrador $t3 armazena a multiplicacao do termo atual por 2.
		add $t4, $t3, 0 #O registrador $t4 armazena o resultado da serie.
		
serie:
		add $t2, $t2, 2 #Pula direto para o proximo numero impar.
		blt $t1, $t2, PrintSerie #Caso o proximo numero impar ultrapasse a entrada, a serie e interrompida.
		
		mul $t3, $t2, 2 #Calcula o novo termo da serie.
		add $t4, $t4, $t3 #Soma o valor da serie com o novo termo.
		
		j serie #Retorna para a serie, em um loop até que o termo em $t2 ultrapasse a entrada em $t1.
		
PrintSerie:
		li $v0, 4
		la $a0, msg2
		syscall
		
		li $v0, 1
		add $a0, $t4, 0 #Adiciona o valor da serie ao $a0, para que seja dado print do valor no terminal.
		syscall	
		
		