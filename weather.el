(require 'url)
(require 'json)

;; Retrieve JSON weather
(defun get-weather (search-query)
  (with-current-buffer
      (url-retrieve-synchronously
       (format "http://api.openweathermap.org/data/2.5/weather?q=%S" search-query))
    (goto-char (point-min))
    (search-forward "\n\n")
    (delete-region (point-min) (point))
    (json-read-object)))



(defvar sample-results (get-weather 'toronto))


(print sample-results)
;; Pressure
(elt (cdr (assoc 'main sample-results))
     0)

;; Temp max
(elt (cdr (assoc 'main sample-results))
     1)

;; Temp min
(elt (cdr (assoc 'main sample-results))
     2)

;; Humidity
(elt (cdr (assoc 'main sample-results))
     3)

;; Temp
(elt (cdr (assoc 'main sample-results))
     4)

(assoc 'coord sample-results)
(elt (cdr (assoc 'coord sample-results))
     0)
