String get_rec_filename(int num) {
  return dataPath(num + ".wav");
}

void cycle_through_slots() {
  next_slot++;
  if (next_slot == num_slots) next_slot = 0;
}

int get_recording_length() {
  if (record_range)       return randum(min_long_length, max_long_length);
  else                    return (specific_loop_length);
}

int randum(int min, int max) {
  float burn; randomSeed(millis()); burn=random(1.0);
  return (min + (int)random(max - min + 1));
}
