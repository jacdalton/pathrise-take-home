import React from 'react'
import PropTypes from 'prop-types'

const JobBoardTable = props => (
  <table>
  <thead>
    <tr>
      {props.headers.reduce((acc, val) => {
        if (val != "Job Source") {
          acc.push(<th key={val}>{val}</th>);
        }
        return acc;
        }, [])
      }
    </tr>
  </thead>
  <tbody>
    {props.rows.map(row => 
      <tr key={row.id}>
        <td>{row.id}</td>
        <td>{row.job_title}</td>
        <td>{row.company_name}</td>
        <td className="job-url-cell" title={row.job_url}>{row.job_url}</td>
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