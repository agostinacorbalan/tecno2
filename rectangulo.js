class Rectangulo{

    constructor(posX_, posY_, tamX_,tamY_, valor1_, valor2_, valor3_){
        this.posX = posX_;
        this.posY = posY_;
        this.tamX = tamX_;
        this.tamY = tamY_;
        this.valor1 = valor1_;
        this.valor2 = valor2_;
        this.valor3 = valor3_;
    }

    dibujar(){
        noStroke();
        fill(this.valor1,this.valor2,this.valor3);
        rect( this.posX , this.posY , this.tamX , this.tamY);
    }
}