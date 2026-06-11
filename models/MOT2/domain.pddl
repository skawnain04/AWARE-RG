(define
  (domain cascading-rg)
  (:requirements :strips :typing)
  (:types node)
  (:predicates
    (plc-offline ?node - node)
    (has-fault-valve-blocked-close-due-to-compromised ?node - node)
    (has-fault-manual-isolation-valve-close-due-to-compromised ?node - node)
    (has-fault-pilot-low-supply-pressure-due-to-compromised ?node - node)
    (has-fault-pilot-extinction-due-to-compromised ?node - node)
    (has-fault-flare-flameout)
  )
  (:action access-to-windows-server-from-customer-pc
    :parameters (?server - node)
    :precondition (and)
    :effect (and)
  )
  (:action access-to-windows-server-from-engineering-workstations
    :parameters (?server - node)
    :precondition (and)
    :effect (and)
  )
  (:action exploits-vulnerability-CVE-2019-0575
    :parameters (?at - node)
    :precondition (and)
    :effect (and)
  )
  (:action exploits-vulnerability-CVE-2019-0584
    :parameters (?at - node)
    :precondition (and)
    :effect (and)
  )
  (:action exploits-vulnerability-CVE-2018-0538
    :parameters (?at - node)
    :precondition (and)
    :effect (and)
  )
  (:action gain-network-access-from-remote-code-execution
    :parameters (?at - node ?to - node)
    :precondition (and)
    :effect (and)
  )
  (:action exploits-vulnerability-CVE-2018-0296
    :parameters (?at - node ?to - node)
    :precondition (and)
    :effect (and)
  )
  (:action access-to-plc-port-1132-tcp
    :parameters (?at - node ?plc - node)
    :precondition (and)
    :effect (and)
  )
  (:action exploits-vulnerability-CVE-2017-9312
    :parameters (?at - node ?to - node)
    :precondition (and)
    :effect
      (and
        
            (plc-offline ?to)
          )
  )
  (:action causes-fault-valve-blocked-close
    :parameters (?plc - node)
    :precondition
      (and
            
            (plc-offline ?plc)
          )
    :effect (and (has-fault-valve-blocked-close-due-to-compromised ?plc))
  )
  (:action causes-fault-manual-isolation-valve-close
    :parameters (?plc - node)
    :precondition (and (has-fault-valve-blocked-close-due-to-compromised ?plc))
    :effect (and (has-fault-manual-isolation-valve-close-due-to-compromised ?plc))
  )
  (:action causes-fault-pilot-low-supply-pressure
    :parameters (?plc - node)
    :precondition (and (has-fault-manual-isolation-valve-close-due-to-compromised ?plc))
    :effect (and (has-fault-pilot-low-supply-pressure-due-to-compromised ?plc))
  )
  (:action causes-fault-pilot-extinction
    :parameters (?plc - node)
    :precondition (and (has-fault-pilot-low-supply-pressure-due-to-compromised ?plc))
    :effect (and (has-fault-pilot-extinction-due-to-compromised ?plc))
  )
  (:action causes-fault-flare-flameout
    :parameters (?plc - node)
    :precondition (and (has-fault-pilot-extinction-due-to-compromised ?plc))
    :effect (and (has-fault-flare-flameout))
  )
)
