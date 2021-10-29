entries = [];

function fetchData() {
  
}




function loadData() {
  d3.json("data.json").then(function(data_json) {
    entries = data_json;
    radar_visualization({
      svg_id: "radar",
      width: 1450,
      height: 1000,
      colors: {
        background: "#fff",
        grid: "#bbb",
        inactive: "#ddd"
      },
      title: "KW-Commerce Tech Radar — 2021.10",
      quadrants: [
        { name: "Architecture" },
        { name: "Backend" },
        { name: "Frontend" },
        { name: "Data Storage" },
      ],
      rings: [
        { name: "ADOPT", color: "#82b74b" },
        { name: "TRIAL", color: "#b2ad7f" },
        { name: "ASSESS", color: "#92a8d1" },
        { name: "HOLD", color: "#d64161" }
      ],
      print_layout: true,
      // zoomed_quadrant: 0,
      //ENTRIES
      entries: entries
      //ENTRIES
    });
  });
  
  }