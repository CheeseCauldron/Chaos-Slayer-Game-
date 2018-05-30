//Chaos Slayer
//Jerrod Richer / Colby Ash / Gary Wilde
int screen;
int boss;
PImage Player;
PImage map, mapIcon;
PImage boss1;
boolean attack;
boolean mage, fighter, tank, archer;
boolean TimerClassSelect;
boolean move, step;
boolean boss1Attacking,boss1Hit;
int timerClassSelect, PlayerWalkTimer;
int PlayerX, PlayerY, PlayerHealth;
int boss1X, boss1Y, boss1Attack, boss1Health, boss1AttackingTimer;
int mapX, mapY;
void setup() {
  screen=1;
  TimerClassSelect = false;
  Player=loadImage("Archer.PNG");
  boss1Attacking = false;
  timerClassSelect=180;
  PlayerWalkTimer=30;
  PlayerX=200;
  PlayerY=400;
  mapX=50;
  mapY=400;
  boss=0;
  mage = false;
  fighter =false;
  tank = false;
  archer = false;
  map = loadImage("Map.JPG");
  mapIcon=loadImage("MapIcon.PNG");
  boss1Hit=false;
  boss1X=900;
  boss1Y=400;
  boss1Health=85;
  boss1AttackingTimer=15;
  boss1=loadImage("Boss1.PNG");
  attack=false;
  size(1400, 800);
}

void draw() {
  //Class Select Timer
  if (TimerClassSelect = true) {
    timerClassSelect-=1;
  }
  //Start screen
  if (screen==1) {
    //put images here

    //Texts(Start screen)
    background(0);
    fill(#550E0E);
    textSize(200);
    text("Chaos Slayer", 85, 175);
    textSize(85);
    text("Start", 575, 400);
    text("Load", 575, 500);
    text("Exit", 595, 600);
    //Start
    if (mousePressed && abs(mouseX-650)<100 && abs(mouseY-375)<50) {
      screen=2;
      TimerClassSelect = true;
    }
  } else if (screen == 2) {
    background(0);
    //choose class (screen)
    fill(#550E0E);
    textSize(120);
    text("Choose your class", 115, 115);
    textSize(75);
    text("Fighter", 50, 250);
    text("Archer", 370, 250);
    text("Mage", 690, 250);
    text("Paladin", 1010, 250);

    //choose class
    if (mousePressed && abs(mouseX-150)<150 && abs(mouseY-400)<200  && timerClassSelect < 1) {
      screen=3;
      fighter=true;
    } else if (mousePressed && abs(mouseX-455)<150 && abs(mouseY-400)<200 && timerClassSelect < 1) {
      screen=3;
      archer=true;
    } else if (mousePressed && abs(mouseX-760)<150 && abs(mouseY-400)<200 && timerClassSelect < 1) {
      screen=3;
      mage=true;
    } else if (mousePressed && abs(mouseX-1100)<175 && abs(mouseY-400)<200 && timerClassSelect < 1) {
      screen=3;
      tank=true;
    }
  }
  //map
  if (screen==3) {
    image(map, 0, 0, 1400, 800);
    image(mapIcon, mapX, mapY);
    //level select(icon movment)
    if (keyPressed&&key=='w'||key=='W') {
      mapY-=15;
    }
    if (keyPressed&&key=='s'||key=='S') {
      mapY+=15;
    }
    if (keyPressed&&key=='d'||key=='D') {
      mapX+=15;
    }
    if (keyPressed&&key=='a'||key=='A') {
      mapX-=15;
    }
    //level select
    if (abs(mapX-150)<150 && abs(mapY-250)<200) {
      text("Ralf", 50, 700);
    }
    if (keyPressed && abs(mapX-150)<150 && abs(mapY-250)<200  && key==' ') {
      screen=0;
      boss=1;
    }
  }


  //bossfight 1
  if (boss==1) {
    background(0);
    image(boss1, boss1X, boss1Y);
    if (PlayerX>boss1X&&boss1AttackingTimer==15) {
      boss1X+=5;
    }
    if (PlayerX<boss1X&&boss1AttackingTimer==15) {
      boss1X-=5;
    }
    if (PlayerY>boss1Y&&boss1AttackingTimer==15) {
      boss1Y+=5;
    }
    if (PlayerY<boss1Y&&boss1AttackingTimer==15) {
      boss1Y-=5;
    }

      

      if (boss1AttackingTimer<1 || !(boss1X > PlayerX-25 || boss1X < PlayerX && boss1Y!=PlayerY)&&boss1Hit==false) {
        attack=false;
        boss1Hit=true;
        if(boss1Hit==true){
          boss1=loadImage("Boss1Hit.PNG");
          boss1AttackingTimer-=1;
          if(boss1AttackingTimer<1){
            if(boss1AttackingTimer<1 || !(boss1X > PlayerX-25 || boss1X < PlayerX && boss1Y!=PlayerY)) {
              PlayerHealth-=10;
            }
            boss1Hit=false;
            boss1AttackingTimer=15;
          }
      }
    }
    boss1Attack=int(random(260));
     if (boss1Attack>1&&boss1Attack<25) {
      //rock through
    }
    if (boss1Attack==200) {
      //SPECIAL ATTACK
    }
    else if(attack==true){
      boss1=loadImage("Boss1.PNG");
    }
  }

  //player Movment
  if (screen==0) {
    playerAction();
    image(Player, PlayerX, PlayerY);
  }
}


void playerAction() {

  if (keyPressed &&key=='w'||key=='W') {
    PlayerY-=10;
    PlayerWalkTimer-=1;
  } else if (keyPressed&&key=='S'||key=='s') {
    PlayerY+=10;
    PlayerWalkTimer-=1;
  } else if (keyPressed&&key=='a'||key=='A') {
    PlayerX-=10;
    PlayerWalkTimer-=1;
  } else if (keyPressed&&key=='d'||key=='D') {
    PlayerX+=10;
    PlayerWalkTimer-=1;
  } else if (!keyPressed) {
    Player=loadImage("Archer.PNG");
  }

  if (PlayerWalkTimer<1 && step==true) {

    if (archer==true) {
      Player=loadImage("ArcherWalk1.PNG");
      step=false;
    } else if (fighter==true) {
    } else if (mage==true) {
    } else if (tank==true) {
    }
    PlayerWalkTimer=15;
  } else if (PlayerWalkTimer<1&&step==false) {

    if (archer==true) {
      Player=loadImage("ArcherWalk2.PNG");
      step=true;
    } else if (fighter==true) {
    } else if (mage==true) {
    } else if (tank==true) {
    }
    PlayerWalkTimer=15;
  }
}