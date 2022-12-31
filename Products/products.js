let productList = []

class product{
    constructor(id, name, image, price, description){
        this.id = id
        this.name = name
        this.image = image
        this.price = price
        this.description = description
    }
}

class productMethods{

    postProduct = (product) => {

        const temp  = this.getAllProducts()
        productList = (temp == null) ? [] : temp
       
        productList.push(product) 
        this.commitChanges()  
    }

    commitChanges = () => localStorage.setItem("ProductList", JSON.stringify(productList))

    getAllProducts = () => JSON.parse(localStorage.getItem("ProductList"))

    putProduct = (product) => {

        const tempProducts = this.getAllProducts() 

        for (const replace in tempProducts) {

            if(tempProducts[replace].id == product.id){

                tempProducts.splice(replace,1,product)
                productList = tempProducts
                this.commitChanges()
                return
            }
        }

    }

    getProductById = (id) => {

        const tempProducts = this.getAllProducts() 

        return tempProducts.find((e) => e.id == id)

    }

}

const prod =  new productMethods()


console.log(prod.getAllProducts())