class Triangulo1{
  
  Body triangle;
  
  color col;
  int c, num;
  
  Triangulo1(float x, float y, int c_, int num_){
    this.c = c_;
    this.num = num_;
    
    construirTriangulo1(new Vec2(x, y));
    queColor(this.c);
  }
  
  void killBody(){
    box2d.destroyBody(triangle);
  }
  
  boolean verificar(){
    Vec2 t = box2d.getBodyPixelCoord(triangle);
    
    if (t.x != 0 && t.y != 0){
    killBody();
    return true;
    }
    return false;
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(triangle);
    
    Fixture fixture = triangle.getFixtureList();
    PolygonShape ps = (PolygonShape) fixture.getShape();
    pushMatrix();
    translate(pos.x, pos.y);
    fill(col);
    noStroke();
    beginShape();
    
    for(int i = 0; i < ps.getVertexCount(); i++){
      Vec2 vert = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(vert.x, vert.y);
    }
    endShape(CLOSE);
    popMatrix();
  }
  
  
  void construirTriangulo1(Vec2 centro){
    PolygonShape tps = new PolygonShape();
    
    Vec2[] vertices = new Vec2[3];
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(0, (35.08*2)));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(-30.72, 18.13));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(30.72, 18.13));
   
    tps.set(vertices, vertices.length);
    
    BodyDef tbd = new BodyDef();
    tbd.type = BodyType.STATIC;
    tbd.position.set(box2d.coordPixelsToWorld(centro));
    triangle = box2d.createBody(tbd);
    
    triangle.createFixture(tps, 1.0);
    
    triangle.setUserData(this);
  }
  
  void queColor(int tcol){
    switch (tcol){
      case 1: 
      col = color(0, 255, 159);
      break;
      case 2: 
      col = color(0, 184, 255);
      break;
      case 3: 
      col = color(189, 0, 255);
      break;
      case 4: 
      col = color(214, 0, 255);
      break;
    }
  }
  
  void cambiarColor(){
    switch (this.c){
      case 1: 
      col = color(0, 255, 159);
      break;
      case 2: 
      col = color(0, 184, 255);
      break;
      case 3: 
      col = color(189, 0, 255);
      break;
      case 4: 
      col = color(214, 0, 255);
      break;
    }
  }
  
}
