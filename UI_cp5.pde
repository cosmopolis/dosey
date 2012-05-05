Range range_slider;
Slider specific_loop_slider;
Toggle rec_range_toggle;
Toggle record;
Toggle hjaelp;

void setup_cp5() {
  cp5.setColorBackground(backdrop);
  cp5.setColorForeground(give);
  cp5.setColorActive(take);
  cp5.setColorLabel(accent);
  cp5.setColorValue(accent);

  cp5.addToggle("hjaelp", false, 0, 0, 30, 30);
  hjaelp = (Toggle)cp5.controller("hjaelp");

  ControlGroup m = cp5.addGroup("control", width/2 - cp5_width/2, height-cp5_height - y_padding);
  m.setBackgroundHeight(cp5_height);

  cp5.addToggle("record", false, cp5_width-55, 10, 55, 55);
  record = (Toggle)cp5.controller("record");
  record.setGroup(m);

  specific_loop_slider = cp5.addSlider("loop length", 700, 10000, specific_loop_length, 40, 10, cp5_width - 105, 55 );
  specific_loop_slider.setSliderMode(Slider.FLEXIBLE);
  specific_loop_slider.setGroup(m);
  specific_loop_slider.setVisible(false);

  range_slider = cp5.addRange("loop range", 700, 10000, min_long_length, max_long_length, 40, 10, cp5_width - 105, 55 );
  range_slider.setGroup(m);

  cp5.addToggle("rec_range_toggle", false, 0, 10, 30, 55);
  rec_range_toggle = (Toggle)cp5.controller("rec_range_toggle");
  rec_range_toggle.setGroup(m);




  range_slider.setLabel("");
  specific_loop_slider.setLabel("");
  rec_range_toggle.setLabel("");
  record.setLabel("");
} 


void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.controller().name().equals("loop range")) {
    min_long_length = int(theControlEvent.controller().arrayValue()[0]);
    max_long_length = int(theControlEvent.controller().arrayValue()[1]);
  }

  if (theControlEvent.controller().name().equals("loop length")) {
    specific_loop_length = (int)(theControlEvent.controller().value());
  }
}

void rec_range_toggle(boolean theFlag) {
  specific_loop_slider.setVisible(theFlag);
  range_slider.setVisible(!theFlag);
  record_range = !theFlag;
}


void record(boolean theFlag) {
  if (theFlag==true) {
    if (lets_record == false) {
      sound_recorder = new SoundRecorder();
      sound_recorder.start();
      if (next_slot != 0)  next_slot--;
      lets_record = true;
    }
  } 
  else {
    if (lets_record == true) {
      rec.endRecord();
      sound_recorder.stop();
      lets_record = false;
    }
  }
}


void hjaelp(boolean theFlag) {
  if (theFlag == true) {
    help = true;

    range_slider.setLabel("loop range");
    specific_loop_slider.setLabel("loop length");
    rec_range_toggle.setLabel("rec_range_toggle");
    record.setLabel("record");
  } 
  else {
    help = false;

    range_slider.setLabel("");
    specific_loop_slider.setLabel("");
    rec_range_toggle.setLabel("");
    record.setLabel("");
  }
}

