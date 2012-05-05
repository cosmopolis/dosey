int    y_padding = 100;
int    x_padding = 200;
int    text_height = 60;

int    cp5_height = 55;
int    cp5_width = 575;
int     cp5_padding = 5;
  
public class Loopboxes {
  int loopboxes_width;
  int loopboxes_height;
  int overall_height;
  int x_start;
  int y_start;
  int x_space;
  int y_space;
  int box_w;
  int box_h;

  Loopboxes() {
    loopboxes_width = width - 2*x_padding;
    loopboxes_height = height - text_height - cp5_padding - cp5_height - 2*y_padding;
    overall_height = loopboxes_height + cp5_padding + cp5_height;

    x_start = width/2 - loopboxes_width/2;
    y_start = height/2 - overall_height/2;

    x_space = loopboxes_width/4;
    y_space = loopboxes_height/3;

    box_w = (int)((loopboxes_width/4) * .75);
    box_h = (int)(y_space * .75);

    x_start += (.125)*x_space;
    y_start += (.125)*y_space;
  }

  void draw() {
    //iterator maps slots to cubes
    int i = 0;

    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 4; x++) {



        //draw background
        fill (backdrop, 64);
        rect(x_start + x*x_space, y_start + y*y_space, box_w, box_h);


        if (i < num_slots) {
          fill(backdrop);
          rect(x_start + x*x_space, y_start + y*y_space, box_w, box_h);
          // if it's recording, color red
          if ((i == next_slot) || ((next_slot == 0) && (i == 12))) {
            if (rec.isRecording()) {
              fill (take);
              rect(x_start + x*x_space, y_start + y*y_space, box_w, box_h);
            }
          } 

          //show the slots playing
          else if (slots[i] != null) {
            fill(give);
            rect(x_start + x*x_space, y_start + y*y_space, get_play_length(slots[i]), box_h );
          }
        }

        i++;
      }
    }
  }
  int get_play_length(AudioPlayer ap) {
    float x = map(ap.position(), 0, ap.length(), 0, box_w);
    return (int)x;
  }
}


