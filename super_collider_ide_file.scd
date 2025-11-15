s.boot
(
s.options.numBuffers = 1024 * 256;
s.options.memSize = 8192 * 32;
s.options.numWireBufs = 128;
s.options.maxNodes = 1024 * 32;
s.options.numOutputBusChannels = 2;
s.options.numInputBusChannels = 2;

s.waitForBoot {
    ~dirt = SuperDirt(2, s);
    ~dirt.loadSoundFiles;
    s.sync;
    ~dirt.start(57120, 0 ! 12);
};
)

MIDIClient.init;
~midiOut = MIDIOut.newByName("TidalOut", "TidalOut");
~dirt.soundLibrary.addMIDI(\nexus, ~midiOut);
~midiOut.latency = 0.05;

(
t = TempoClock.default;
t.tempo = 120 / 60;
)