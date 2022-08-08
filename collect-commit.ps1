# Will commit with a time-formatted message
# e.g. "Collect 07/11/2020 16:45 (-03:00)"
git commit -m ("Collect " + (get-date -format "dd/MM/yyyy HH:mm (K)"))
