class Arco{

    constructor(posX_, posY_,anguloStar_, anguloEnd_, modificarElRojo, modificarElVerde, modificarElAzul){
        this.posX = posX_;
        this.posY = posY_;
        this.tam = 700;
        this.anguloStar = anguloStar_;
        this.anguloEnd = anguloEnd_;

        this.contorno = 0;
        this.expandir= 1;
        this.llegoAlLimite;

        this.modificarRojo = modificarElRojo;
        this.modificarVerde = modificarElVerde;
        this.modificarAzul = modificarElAzul;
        this.valorRandom = [];
        this.valorRandom[0] = (random(100,255));
        this.valorRandom[1] = (random(100,255));
        this.valorRandom[2] = (random(100,255));
        this.colorRojo = this.valorRandom[0];
        this.colorVerde = this.valorRandom[1];
        this.colorAzul = this.valorRandom[2];
    }

    dibujar(){
            push();
            blendMode(DIFFERENCE);
            stroke(this.colorRojo,this.colorVerde,this.colorAzul);
            strokeWeight(this.contorno);
            fill(this.colorRojo,this.colorVerde,this.colorAzul);
            arc( this.posX , this.posY , this.tam , this.tam, this.anguloStar, this.anguloEnd, PIE);
            blendMode(BLEND);
            pop();
    }

    expandirGrosor(){
        if(this.contorno == 100){
            this.llegoAlLimite = true;
        }else if(this.contorno == 30){
            this.llegoAlLimite = false;
        }

        if(this.llegoAlLimite){
            this.contorno = this.contorno - this.expandir;
        }else{
            this.contorno = this.contorno + this.expandir; 
        }
    }
    cambioDeColores(){
        this.valorRandom[0] = (random(0,255));
        this.valorRandom[1] = (random(0,255));
        this.valorRandom[2] = (random(0,255));
    }
    
    darColor(){
        if (this.modificarRojo == true){
            if ( this.colorRojo > 255){
                this.colorRojo = 255;
            }else{
                this.colorRojo = this.colorRojo + 2;
            }
        }
        
        if (this.modificarVerde == true){
            if ( this.colorVerde > 255){
                this.colorVerde = 255;
            }else{
                this.colorVerde = this.colorVerde + 2;
            }
        }

        if(this.modificarAzul == true){
            if ( this.colorAzul > 255){
                this.colorAzul = 255;
            }else{
                this.colorAzul = this.colorAzul + 2;
            }
        }    
   }

   quitarColor(){
    if (this.modificarRojo == true){
        if ( this.colorRojo < this.valorRandom[0]){
            this.colorRojo = this.valorRandom[0];
        }else{
            this.colorRojo = this.colorRojo - 1;
        } 
    }
    
    if (this.modificarVerde == true){
        if ( this.colorVerde < this.valorRandom[1]){
            this.colorVerde = this.valorRandom[1];
        }else{
            this.colorVerde = this.colorVerde - 1;
        }
    }

    if(this.modificarAzul == true){
        if ( this.colorAzul < this.valorRandom[2]){
            this.colorAzul = this.valorRandom[2];
        }else{
            this.colorAzul = this.colorAzul - 1;
        }
    }
  }



}