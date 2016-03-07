(deffacts travellers
	(user (nameUser Eladio)(maxCost 3)(language spanish) (typeTravel cultural))
)

(deffacts countries
	(country (countryName spain) (language catalan spanish english) (cost 2))
	(country (countryName england) (language english) (cost 3))
	(country (countryName germany) (language spanish german) (cost 4))
	(country (countryName brazil) (language english spanish) (cost 1))
	(country (countryName argentina) (language english spanish) (cost 2))
	(country (countryName japon) (language chinesse) (cost 3))
	(country (countryName gales) (language english) (cost 3))
)

(deffacts destinations
	(destination (nameDestination valencia) (country spain) (likes cultural))
	(destination (nameDestination sevilla) (country spain) (likes cultural landscape))
	(destination (nameDestination london) (country england) (likes entertainment))
	(destination (nameDestination glasgow) (country germany) (likes entertainment))
	(destination (nameDestination rio) (country brazil) (likes landscape cultural))
	(destination (nameDestination rosario) (country argentina) (likes landscape entertainment))
	(destination (nameDestination tokio) (country japon) (likes entertainment cultural))
	(destination (nameDestination erty) (country gales) (likes cultural))
	(destination (nameDestination nagasaki) (country japon) (likes cultural entertainment))
	(destination (nameDestination buenosAires) (country argentina) (likes cultural entertainment landscape))
)


