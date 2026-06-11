(define
  (problem cascading-rg-problem)
  (:domain cascading-rg)
  (:objects microsoft-windows-12-server internal-network allen-bradley-controllogix-plc - node)
  (:init
    (has-connected microsoft-windows-12-server internal-network)
    (has-connected internal-network allen-bradley-controllogix-plc)
  )
  (:goal (and (has-fault-flare-flameout)))
)
