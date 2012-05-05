void draw_ms() {
  textFont(tt, 60);
  textAlign(CENTER);
  fill(accent);
  if (lets_record) {
    text(sound_recorder.wait+"", boxes.x_start, text_height, boxes.loopboxes_width, text_height);
  } else {
    text("OFF", boxes.x_start, text_height, boxes.loopboxes_width, text_height);
  }
}

void draw_description() {
  fill(bckgnd, 180);
  rect(0,0,width, height);
  //stroke(accent);
  //strokeWeight(2.3);
//  fill(bckgnd);
//  rect(145, 245, 635, 375);
  //strokeJoin(ROUND);
  
  textFont(andale, 10);
  textAlign(LEFT);
  fill(accent);
  text(words_about_it, boxes.x_start, boxes.y_start, boxes.loopboxes_width, boxes.loopboxes_height);
}
