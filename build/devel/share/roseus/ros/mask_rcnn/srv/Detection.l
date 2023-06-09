;; Auto-generated. Do not edit!


(when (boundp 'mask_rcnn::Detection)
  (if (not (find-package "MASK_RCNN"))
    (make-package "MASK_RCNN"))
  (shadow 'Detection (find-package "MASK_RCNN")))
(unless (find-package "MASK_RCNN::DETECTION")
  (make-package "MASK_RCNN::DETECTION"))
(unless (find-package "MASK_RCNN::DETECTIONREQUEST")
  (make-package "MASK_RCNN::DETECTIONREQUEST"))
(unless (find-package "MASK_RCNN::DETECTIONRESPONSE")
  (make-package "MASK_RCNN::DETECTIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass mask_rcnn::DetectionRequest
  :super ros::object
  :slots (_image_data ))

(defmethod mask_rcnn::DetectionRequest
  (:init
   (&key
    ((:image_data __image_data) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _image_data __image_data)
   self)
  (:image_data
   (&rest __image_data)
   (if (keywordp (car __image_data))
       (send* _image_data __image_data)
     (progn
       (if __image_data (setq _image_data (car __image_data)))
       _image_data)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _image_data
    (send _image_data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _image_data
       (send _image_data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _image_data
     (send _image_data :deserialize buf ptr-) (incf ptr- (send _image_data :serialization-length))
   ;;
   self)
  )

(defclass mask_rcnn::DetectionResponse
  :super ros::object
  :slots (_detection_result ))

(defmethod mask_rcnn::DetectionResponse
  (:init
   (&key
    ((:detection_result __detection_result) (instance mask_rcnn::Result :init))
    )
   (send-super :init)
   (setq _detection_result __detection_result)
   self)
  (:detection_result
   (&rest __detection_result)
   (if (keywordp (car __detection_result))
       (send* _detection_result __detection_result)
     (progn
       (if __detection_result (setq _detection_result (car __detection_result)))
       _detection_result)))
  (:serialization-length
   ()
   (+
    ;; mask_rcnn/Result _detection_result
    (send _detection_result :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; mask_rcnn/Result _detection_result
       (send _detection_result :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; mask_rcnn/Result _detection_result
     (send _detection_result :deserialize buf ptr-) (incf ptr- (send _detection_result :serialization-length))
   ;;
   self)
  )

(defclass mask_rcnn::Detection
  :super ros::object
  :slots ())

(setf (get mask_rcnn::Detection :md5sum-) "06cf66b3413825e302437b5d0f5e62e2")
(setf (get mask_rcnn::Detection :datatype-) "mask_rcnn/Detection")
(setf (get mask_rcnn::Detection :request) mask_rcnn::DetectionRequest)
(setf (get mask_rcnn::Detection :response) mask_rcnn::DetectionResponse)

(defmethod mask_rcnn::DetectionRequest
  (:response () (instance mask_rcnn::DetectionResponse :init)))

(setf (get mask_rcnn::DetectionRequest :md5sum-) "06cf66b3413825e302437b5d0f5e62e2")
(setf (get mask_rcnn::DetectionRequest :datatype-) "mask_rcnn/DetectionRequest")
(setf (get mask_rcnn::DetectionRequest :definition-)
      "sensor_msgs/Image image_data

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
Result detection_result

================================================================================
MSG: mask_rcnn/Result
std_msgs/Header header

# Bounding boxes in pixels
#sensor_msgs/RegionOfInterest[] boxes

# String class IDs for each bouding box
string[] class_names

# Float probability scores of the class_id
#float32[] scores

# Instance masks as Image
sensor_msgs/Image[] masks

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)
")

(setf (get mask_rcnn::DetectionResponse :md5sum-) "06cf66b3413825e302437b5d0f5e62e2")
(setf (get mask_rcnn::DetectionResponse :datatype-) "mask_rcnn/DetectionResponse")
(setf (get mask_rcnn::DetectionResponse :definition-)
      "sensor_msgs/Image image_data

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
Result detection_result

================================================================================
MSG: mask_rcnn/Result
std_msgs/Header header

# Bounding boxes in pixels
#sensor_msgs/RegionOfInterest[] boxes

# String class IDs for each bouding box
string[] class_names

# Float probability scores of the class_id
#float32[] scores

# Instance masks as Image
sensor_msgs/Image[] masks

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)
")



(provide :mask_rcnn/Detection "06cf66b3413825e302437b5d0f5e62e2")


