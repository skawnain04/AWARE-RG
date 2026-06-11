(define (domain cascading-rg-problem-domain)
 (:requirements :strips :typing)
 (:types node)
 (:predicates 
 (has-compromised-customer-pc)
 (has-compromised-engineering-workstations)

 (has-vulnerability-cve-2019-0575 ?node - node)
 (has-vulnerability-cve-2019-0584 ?node - node)
 (has-vulnerability-cve-2018-0538 ?node - node)
 (has-done-remote-code-execution ?node - node)
 (has-improper-vpn-firewall-configuration ?node - node)
 (has-vulnerability-cve-2018-0296 ?node - node)
 
 (has-vulnerability-cve-2017-9312 ?node - node)
 (has-exploit-improperly-implemented-fields-in-stack ?node - node)

 (has-fault-flare-flameout)

 (has-mitre-ics-impair-process-control))
 (:action access-to-windows-server-from-customer-pc
 :parameters (?server - node)
 :precondition (and (has-compromised-customer-pc))
 :effect (and))
 (:action access-to-windows-server-from-engineering-workstations
 :parameters (?server - node)
 :precondition (and (has-compromised-engineering-workstations))
 :effect (and))
 (:action exploits-vulnerability-cve-2019-0575
 :parameters (?at - node)
 :precondition (and (has-vulnerability-cve-2019-0575 ?at))
 :effect (and (has-done-remote-code-execution ?at)))
 (:action exploits-vulnerability-cve-2019-0584
 :parameters (?at - node)
 :precondition (and (has-vulnerability-cve-2019-0584 ?at))
 :effect (and (has-done-remote-code-execution ?at)))
 (:action exploits-vulnerability-cve-2018-0538
 :parameters (?at - node)
 :precondition (and (has-vulnerability-cve-2018-0538 ?at))
 :effect (and (has-done-remote-code-execution ?at)))
 (:action gain-network-access-from-remote-code-execution
 :parameters (?at - node ?to - node)
 :precondition (and (has-done-remote-code-execution ?at))
 :effect (and))
 (:action exploits-vulnerability-cve-2018-0296
 :parameters (?at - node ?to - node)
 :precondition (and (has-improper-vpn-firewall-configuration ?at) (has-vulnerability-cve-2018-0296 ?at))
 :effect (and))
 (:action access-to-plc-port-1132-tcp
 :parameters (?at - node ?plc - node)
 :precondition (and)
 :effect (and))
 (:action exploits-vulnerability-cve-2017-9312
 :parameters (?at - node ?to - node)
 :precondition (and (has-vulnerability-cve-2017-9312 ?to) (has-exploit-improperly-implemented-fields-in-stack ?to))
 :effect (and (has-mitre-ics-impair-process-control)))
 (:action causes-fault-valve-blocked-close
 :parameters (?plc - node)
 :precondition (and (has-mitre-ics-impair-process-control))
 :effect (and (has-mitre-ics-impair-process-control)))
 (:action causes-fault-manual-isolation-valve-close
 :parameters (?plc - node)
 :precondition (and (has-mitre-ics-impair-process-control))
 :effect (and (has-mitre-ics-impair-process-control)))
 (:action causes-fault-pilot-low-supply-pressure
 :parameters (?plc - node)
 :precondition (and (has-mitre-ics-impair-process-control))
 :effect (and (has-mitre-ics-impair-process-control)))
 (:action causes-fault-pilot-extinction
 :parameters (?plc - node)
 :precondition (and (has-mitre-ics-impair-process-control))
 :effect (and (has-mitre-ics-impair-process-control)))
 (:action causes-fault-flare-flameout
 :parameters (?plc - node)
 :precondition (and (has-mitre-ics-impair-process-control))
 :effect (and (has-fault-flare-flameout))))
