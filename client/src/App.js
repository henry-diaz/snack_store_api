import React, { Component } from 'react';
import './App.css';
import logo from './logo.svg';
import ProductsContainer from './components/ProductsContainer';

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Snack Store</h1>
        </header>
        <ProductsContainer />
      </div>
    );
  }
}

export default App;
