class Animation {
  static final int WALK = 1;
  static final int SLASH = 2;
  static final int DEATH = 3;
  static final int SHOOT = 4;
  static final int THRUST = 5;
  static final AnimationTypes = const[SLASH,SHOOT,THRUST];
  static final AnimationTime = const[6,12,8];
  List<FrameMap> frameMapIndex;
  int size,mid;
  Animation(properties){
    size = (properties['size']==null)?64:properties["size"];
    mid = (size/2).toInt();
    frameMapIndex = new List<FrameMap>(8);
    loadProperties(properties);
  }
  void loadProperties(properties){
    properties.forEach((k,v){
      switch(k){
        case "walk":
          loadWalkAnimation(v,(animation){
            frameMapIndex[WALK] = animation;
          });
          break;
        case "slash":
          loadSlashAnimation(v,(animation){
            frameMapIndex[SLASH] = animation;
          });
          break;
        case "death":
          loadDeathAnimation(v,(animation){
            frameMapIndex[DEATH] = animation;
          });
          break;
        case "shoot":
          loadShootAnimation(v,(animation){
            frameMapIndex[SHOOT] = animation;
          });
          break;
        case "thrust":
          loadThrustAnimation(v,(animation){
            frameMapIndex[THRUST] = animation;
          });
          break;
      }
    });
  }
  void loadWalkAnimation(String path,callback){
    //Load image, split into many images, save groups of images into FrameMaps
    List<html.ImageElement> imgArray;
    res.loadSplitImage(path,(List<html.ImageElement> imgs){
      callback(new FrameMap(4,9,imgs));
    },px:size,py:size);
  }
  void loadSlashAnimation(String path,callback){
    //Load image, split into many images, save groups of images into FrameMaps
    List<html.ImageElement> imgArray;
    res.loadSplitImage(path,(List<html.ImageElement> imgs){
      callback(new FrameMap(4,6,imgs));
    },px:size,py:size);
  }
  void loadDeathAnimation(String path,callback){
    //Load image, split into many images, save groups of images into FrameMaps
    List<html.ImageElement> imgArray;
    res.loadSplitImage(path,(List<html.ImageElement> imgs){
      callback(new FrameMap(1,6,imgs));
    },px:size,py:size);
  }
  void loadShootAnimation(String path,callback){
    //Load image, split into many images, save groups of images into FrameMaps
    List<html.ImageElement> imgArray;
    res.loadSplitImage(path,(List<html.ImageElement> imgs){
      callback(new FrameMap(4,13,imgs));
    },px:size,py:size);
  }
  void loadThrustAnimation(String path,callback){
    //Load image, split into many images, save groups of images into FrameMaps
    List<html.ImageElement> imgArray;
    res.loadSplitImage(path,(List<html.ImageElement> imgs){
      callback(new FrameMap(4,8,imgs));
    },px:size,py:size);
  }
  void render(html.CanvasRenderingContext2D c,int animation,int orientation,int frame){
    c.save();
    c.translate(-mid,-mid);
    FrameMap fmap = frameMapIndex[animation];
    if (fmap!=null){
      fmap.render(c, orientation,frame);
    }
    c.restore();
  }
}
