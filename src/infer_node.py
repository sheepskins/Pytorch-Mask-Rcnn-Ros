#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import Image
from mask_rcnn.msg import Result
from mask_rcnn_pytorch.src.model import infer
from cv_bridge import CvBridge
import numpy as np

vis_pub = rospy.Publisher('mask_rcnn_vis', Image, queue_size=1)
box_pub = rospy.Publisher('mask_rcnn_detections', Result, queue_size=1)
bridge = CvBridge()

def _build_result_msg(msg, masks, labels):
    result_msg = Result()
    result_msg.header = msg.header
    for i in range(len(masks)):

        class_name = labels[i]
        result_msg.class_names.append(class_name)
        np.set_printoptions(threshold=np.inf)

        mask = Image()
        mask.header = msg.header
        mask.height = masks[i].shape[0]
        mask.width = masks[i].shape[1]
        mask.encoding = "mono8"
        mask.is_bigendian = False
        mask.step = mask.width
        mask.data = (masks[i][:, :] * 255).tobytes()
        result_msg.masks.append(mask)
    return result_msg


def process(image):
    np_image = bridge.imgmsg_to_cv2(image, 'rgb8')
    
    masks, labels, result = infer(np_image)

    detection_ros = bridge.cv2_to_imgmsg(result, encoding='rgb8')

    box_pub.publish(_build_result_msg(image, masks, labels))
    vis_pub.publish(detection_ros)

def main():
    im_sub = rospy.Subscriber('/camera/image_raw', Image, callback=process, queue_size=1)
    rospy.init_node('mask_rcnn')
    rate = rospy.Rate(1)
    rospy.spin()

if __name__=='__main__':
    main()