entries = [];

function loadData() {
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function() {
      response = JSON.parse(this.responseText);
      console.log(response);
      entries = entries.concat(response);
      console.log(entries);
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
    }
    xhttp.open("GET", "http://asanatemplate.local/api/endpoint/tech-radar");
    xhttp.send();
  }