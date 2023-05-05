import torch
import torchvision
import time
from mask_rcnn_pytorch.src.mrcnn_utils import draw_segmentation_map, get_outputs
from torchvision.transforms import transforms as transforms
from torchvision.models.detection import maskrcnn_resnet50_fpn_v2, MaskRCNN_ResNet50_FPN_V2_Weights
from cv_bridge import CvBridge

# initialize the model
model = maskrcnn_resnet50_fpn_v2(weights=MaskRCNN_ResNet50_FPN_V2_Weights.DEFAULT, progress=True, 
                                                           num_classes=91)
# set the computation device
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
# load the modle on to the computation device and set to eval mode
model.to(device).eval()

# transform to convert the image to tensor
transform = transforms.Compose([
    transforms.ToTensor()
])

def infer(image, gen_image):
    #image = image.convert('RGB')
    # keep a copy of the original image for OpenCV functions and applying masks
    orig_image = image.copy()
    # transform the image
    image = transform(image)
    # add a batch dimension
    image = image.unsqueeze(0).to(device)
    masks, boxes, labels = get_outputs(image, model, 0.95)
    if gen_image: 
        result = draw_segmentation_map(orig_image, masks, boxes, labels)
    else: 
        result = image
    return masks, labels, result
