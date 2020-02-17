#"152","2015-02-02 14:31:00",23.7,26.6,475.25,832,0.00482410383674874,1
def leitura_entrada(path):
	arq = []
	f = open(path)
	m = 0
	for i in f:
		if m != 0:
			var = i[:len(i)-1].split(',')[1:]
			ap = [date_to_seconds(var[0][1:len(var[0])-1]), float(var[1]), float(var[2]), float(var[3]), float(var[4]), float(var[5])]
			arq.append(ap)
		m += 1
		
	return (arq)
	
	
#"2015-02-02 14:31:00"
#converte a data para um numero inteiro para fazer a distancia euclidiana entre o neuronio e a entrada
def date_to_seconds(date_string):
	d = date_string.split(" ")
	date = d[0].split("-")
	time = d[1].split(":")
	
	y = int(date[0])
	m = int(date[1])
	d = int(date[2])
	ho = int(time[0])
	mi = int(time[1])
	se = int(time[2])
	
	return y*360*12*30*24*60*60 + m*30*24*60*60 + d*24*60*60 + ho*60*60 + mi*60 + se
	
