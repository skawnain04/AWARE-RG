(define
  (domain cascading-rg)
  (:requirements :strips :typing)
  (:types node)
  (:predicates
    (has-connected ?at - node ?to - node)
    (has-access-to-windows-server ?node - node)
    (has-access-to-network ?node - node)
    (has-access-to-plc-port-1132-tcp ?node - node)
    (has-done-denial-of-service-in-PLC1 ?node - node)
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
    :effect (and (has-access-to-windows-server ?server))
  )
  (:action access-to-windows-server-from-engineering-workstations
    :parameters (?server - node)
    :precondition (and)
    :effect (and (has-access-to-windows-server ?server))
  )
  (:action exploits-vulnerability-CVE-2019-0575
    :parameters (?at - node)
    :precondition (and (has-access-to-windows-server ?at))
    :effect (and)
  )
  (:action exploits-vulnerability-CVE-2019-0584
    :parameters (?at - node)
    :precondition (and (has-access-to-windows-server ?at))
    :effect (and)
  )
  (:action exploits-vulnerability-CVE-2018-0538
    :parameters (?at - node)
    :precondition (and (has-access-to-windows-server ?at))
    :effect (and)
  )
  (:action gain-network-access-from-remote-code-execution
    :parameters (?at - node ?to - node)
    :precondition (and (has-connected ?at ?to))
    :effect (and (has-access-to-network ?to))
  )
  (:action exploits-vulnerability-CVE-2018-0296
    :parameters (?at - node ?to - node)
    :precondition (and (has-connected ?at ?to))
    :effect (and (has-access-to-network ?to))
  )
  (:action access-to-plc-port-1132-tcp
    :parameters (?at - node ?plc - node)
    :precondition
      (and
            (has-access-to-network ?at)
            (has-connected ?at ?plc)
          )
    :effect (and (has-access-to-plc-port-1132-tcp ?plc))
  )
  (:action exploits-vulnerability-CVE-2017-9312
    :parameters (?at - node ?to - node)
    :precondition
      (and
            (has-connected ?at ?to)
            (has-access-to-network ?at)
            (has-access-to-plc-port-1132-tcp ?to)
          )
    :effect
      (and
            (has-done-denial-of-service-in-PLC1 ?to)
            (plc-offline ?to)
          )
  )
  (:action causes-fault-valve-blocked-close
    :parameters (?plc - node)
    :precondition
      (and
            (has-done-denial-of-service-in-PLC1 ?plc)
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
