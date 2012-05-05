public class SoundRecorder extends Thread {
  private boolean running;
  int wait;

  public SoundRecorder() {
    running = false;
    wait = get_recording_length();
  }

  void start() {
    running = true;
      // start a new recording
      rec = minim.createRecorder(in, get_rec_filename(next_slot), true);
      rec.beginRecord();
    
    super.start();
  }

  void run() {
    while (running) {

      // get a fresh recording length
      wait = get_recording_length();

      // if next slot slot's playing, pause it
      if (slots[next_slot] != null) {
        try { 
          slots[next_slot].close(); 
        } catch (Exception e) {}
      }

      if (rec.isRecording()) {
        // end current recording
        rec.endRecord();

        //save rec in the next slot
        slots[next_slot] = rec.save();

        try {
          slots[next_slot].loop();
        } 
        catch (Exception e) {
        }
      }

        // start a new recording
        rec = minim.createRecorder(in, get_rec_filename(next_slot), true);
        rec.beginRecord();

      //cue the next slot
      cycle_through_slots();

      // wait
      try { 
        sleep((long)(wait));
      } 
      catch (Exception e) {
      }
    }
  }
}

