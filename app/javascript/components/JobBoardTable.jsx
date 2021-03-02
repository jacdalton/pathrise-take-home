import React from 'react'
import PropTypes from 'prop-types'

const JobBoardTable = props => (
  <table>
  <thead>
    <tr>
      {props.headers.map(header => <th key={header}>{header}</th>)}
    </tr>
  </thead>
  <tbody>
    {props.rows.map(row => 
      <tr key={row.id}>
        <td>{row.id}</td>
        <td>{row.job_title}</td>
        <td>{row.company_name}</td>
        <td>{row.job_url}</td>
        <td>{row.job_source}</td>
      </tr>
    )}
  </tbody>
  </table>
)

JobBoardTable.propTypes = {
  headers: PropTypes.array,
  rows: PropTypes.array
}

export default JobBoardTable