(deftemplate user
	(slot nameUser)
	(slot maxCost
		(type INTEGER))
	(multislot language
		(type SYMBOL))
	(multislot typeTravel
		(type SYMBOL)
		(allowed-values entertainment cultural landscape))
)

(deftemplate destination
	(slot nameDestination)
	(multislot country
		(type SYMBOL))
	(multislot likes
		(type SYMBOL)
		(allowed-values entertainment cultural landscape))
)

(deftemplate country
	(slot countryName)
	(multislot language
		(type SYMBOL)(default english))
	(slot cost
		(type INTEGER))
)

(defrule countryFilter
	(declare (salience 0))
	(user (nameUser ?nu)(maxCost ?c))
	(country (countryName ?n)(cost ?cc))
	(test (>= ?c ?cc))
	=>
	(assert (filterCountry ?n))
)

(defrule costFilter
	(declare (salience -10))
	(destination (nameDestination ?nd)(country ?c) (likes $?likes))
	(filterCountry ?n)
	(test (eq ?n ?c))
	=>
	(assert (filterDestination ?nd ?c $?likes))
)

(defrule languageFilter
	(declare (salience -20))
	(filterDestination ?nd ?c $?likes)
	(user (language $?li ?lu $?ld))
	(country (countryName ?cn&:(eq ?cn ?c))(language $?l&:(member$ ?lu $?l)))
	=>
	(assert (filterDestinationByLanguage ?nd ?c $?likes))
)

(deffunction intersection (?a ?b)
	 (bind ?r (create$))
	 (foreach ?e ?a
		 (if (and (member$ ?e ?b) (not (member$ ?e ?r)))
			then (bind ?r (create$ ?r ?e))))
	 (return (length$ ?r))
)
 
(defrule likesFilter
	(declare (salience -30))
	(filterDestinationByLanguage ?nd ?c $?likes)
	(user (typeTravel $?tt))
	(test (> (intersection $?tt $?likes) 0))
	(test (>= (intersection $?tt $?likes) (length$ $?tt)))
	=>
	(assert (likeDestinations ?nd (intersection $?likes $?tt)))
)





