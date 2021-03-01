import React from 'react'
import PropTypes from 'prop-types'

const IndexCard = props => (
  <div>
    <h2>{props.name}</h2>
    <img src={props.logo_file} />
    <p>{props.rating}</p>
    <p>{props.description}</p>
  </div>
)

IndexCard.propTypes = {
  name: PropTypes.string,
  rating: PropTypes.string,
  root_domain: PropTypes.string,
  logo_file: PropTypes.string,
  description: PropTypes.string
}

export default IndexCard