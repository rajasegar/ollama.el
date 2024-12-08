;; ollama.el

(defvar *ollama-models* '("qwen2.5:0.5b" "qwen2.5-coder:1.5b" "llama3.2:1b"))

(defun ollama-list ()
  "List models"
  (interactive)
  (async-shell-command "ollama list"))

;; (ollama-list)

(defun ollama-show (model)
  "Show information for a model"
  (interactive)
  (async-shell-command (format "ollama show %s" model)))

;; (ollama-show "llama3.2")


(defun ollama-ps ()
  "List running models"
  (interactive)
  (async-shell-command "ollama ps"))

;; (ollama-ps)

(defun ollama-rm (model)
  "Remove a model"
  (interactive)
  (async-shell-command (format "ollama rm %s")))

;; (ollama-rm "")


(defun ollama-help (cmd)
  "Help about any command"
  (interactive)
  (async-shell-command (format "ollama help %s" cmd)))

;; (ollama-help "create")
(ollama-help "pull")

(defun ollama-version ()
  "Show version information"
  (interactive)
  (async-shell-command "ollama -v" (get-buffer-create "*ollama output*")))

(ollama-version)

(shell-command-to-string "ollama -v")

(message (replace-regexp-in-string "ollama version is " "" "ollama version is 0.3.14"))



(defun ollama()
  "Run a ollama mode"
  (interactive)
  (let ((prompt (read-string "What is the prompt? ")))
    (async-shell-command
     (format "ollama run %s %s" (ido-completing-read "Select a model: " *ollama-models*) prompt)))
  )

(defun ollama-run(model prompt)
  "Run a ollama mode"
    (async-shell-command
     (format "ollama run %s %s" model prompt)))


(defun ollama-ask()
  "Ask a question for ollama"
  (interactive)
  (let ((prompt (read-string "What is the question? ")))
    (ollama-run "qwen2.5:0.5b" prompt)
    ))

(defun ollama-code()
  "Ask a coding question for ollama"
  (interactive)
  (let ((prompt (read-string "What is the problem? ")))
    (ollama-run "qwen2.5-coder:1.5b" prompt)
    ))

