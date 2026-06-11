(define
  (problem cascading-rg-problem)
  (:domain cascading-rg)
  (:objects microsoft-windows-12-server internal-network allen-bradley-controllogix-plc - node)
  (:init
  )
  (:goal (and (has-fault-flare-flameout)))
)
