import React from 'react'
import PropTypes from 'prop-types'

const IndexCard = props => (
  <React.Fragment>
    <a href={props.link_to}>
      <p className="index-card-rating">{props.rating}</p>
      <div className="index-card-body">
        <img src={props.logo_file} className="index-card-img" title={props.name}/>
        <p className="index-card-description">{props.description}</p>
      </div>
    </a>
  </React.Fragment>
)

IndexCard.propTypes = {
  name: PropTypes.string,
  rating: PropTypes.string,
  root_domain: PropTypes.string,
  logo_file: PropTypes.string,
  description: PropTypes.string,
  link_to: PropTypes.string
}

export default IndexCard