(define (problem cascading-rg-problem-problem)
 (:domain cascading-rg-problem-domain)
 (:objects
 microsoft-windows-12-server internal-network allen-bradley-controllogix-plc - node)
 (:init

 (has-connected microsoft-windows-12-server internal-network)
 (has-connected internal-network allen-bradley-controllogix-plc)

 (has-mitre-ics-initial-access)
 (has-mitre-ics-execution)
 (has-mitre-ics-discovery))
 (:goal (and 
 (has-fault-flare-flameout))))
