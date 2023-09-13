// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract supermarketContract{
    uint256 productId=1;
    Product[] public products;
    
    struct Product{
        string name;
        uint256 price;
        uint256 quantity;
    }

    event productAdded(uint256 productId, string name, uint256 price, uint256 quantity);

     function addProduct(string memory name,uint256 price,uint256 quantity) public {
        productId +=1;
        products.push(Product(name,price,quantity));
        emit productAdded(productId,name,price,quantity);
    }

     function getProductCount() public view returns (uint256){
        return products.length;
    }

    function getTotalItems() public view returns (uint256) {
        uint256 totalItems = 0;
        for (uint256 i = 0; i < products.length; i++) {
            totalItems += products[i].quantity;
        }
        return totalItems;
    }

    function getProduct(uint index) public view returns (string memory,uint256,uint256){
        Product memory product=products[index+1];
        return (product.name,product.price,product.quantity);
    }
}
