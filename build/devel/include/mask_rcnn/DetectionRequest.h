// Generated by gencpp from file mask_rcnn/DetectionRequest.msg
// DO NOT EDIT!


#ifndef MASK_RCNN_MESSAGE_DETECTIONREQUEST_H
#define MASK_RCNN_MESSAGE_DETECTIONREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <sensor_msgs/Image.h>

namespace mask_rcnn
{
template <class ContainerAllocator>
struct DetectionRequest_
{
  typedef DetectionRequest_<ContainerAllocator> Type;

  DetectionRequest_()
    : image_data()  {
    }
  DetectionRequest_(const ContainerAllocator& _alloc)
    : image_data(_alloc)  {
  (void)_alloc;
    }



   typedef  ::sensor_msgs::Image_<ContainerAllocator>  _image_data_type;
  _image_data_type image_data;





  typedef boost::shared_ptr< ::mask_rcnn::DetectionRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mask_rcnn::DetectionRequest_<ContainerAllocator> const> ConstPtr;

}; // struct DetectionRequest_

typedef ::mask_rcnn::DetectionRequest_<std::allocator<void> > DetectionRequest;

typedef boost::shared_ptr< ::mask_rcnn::DetectionRequest > DetectionRequestPtr;
typedef boost::shared_ptr< ::mask_rcnn::DetectionRequest const> DetectionRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mask_rcnn::DetectionRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mask_rcnn::DetectionRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mask_rcnn::DetectionRequest_<ContainerAllocator1> & lhs, const ::mask_rcnn::DetectionRequest_<ContainerAllocator2> & rhs)
{
  return lhs.image_data == rhs.image_data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mask_rcnn::DetectionRequest_<ContainerAllocator1> & lhs, const ::mask_rcnn::DetectionRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mask_rcnn

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mask_rcnn::DetectionRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mask_rcnn::DetectionRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mask_rcnn::DetectionRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mask_rcnn::DetectionRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mask_rcnn::DetectionRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mask_rcnn::DetectionRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mask_rcnn::DetectionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ba55116f263d40ea8759822097ad63d4";
  }

  static const char* value(const ::mask_rcnn::DetectionRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xba55116f263d40eaULL;
  static const uint64_t static_value2 = 0x8759822097ad63d4ULL;
};

template<class ContainerAllocator>
struct DataType< ::mask_rcnn::DetectionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mask_rcnn/DetectionRequest";
  }

  static const char* value(const ::mask_rcnn::DetectionRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mask_rcnn::DetectionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sensor_msgs/Image image_data\n"
"\n"
"================================================================================\n"
"MSG: sensor_msgs/Image\n"
"# This message contains an uncompressed image\n"
"# (0, 0) is at top-left corner of image\n"
"#\n"
"\n"
"Header header        # Header timestamp should be acquisition time of image\n"
"                     # Header frame_id should be optical frame of camera\n"
"                     # origin of frame should be optical center of camera\n"
"                     # +x should point to the right in the image\n"
"                     # +y should point down in the image\n"
"                     # +z should point into to plane of the image\n"
"                     # If the frame_id here and the frame_id of the CameraInfo\n"
"                     # message associated with the image conflict\n"
"                     # the behavior is undefined\n"
"\n"
"uint32 height         # image height, that is, number of rows\n"
"uint32 width          # image width, that is, number of columns\n"
"\n"
"# The legal values for encoding are in file src/image_encodings.cpp\n"
"# If you want to standardize a new string format, join\n"
"# ros-users@lists.sourceforge.net and send an email proposing a new encoding.\n"
"\n"
"string encoding       # Encoding of pixels -- channel meaning, ordering, size\n"
"                      # taken from the list of strings in include/sensor_msgs/image_encodings.h\n"
"\n"
"uint8 is_bigendian    # is this data bigendian?\n"
"uint32 step           # Full row length in bytes\n"
"uint8[] data          # actual matrix data, size is (step * rows)\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::mask_rcnn::DetectionRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mask_rcnn::DetectionRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.image_data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DetectionRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mask_rcnn::DetectionRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mask_rcnn::DetectionRequest_<ContainerAllocator>& v)
  {
    s << indent << "image_data: ";
    s << std::endl;
    Printer< ::sensor_msgs::Image_<ContainerAllocator> >::stream(s, indent + "  ", v.image_data);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MASK_RCNN_MESSAGE_DETECTIONREQUEST_H