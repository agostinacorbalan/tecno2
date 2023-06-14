class Conjunto {

    constructor(){
        this.cantidad = 9;
        this.c = [];
        this.tam = width*1.1;
        this.c[0] = new Circulo(0,0,this.tam,true,true,false);
        this.c[1] = new Circulo(width,0,this.tam,false,true,true);
        this.c[2] = new Circulo(0,height,this.tam,true,false,true);
        this.c[3] = new Circulo(width,height,this.tam,true,true,false);
        this.c[4] = new Circulo(width/2,height+50,this.tam,false,true,true);
        this.c[5] = new Circulo(width/2,-50,this.tam,true,false,true);
        this.c[6] = new Circulo(width+50,height/2,this.tam,true,true,false);
        this.c[7] = new Circulo(-50,height/2,this.tam,false,true,true);
        this.c[8] = new Circulo(width/2,height/2,100,true,false,true);
    }

    dibujar() {
        noStroke();
        fill(0,160,0);
        rect(0,0,80,height);
        fill("green");
        rect(80,0,width,80);
        fill("orange");
        rect(width-80,0,80,height);
        fill("purple");
        rect(0,height-80,width-80,80);
        fill(0,200,100);
        rect(width/2-250,height/2-250,500,500);
        
        for( let i=0 ; i<this.cantidad ; i++ ){
        this.c[i].dibujar();
        }
    }

    darColor() { 
        for( let i=0 ; i < this.cantidad ; i++ ){
            this.c[i].darColor();
        }
    }

    quitarColor(){
        for( let i=0 ; i < this.cantidad ; i++ ){
            this.c[i].quitarColor();
        }
        
    }
    expandirGrosor(){
        for( let i=0 ; i < this.cantidad ; i++ ){
            this.c[i].expandirGrosor();
        }        
    }
}

