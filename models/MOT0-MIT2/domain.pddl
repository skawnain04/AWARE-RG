(define (domain cascading-rg-problem-domain)
 (:requirements :strips :typing)
 (:types node)
 (:predicates 

 (has-connected ?at - node ?to - node)
 (has-access-to-windows-server ?node - node)
 (has-vulnerability-cve-2019-0575 ?node - node)
 (has-vulnerability-cve-2019-0584 ?node - node)
 (has-vulnerability-cve-2018-0538 ?node - node)
 (has-done-remote-code-execution ?node - node)
 
 (has-vulnerability-cve-2018-0296 ?node - node)
 (has-access-to-network ?node - node)
 (has-vulnerability-cve-2017-9312 ?node - node)
 (has-exploit-improperly-implemented-fields-in-stack ?node - node)
 (has-access-to-plc-port-1132-tcp ?node - node)
 (has-done-denial-of-service-in-plc1 ?node - node)
 (plc-offline ?node - node)
 
 (has-fault-valve-blocked-close-due-to-compromised ?node - node)
 (has-fault-manual-isolation-valve-close-due-to-compromised ?node - node)
 (has-fault-pilot-low-supply-pressure-due-to-compromised ?node - node)
 (has-fault-pilot-extinction-due-to-compromised ?node - node)
 (has-fault-flare-flameout)
 (has-mitre-ics-initial-access))
 (:action access-to-windows-server-from-customer-pc
 :parameters (?server - node)
 :precondition (and (has-mitre-ics-initial-access))
 :effect (and (has-access-to-windows-server ?server)))
 (:action access-to-windows-server-from-engineering-workstations
 :parameters (?server - node)
 :precondition (and (has-mitre-ics-initial-access))
 :effect (and (has-access-to-windows-server ?server)))
 (:action exploits-vulnerability-cve-2019-0575
 :parameters (?at - node)
 :precondition (and (has-access-to-windows-server ?at) (has-vulnerability-cve-2019-0575 ?at))
 :effect (and (has-done-remote-code-execution ?at)))
 (:action exploits-vulnerability-cve-2019-0584
 :parameters (?at - node)
 :precondition (and (has-access-to-windows-server ?at) (has-vulnerability-cve-2019-0584 ?at))
 :effect (and (has-done-remote-code-execution ?at)))
 (:action exploits-vulnerability-cve-2018-0538
 :parameters (?at - node)
 :precondition (and (has-access-to-windows-server ?at) (has-vulnerability-cve-2018-0538 ?at))
 :effect (and (has-done-remote-code-execution ?at)))
 (:action gain-network-access-from-remote-code-execution
 :parameters (?at - node ?to - node)
 :precondition (and (has-done-remote-code-execution ?at) (has-connected ?at ?to))
 :effect (and (has-access-to-network ?to)))
 (:action exploits-vulnerability-cve-2018-0296
 :parameters (?at - node ?to - node)
 :precondition (and (has-vulnerability-cve-2018-0296 ?at) (has-connected ?at ?to) (has-mitre-ics-initial-access))
 :effect (and (has-access-to-network ?to)))
 (:action access-to-plc-port-1132-tcp
 :parameters (?at - node ?plc - node)
 :precondition (and (has-access-to-network ?at) (has-connected ?at ?plc))
 :effect (and (has-access-to-plc-port-1132-tcp ?plc)))
 (:action exploits-vulnerability-cve-2017-9312
 :parameters (?at - node ?to - node)
 :precondition (and (has-connected ?at ?to) (has-access-to-network ?at) (has-access-to-plc-port-1132-tcp ?to) (has-vulnerability-cve-2017-9312 ?to) (has-exploit-improperly-implemented-fields-in-stack ?to))
 :effect (and (has-done-denial-of-service-in-plc1 ?to) (plc-offline ?to)))
 (:action causes-fault-valve-blocked-close
 :parameters (?plc - node)
 :precondition (and (has-done-denial-of-service-in-plc1 ?plc) (plc-offline ?plc))
 :effect (and (has-fault-valve-blocked-close-due-to-compromised ?plc)))
 (:action causes-fault-manual-isolation-valve-close
 :parameters (?plc - node)
 :precondition (and (has-fault-valve-blocked-close-due-to-compromised ?plc))
 :effect (and (has-fault-manual-isolation-valve-close-due-to-compromised ?plc)))
 (:action causes-fault-pilot-low-supply-pressure
 :parameters (?plc - node)
 :precondition (and (has-fault-manual-isolation-valve-close-due-to-compromised ?plc))
 :effect (and (has-fault-pilot-low-supply-pressure-due-to-compromised ?plc)))
 (:action causes-fault-pilot-extinction
 :parameters (?plc - node)
 :precondition (and (has-fault-pilot-low-supply-pressure-due-to-compromised ?plc))
 :effect (and (has-fault-pilot-extinction-due-to-compromised ?plc)))
 (:action causes-fault-flare-flameout
 :parameters (?plc - node)
 :precondition (and (has-fault-pilot-extinction-due-to-compromised ?plc))
 :effect (and (has-fault-flare-flameout))))
