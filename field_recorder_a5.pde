import ddf.minim.*;
import fullscreen.*;
import controlP5.*;

Minim minim;
AudioInput in;
AudioRecorder rec;

//a list of slots
AudioPlayer[] slots;
int next_slot;
// one thread records a sound and saves it into a specified slot
SoundRecorder sound_recorder;
boolean lets_record = false;
boolean record_range = true;

ControlP5 cp5;
Loopboxes boxes;
PFont andale;
PFont tt;
boolean help = false;

SoftFullScreen fs;
Dimension dim;
int wid, hei;

void setup() {
  dim = FullScreen.getResolutions( 0 )[0];
  wid = (int)dim.getWidth();
  hei = (int)dim.getHeight(); 
  size(wid, hei);
  noStroke();
  

  fs = new SoftFullScreen(this);
  fs.enter();
  

  tt = loadFont("tt1.vlw");
  andale = loadFont("AndaleMono-128.vlw");
  //words_about_it = words_about_it.toUpperCase();
  
  
  boxes = new Loopboxes();
  cp5 = new ControlP5(this);
  setup_cp5();
  
  
  slots = new AudioPlayer[num_slots];
  next_slot = 0;


  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 2048);
  rec = minim.createRecorder(in, "0.wav", true);
  
  
  sound_recorder = new SoundRecorder();
}

void draw() {
  background(bckgnd);
  draw_ms();
  boxes.draw();

  if (help)  draw_description();
}

void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();

  for (int i = 0; i < num_slots; i++) {
       try { 
          slots[next_slot].close(); 
        } catch (Exception e) {}
  }

  minim.stop();

  super.stop();
}

