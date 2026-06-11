(define (problem cascading-rg-problem-problem)
 (:domain cascading-rg-problem-domain)
 (:objects
 microsoft-windows-12-server internal-network allen-bradley-controllogix-plc - node)
 (:init
 (has-compromised-customer-pc)
 (has-compromised-engineering-workstations)

 (has-improper-vpn-firewall-configuration microsoft-windows-12-server)

 (has-mitre-ics-lateral-movement))
 (:goal (and 
 (has-fault-flare-flameout))))
