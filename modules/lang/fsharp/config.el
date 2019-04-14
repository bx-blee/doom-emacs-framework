;;; lang/fsharp/config.el -*- lexical-binding: t; -*-

(after! fsharp-mode
  (setq fsharp-ac-use-popup nil) ; Use a buffer for docs rather than a pop-up
  (set-lookup-handlers! 'fsharp-mode :async t :definition #'fsharp-ac/gotodefn-at-point)
  (set-company-backend! 'fsharp-mode 'fsharp-ac/company-backend)
  (set-repl-handler! 'fsharp-mode #'fsharp-show-subshell)
  (map! :localleader
        :map fsharp-mode-map
        "b" #'fsharp-ac/pop-gotodefn-stack ; Useful for re-tracing your steps
        "l" #'fsharp-load-buffer-file
        "q" #'fsharp-ac/stop-process
        "t" #'fsharp-ac/show-tooltip-at-point))
