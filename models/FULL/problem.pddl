(define (problem cascading-rg-problem)
  (:domain cascading-rg)

  (:objects
    microsoft-windows-12-server
    internal-network
    allen-bradley-controllogix-plc
    - node
  )

  (:init

    ;; Initial compromised assets from the attack graph
    (has-compromised-customer-pc)
    (has-compromised-engineering-workstations)

    ;; Graph connectivity
    (has-connected microsoft-windows-12-server internal-network)
    (has-connected internal-network allen-bradley-controllogix-plc)

    ;; Windows server vulnerabilities
    (has-vulnerability-CVE-2019-0575 microsoft-windows-12-server)
    (has-vulnerability-CVE-2019-0584 microsoft-windows-12-server)
    (has-vulnerability-CVE-2018-0538 microsoft-windows-12-server)

    ;; VPN/firewall vulnerability condition
    (has-improper-vpn-firewall-configuration microsoft-windows-12-server)
    (has-vulnerability-CVE-2018-0296 microsoft-windows-12-server)

    ;; PLC vulnerability and device type
    (has-vulnerability-CVE-2017-9312 allen-bradley-controllogix-plc)
    (has-exploit-improperly-implemented-fields-in-stack allen-bradley-controllogix-plc)
    (has-Allen-Bradley-L30ERMS-safety-devices-v30-and-earlier allen-bradley-controllogix-plc)
  )

  (:goal
    (and
      (has-fault-flare-flameout)
      )
  )
)