view: Navigation_Bar {
  derived_table: {
    sql: Select '3PDC Metrics Summary' AS Dashboard_Name
          UNION ALL Select '3PDC POC Data Security' AS Dashboard_Name
            UNION ALL Select '3PDC POC Machine Maintenance' AS Dashboard_Name

      ;;
  }
  measure: dash_nav {
    hidden: no
    label: "Navigation Bar"
    type: string
    sql: "";;
    html:
    <div style="background-color: #FFFFFF; height:525px;width:100%"></div>
      <div style="background-color: #FFFFFF; border: solid 1px #4285F4; border-radius: 5px; padding: 5px 10px; height: 60px; width:100%">
        <nav style="font-size: 18px; color: #4285F4">
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/three_pdc_dashboards/three_pdc_metrics_summary?">3PDC Metrics Summary</a>
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/three_pdc_dashboards::three_pdc_data_security?">3PDC POC Data Security</a>
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::three_pdc_machine_maintenance?">3PDC POC Machine Maintenance</a>
        </nav>
        </nav>
      </div>
    <div style="background-color: #FFFFFF; height:500px;width:100%"></div>;;
  }

}
