import java.util.Scanner;
import java.io.Serializable;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.io.EOFException;
import java.io.File;
import java.io.IOException;
import java.io.FileWriter;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.*;
import java.nio.file.*;
import static java.nio.file.StandardOpenOption.*;
 class UI implements Serializable{
   DropdownList d1;
  PImage back = loadImage("MapBackground.png");
  PImage background;
  PImage[] StartAni = new PImage[12];
  Terrain Terrbackground = new Terrain(-1, 0, 0);
  ArrayList<Terrain> newblocks = new ArrayList<Terrain>();
  int blockType = 0;
  String name = "";
  boolean dirt, stone, delete, tosave, totype;
  public UI() {
    totype = false;
    tosave = false;
    dirt = false;
    stone = false;
    delete = false;
    background = loadImage("UI_Background.png");
    StartAni[0] = loadImage("pixil-frame-0.png");
    StartAni[1] = loadImage("pixil-frame-1.png");
    StartAni[2] = loadImage("pixil-frame-2.png");
    StartAni[3] = loadImage("pixil-frame-3.png");
    StartAni[4] = loadImage("pixil-frame-4.png");
    StartAni[5] = loadImage("pixil-frame-5.png");
    StartAni[6] = loadImage("pixil-frame-6.png");
    StartAni[7] = loadImage("pixil-frame-7.png");
    StartAni[8] = loadImage("pixil-frame-8.png");
    StartAni[9] = loadImage("pixil-frame-9.png");
    StartAni[10] = loadImage("pixil-frame-10.png");
    StartAni[11] = loadImage("pixil-frame-11.png");
  }
  void basicUI(int x, int y) {
    image(background, x, y);
  }
  void startScreen(int x, int y) {
    if(frameCount < 12){
    image(StartAni[frameCount%12], 0, 0);
    }else{
      image(StartAni[11], 0, 0);
       fill(255);
      rect(BeginX, BeginY, BeginRectX, BeginRectY);
      rect(SnakeX, BeginY, BeginRectX, BeginRectY);
      textAlign(CENTER);
      textSize(20);
       fill(0);
      text("Start", BeginX + BeginRectX/2, BeginY + BeginRectY/2 + 7);
      text("Map Maker", SnakeX + BeginRectX/2, BeginY + BeginRectY/2 + 7);
      if(hoveringButton(SnakeX, BeginY, BeginRectX, BeginRectY)){
        mode2 = 3;
      }else{
        mode2 = 10000;
      }
  }
}
void terrainHit(Terrain target) {
    target.changeType(blockType);
  }
void scanEffectRadius(int x, int y) {
    int xStart = (x / 5) * 5 - UIradius;
    int xEnd = xStart + 2 * UIradius;
    int yStart = (y / 5) * 5 - UIradius;
    int yEnd = yStart + 2 * UIradius;
    if (x < UIradius) {
      xStart = 0;
    }
    if (x + UIradius >= GAMEWIDTH) {
      xEnd = GAMEWIDTH;
    }
    if (y < UIradius) {
      yStart = 0;
    }
    if (y + UIradius >= GAMEHEIGHT - 5) {
      yEnd = GAMEHEIGHT - 5;
    }
    for (int j = yStart; j < yEnd; j+=5) {
      for (int i = xStart; i < xEnd; i+=5) {
        if (dist(x,y,newblocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)).x,newblocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)).y) <= UIradius) {
            terrainHit(newblocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)));
          
        }
      }
    }
  }
  void saveMap(String name, ArrayList<ArrayList<Integer>> map){
  try
    {
    if(!(MapName.contains(name))){
      print(3);
      FileOutputStream file = new FileOutputStream(sketchPath("") + "MAP/" + name);
            print(4);
      ObjectOutputStream output = new ObjectOutputStream(file);
      print(5);
      output.writeObject(map);
           print(6);
      output.close();
      //OutputStream os = Files.newOutputStream(Paths.get("Snakes-Game/Game/MAPNAME.txt"), APPEND);
      //PrintWriter writer = new PrintWriter(os);
      //writer.write(name);
      Path path = Paths.get(sketchPath("")+"MAPNAME.txt");
      Files.write(path, ("\n" + name).getBytes(), APPEND);
      MapName.add(name);
      name = "";
      mode = 0;
      }
     }
    catch (Exception e)
    {
       e.printStackTrace();
    }
}
ArrayList<Terrain> openMap(String name){
  ArrayList<Terrain> map = new ArrayList<Terrain>();
  try
    {
       FileInputStream file = new FileInputStream(sketchPath("") + "/MAP/" + name);
       ObjectInputStream input = new ObjectInputStream(file);
       Object map2 = input.readObject();
       input.close();
       if(map2 instanceof ArrayList<?>)
       {
         ArrayList<ArrayList<Integer>> map3 = (ArrayList<ArrayList<Integer>>)(map2);
         for(ArrayList<Integer> a: map3){
           
         map.add(new Terrain(a.get(0), a.get(1), a.get(2)));
       }   
    }
    return map;
    }catch (Exception e)
    {
       print("Map could not be found");
    }
    
    return map;
}
void mapSelection(int x, int y, boolean bol){
   if(bol){
     d1 = cp5.addDropdownList("Random").setPosition(700, 200);;
  for(String a:MapName){
    d1.addItem(a, a);
  }
  }
bol = false;
  back.resize(1500, 600);
  image(back, x, y);
  PImage start = loadImage("Start.png");
  image(start, 900, 250);
  if(hoveringButton(900, 250, 200, 100)){
    mode2 = 4;
  }else{
    mode2 = 100000;
  }
}
void mapScreen(int x, int y, boolean setup){
  if(setup){
  for (int j = 0; j < 595; j+=5) {
    for (int k = 0; k < GAMEWIDTH; k+=5) {
      Terrain block = new Terrain(0, k, j);
      block.display();
      newblocks.add(block);
    }
  }
  for(int j = 595; j < 600; j+=5){
     for (int k = 0; k < GAMEWIDTH; k+=5) {
      Terrain block = new Terrain(2, k, j);
      block.display();
      newblocks.add(block);
    }
  }
  setupMode3 = false;
}else{
  if(drag){
    UI.scanEffectRadius(mouseX, mouseY);
  }
  Terrbackground.display();
  for (Terrain a : newblocks) {
        a.display();
      }
}
basicUI(1200, 0);
textAlign(LEFT);
textSize(10);
fill(255);
text("Name", 1220, 400);
//save
rect(1260, 400, 200, 10); 
//delete
rect(1210, 90, 50, 50);
//dirt
rect(1270, 90, 50, 50);
//Stone
rect(1330, 90, 50, 50);
rect(shootX, shootY, shootRectX, shootRectY);
rect(selectX, selectY, selectRectX, selectRectY);
fill(0);
text("Delete", 1220, 120);
text("Dirt", 1285, 120);
text("Stone", 1340, 120);
text("SAVE", (shootX) + 75, shootY + 55);
text("EXIT", (selectX) + 75, selectY + 55);
text(UIradius, 1210, 12);
text(blockType, 1210, 22);
text(name, 1265, 409);
if( hoveringButton(shootX, shootY, shootRectX, shootRectY)) {
  tosave = true;
}else{tosave = false;}
if( hoveringButton(selectX, selectY, selectRectX, selectRectY)) {
  toexit = true;
}else{toexit = false;
}
if( hoveringButton(1210, 90, 50, 50)) {
  delete = true;
}else{delete = false;}
if( hoveringButton(1270, 90, 50, 50)) {
  dirt = true;
}else{dirt = false;}
if( hoveringButton(1330, 90, 50, 50)) {
  stone = true;
}else{stone = false;}
if( hoveringButton(1260, 400, 200, 10)) {
  totype = true;
}else{totype = false;}
if(save){
 ArrayList<ArrayList<Integer>> newblocksID = new ArrayList<ArrayList<Integer>>();
  for(Terrain a: newblocks){
    ArrayList<Integer> b = new ArrayList<Integer>();
    b.add(a.id);
    b.add(a.x);
    b.add(a.y);
   newblocksID.add(b);
  }
  saveMap(name, newblocksID);
  save = false;
}
}
}
