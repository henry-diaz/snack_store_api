import React from 'react';
const Product = ({product}) =>
    <div className="cell" key={product.id}>
      <div className="card">
        {product.image_url.length > 0 &&
          <img src={product.image_url} alt={product.name}/>
        }
        <div className="card-section">
          <h4>{product.name}</h4>
          <p>{product.description}</p>
        </div>
        <div className="grid-x grid-padding-x align-justify card-divider">
          <div className="cell small-5">Stock: {product.stock}</div>
          <div className="cell small-5">${product.price}</div>
        </div>
      </div>
    </div>
export default Product;
