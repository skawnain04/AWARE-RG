(define (problem cascading-rg-problem-problem)
 (:domain cascading-rg-problem-domain)
 (:objects
 microsoft-windows-12-server internal-network allen-bradley-controllogix-plc - node)
 (:init
 (has-compromised-customer-pc)
 (has-compromised-engineering-workstations)
 (has-connected microsoft-windows-12-server internal-network)
 (has-connected internal-network allen-bradley-controllogix-plc)
 (has-vulnerability-cve-2019-0575 microsoft-windows-12-server)
 (has-vulnerability-cve-2019-0584 microsoft-windows-12-server)
 (has-vulnerability-cve-2018-0538 microsoft-windows-12-server)
 (has-improper-vpn-firewall-configuration microsoft-windows-12-server)
 (has-vulnerability-cve-2018-0296 microsoft-windows-12-server)
 (has-vulnerability-cve-2017-9312 allen-bradley-controllogix-plc)
 (has-exploit-improperly-implemented-fields-in-stack allen-bradley-controllogix-plc)
 (has-allen-bradley-l30erms-safety-devices-v30-and-earlier allen-bradley-controllogix-plc))
 (:goal (and 
 (has-fault-flare-flameout))))
