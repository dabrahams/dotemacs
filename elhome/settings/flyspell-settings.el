(eval-after-load 'flyspell
  '(let ((map flyspell-mode-map))
     (define-key map [(control ?\,)] 'backward-word)
     (define-key map [(control ?\.)] 'forward-word)
     (define-key map [(control meta ?\,)] 'flyspell-goto-next-error)
     (define-key map [(control meta ?\.)] 'flyspell-auto-correct-word)))
