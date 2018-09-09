import React, { Component } from 'react';
// We're gonna use the axios package as our HTTP Client
import axios from 'axios';
// Single view of our product
import Product from './Product';

class ProductsContainer extends Component {
    constructor(props){
        super(props)
        this.state = {
            products: [],
            keywords: '',
            total_pages: 1,
            current_page: 1
        }
    }
    componentDidMount() {
      // Component mounted, get index of products
      this.loadProducts()
    }
    handleSearch = (e) => {
      // Trigger a loadProducts call with each onchange input search
      this.setState({
          keywords: e.target.value
      })
      this.loadProducts(e.target.value)
    }
    handlePagination = (e) => {
      // Move between the link pages, we use a data params in the links so
      // we can obtain the desired page from that attribute
      this.loadProducts(this.state.keywords, e.target.dataset.page)
    }
    loadProducts = (query = '', page = 1) => {
      axios.get('/users/v1/products.json?q=' + query + '&page=' + page)
      .then(response => {
          var pagination = JSON.parse(response.headers.pagination)
          console.log(pagination)
          this.setState({
              products: response.data,
              current_page: pagination.current_page,
              total_pages: pagination.total_pages,
          })
      })
      .catch(error => console.log(error))
    }
    render() {
        return (
            <div className="grid-container">
              <div className="grid-x">
                <div className="cell">
                  <label htmlFor="filter">Filter by text:</label>
                  <input type="text" id="filter" onChange={this.handleSearch}/>
                </div>
              </div>
              <br />
              <div className="grid-x grid-padding-x small-up-2 medium-up-3 large-up-4">
                {this.state.products.length > 0
                  ? this.state.products.map( product => {
                      return (<Product product={product} key={product.id} />)
                  })
                  : <div className="cell"><p>No results for: <strong>{this.state.keywords}</strong></p></div>
                }
              </div>
              <br />
              {this.state.products.length > 0 &&
                <div className="grid-x">
                  <div className="cell">
                    <nav aria-label="Pagination">
                      <ul className="pagination text-center">
                        {[...Array(this.state.total_pages)].map((x, i) =>
                          <li key={i+1}>
                            {this.state.current_page === (i+1)
                              ? <span className="current">{i+1}</span>
                              : <a data-page={i+1} onClick={this.handlePagination}>{i+1}</a>
                            }
                          </li>
                        )}
                      </ul>
                    </nav>
                  </div>
                </div>
              }
            </div>
        )
    }
}

export default ProductsContainer;
