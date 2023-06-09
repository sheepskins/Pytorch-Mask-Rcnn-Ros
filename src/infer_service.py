#!/usr/bin/env python3

import rospy
from mask_rcnn.srv import Detection, DetectionResponse
from sensor_msgs.msg import Image
from sensor_msgs.msg import RegionOfInterest
from mask_rcnn.msg import Result
from mask_rcnn_pytorch.src.model import infer
from cv_bridge import CvBridge
import numpy as np

bridge = CvBridge()

def _build_result_msg(boxes,masks, labels):
    result_msg = Result()
    result_msg.header.stamp = rospy.Time.now()
    for i in range(len(masks)):

        class_name = labels[i]
        result_msg.class_names.append(class_name)
        np.set_printoptions(threshold=np.inf)

        mask = Image()
        mask.header.stamp = rospy.Time.now()
        mask.height = masks[i].shape[0]
        mask.width = masks[i].shape[1]
        mask.encoding = "mono8"
        mask.is_bigendian = False
        mask.step = mask.width
        mask.data = (masks[i][:, :]).tobytes()
        result_msg.masks.append(mask)
        box = RegionOfInterest()
            
        box.x_offset = boxes[i][0][0]
        box.y_offset = boxes[i][0][1]
        box.height = boxes[i][1][1] - boxes[i][0][1]
        box.width = boxes[i][1][0] - boxes[i][0][0]
        result_msg.boxes.append(box)

    return result_msg


def process(image):
    np_image = bridge.imgmsg_to_cv2(image.image, 'rgb8')
    masks, boxes, labels, result = infer(np_image, gen_image=False)
    response = _build_result_msg(boxes, masks, labels)
    return DetectionResponse(response); 

def main():
    rospy.init_node('mask_rcnn_service')
    service = rospy.Service("mask_rcnn_service", Detection, process)
    rospy.spin()

if __name__=='__main__':
    main()