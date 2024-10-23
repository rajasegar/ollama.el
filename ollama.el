;; ollama.el

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

(defun ollama-run (model)
  "Run a model"
  (interactive)
  (async-shell-command (format "ollama run %s" model)))

;; (ollama-run "llama3.2")

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


