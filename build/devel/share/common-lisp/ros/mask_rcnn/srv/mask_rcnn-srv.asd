
(cl:in-package :asdf)

(defsystem "mask_rcnn-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :mask_rcnn-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "Detection" :depends-on ("_package_Detection"))
    (:file "_package_Detection" :depends-on ("_package"))
  ))