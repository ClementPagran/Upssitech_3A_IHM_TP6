import java.awt.Point;
import fr.dgac.ivy.*;
import javax.swing.JOptionPane;

Ivy bus;
String[] lines;
String balise[][] = {{"<h1>", "Titre niveau un: ","</h1>" },{"<h2>","Titre niveau deux: ", "</h1>"}};

void setup() {
  size(200, 200);
  frameRate(0.2);
  
  try {
    bus = new Ivy("Fission_Multimodal", " Fission_Multimodal is ready", null);
    bus.start("127.255.255.255:2010");
    }
  catch (IvyException ie) {
    System.err.println("Error : "+ ie.getMessage());
  }

  lines = loadStrings("Toulouse.html");
  /*println("There are " + lines.length + " lines");
  for (int i = 0 ; i < lines.length; i++) {
    println(lines[i]);
  }*/
}

void draw() {
  //for (int i = 0 ; i < lines.length; i++) {
    
    try {
      for (int k = 0 ; k < balise.length; k++){
        lines[0]=lines[0].replaceAll(balise[k][0],balise[k][1]);
        lines[0]=lines[0].replaceAll(balise[k][2],"");
      }
      
        
      println(lines[0]);
      bus.sendMsg("ppilot5 SaySSML="+lines[0]);
    }
    catch (IvyException ie) {
      System.err.println("Error : "+ ie.getMessage());
    }
  //}
}
