class TextTexture {

  private final int w;
  private final int h;
  private final PFont font;
  private PGraphics texture;
  
  //parameters
  private float textSize = 32;
  private String text = "";
  private int leftAlign = CENTER;
  private int rightAlign = CENTER;
  private color bg = 0;
  private color textColor = 255;
  

  TextTexture(int _w, int _h, PFont _font) {
    w = _w;
    h = _h;
    font = _font;
    
    texture = createGraphics(w, h);
  }

  //All methods will take some time
  public void setText(String _text) {
    text = _text;     
  }
  
  public void setTextSize(int _textSize) {
    textSize = _textSize; 
  }
  
  public void setLeftAlign(int _leftAlign) {
    leftAlign = _leftAlign;
  }
  
  public void setRightAlign(int _rightAlign) {
    rightAlign = _rightAlign;
  }
  
  public void setBG(color _bg) {
    bg = _bg;
  }
  
  public void setTextColor(color _textColor) {
    textColor = _textColor;
  }
  
  //Need to be called every time a batch 1 or more parameters are changed
  public void render(){
    texture.beginDraw();
    texture.textFont(font);
    texture.background(bg);
    texture.textSize(textSize);
    texture.textAlign(leftAlign, rightAlign);
    texture.fill(textColor);
    texture.text(text, texture.width/2, texture.height/2);
    texture.endDraw();    
  }
  
  public PGraphics getTexture(){
     return texture; 
  }
  
  public void loadPixels(){
    texture.loadPixels(); 
  }
}
