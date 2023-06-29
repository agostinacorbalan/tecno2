class Conjunto {

    constructor(img_){

        this.estado = true;

        this.img = img_;
        this.cantCirculos = 9;
        this.circulo = [];
        this.tamCirculo = width;
        this.circulo[0] = new Circulo(0,0,this.tamCirculo,true,true,false);
        this.circulo[1] = new Circulo(width,0,this.tamCirculo,false,true,true);
        this.circulo[2] = new Circulo(0,height,this.tamCirculo,true,false,true);
        this.circulo[3] = new Circulo(width,height,this.tamCirculo,true,true,false);
        this.circulo[4] = new Circulo(width/2,height+50,this.tamCirculo,false,true,true);
        this.circulo[5] = new Circulo(width/2,-50,this.tamCirculo,true,false,true);
        this.circulo[6] = new Circulo(width+50,height/2,this.tamCirculo,true,true,false);
        this.circulo[7] = new Circulo(-50,height/2,this.tamCirculo,false,true,true);
        this.circulo[8] = new Circulo(width/2,height/2,100,true,false,true);

        this.cantRect = 5;
        this.rectangulo = [];
        this.tamRect = width/8;
        this.rectangulo [0] = new Rectangulo(0,0,width,height,60,100,213); //102, 255, 213
        this.rectangulo [1] = new Rectangulo(0,0,this.tamRect,height-this.tamRect,0,0,255);
        this.rectangulo [2] = new Rectangulo(0,height-this.tamRect,width-this.tamRect,this.tamRect,255,0,0);
        this.rectangulo [3] = new Rectangulo(width-this.tamRect,this.tamRect,width,height-this.tamRect,255,255,0);
        this.rectangulo [4] = new Rectangulo(this.tamRect,0,width-this.tamRect,this.tamRect,0,255,0);

        this.cantArc = 8;
        this.arco = [];
        this.arco[0] = new Arco (width/2, 0, 0, 3.14159 , false, true ,false);
        this.arco[1] = new Arco (width/2, height , 3.14159, 0 , false, false ,true);
        this.arco[2] = new Arco (0, height/2, 4.71239 , 1.5708, true, false ,false);
        this.arco[3] = new Arco (width, height/2, 1.5708 , 4.71239, true, false ,false);
        this.arco[4] = new Arco (0, 0, 0, 1.5708, false, false ,true);
        this.arco[5] = new Arco (width, 0, 1.5708, 0, false, true ,false);
        this.arco[6] = new Arco (width, height, 3.14159, 4.71239, false, true ,true);
        this.arco[7] = new Arco (0, height, 4.71239, 3.14159, false, true ,true);
        this.circulo[9] = new Circulo(width/2,height/2,100,true,false,true);
    }

    dibujar() { 

        if(this.estado == false){
            image (this.img, 0,0, width, height);
            for( let i=0 ; i < this.cantArc ; i++ ){
                this.arco[i].dibujar();
            }
            this.circulo[9].dibujar();   
        }
        if(this.estado == true){ 
            for( let i=0 ; i<this.cantRect ; i++ ){
            this.rectangulo[i].dibujar();
            }
            for( let i=0 ; i<this.cantCirculos ; i++ ){
            this.circulo[i].dibujar();
            }            
            push();
            blendMode(DIFFERENCE);
            image (this.img, 0,0, width, height);
            blendMode(BLEND);
            pop();
        }
    }

    cambioDeColores() { 
        if(this.estado == false){
            for( let i=0 ; i < this.cantArc ; i++ ){
                this.arco[i].cambioDeColores();
            }
            this.circulo[9].cambioDeColores();    
        }
        if(this.estado == true){
            for( let i=0 ; i < this.cantCirculos ; i++ ){
                this.circulo[i].cambioDeColores();
            }
        }
        
    }
    
    darColor() { 
        if(this.estado == false){
            for( let i=0 ; i < this.cantArc ; i++ ){
                this.arco[i].darColor();
            }
            this.circulo[9].darColor();    
        }
        if(this.estado == true){
            for( let i=0 ; i < this.cantCirculos ; i++ ){
                this.circulo[i].darColor();
            }
        }
        
    }

    quitarColor(){
        if(this.estado == false){
            for( let i=0 ; i < this.cantArc ; i++ ){
                this.arco[i].quitarColor();
            }
            this.circulo[9].quitarColor();    
        }            
        if(this.estado == true){
            for( let i=0 ; i < this.cantCirculos ; i++ ){
                this.circulo[i].quitarColor();
            }
        }
    }


    expandirGrosor(){        
        
        if(this.estado == false){
            for( let i=0 ; i < this.cantArc ; i++ ){
                this.arco[i].expandirGrosor();
            }
            this.circulo[9].expandirGrosor();    
        }
        if(this.estado == true){
            for( let i=0 ; i < this.cantCirculos ; i++ ){
                this.circulo[i].expandirGrosor();
            }
        }        
    }
    cambiarDeEstado(){
        this.estado = !this.estado;
    }

}
