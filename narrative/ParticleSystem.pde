// Source:
// https://processing.org/examples/simpleparticlesystem.html
class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }
  
  // Source:
  // https://processing.org/reference/ArrayList.html
  void removeParticles(){
    for (int i = particles.size() - 1; i >= 0; i--) {
      //Particle part = particles.get(i);
      particles.remove(i);
      
    }    
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
