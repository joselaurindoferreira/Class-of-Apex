Map<Id, Account> mapAccount = new Map<Id, Account>([SELECT Id, Name FROM Account LIMIT 10]); 

for(Id idChave : mapAccount.keySet()){
	Account acc = mapAccount.get(idChave);

	System.debug('Account por ID: '+acc);
}

if(mapAccount.isEmpty()){
	System.debug('Mapa está vazio');
}else{
	System.debug('Mapa está cheio');
}