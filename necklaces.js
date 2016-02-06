// Source: https://www.jasondavies.com/necklaces/

var w = 750,
    h = 600,
    p = 5.5,
    r = w / 20 - 2 * p,
    fill = d3.scale.ordinal().range(["#000", "#fff", "#00f", "#0f0", "#f00"].concat(d3.scale.category20().range()));

var svg = d3.select("#vis").append("svg")
    .attr("width", w + 2 * p)
    .attr("height", h + 2 * p);

svg.append("g")
    .attr("transform", "translate(" + [r + p, r + p] + ")");

d3.selectAll("#n, #k, #b")
    .on("change", changeHandler(update))
    .on("click", changeHandler(update));

update();

function changeHandler(action) {
  return function() {
    var a = "value",
        b = "defaultValue";
    if (this.type === "checkbox") {
      a = "checked";
      b = "defaultChecked";
    }
    if (this[a] === this[b]) return;
    action();
    this[b] = this[a];
  };
}

function update() {
  var n = +d3.select("#n").property("value"), // number of beads
      k = +d3.select("#k").property("value"), // number of colours
      b = d3.select("#b").property("checked"); // restrict to bracelets
  fill.domain(d3.range(k));

  var data = (b ? bracelets : fkm)(n, k);

  var necklace = svg
      .attr("height", Math.ceil(data.length / 10) * (2 * r + 4 * p) + r)
    .select("g").selectAll("g")
      .data(data, function(d) { return d.join(""); });
  necklace.enter().append("g")
    .append("circle")
      .attr("cy", r)
      .attr("r", r);
  necklace.exit().remove();
  necklace.attr("transform", function(d, i) { return "translate(" + (2 * r + 4 * p) * (i % 10) + "," + (2 * r + 4 * p) * ~~(i / 10) + ")"; })
  var bead = necklace.selectAll("circle.bead")
      .data(Object);
  bead.enter().append("circle")
      .attr("class", "bead")
      .attr("r", 5);
  bead.exit().remove();
  bead.attr("transform", function(d, i) { return "rotate(" + i * 360 / n + " " + [0, r] + ")"; })
      .style("fill", fill)
  d3.select("#count").text(data.length);
}

// Generate all necklaces of length n from alphabet [0, â€¦, k - 1].
// Algorithm due to Fredricksen, Kessler and Maiorana.
function fkm(n, k) {
  var necklaces = [],
      a = [],
      i = -1,
      j;
  while (++i < n) a[i] = 0;
  necklaces.push(a.slice());
  while (1) {
    i = n;
    while (--i >= 0) if (a[i] < k - 1) break;
    if (i < 0) break;
    a[j = i++]++;
    while (++j < n) a[j] = a[j % i];
    if (n % i === 0) necklaces.push(a.slice());
  }
  return necklaces;
}

// Algorithm due to Joe Sawada, "Generating Bracelets in constant amortized
// time", SIAM Journal on Computing archive Volume 31 , Issue 1 (2001).
function bracelets(n, k) {
  var a = [],
      i = -1;
  while (++i < n) a[i] = 0;
  return genb(1, 1, 1, -1, 0, false);

  function genb(t, p, r, u, v, rs) {
    var result = [];
    if (t - 1 > (n - r) / 2 + r) {
      if (a[t - 1] > a[n - t + 2 + r]) rs = false;
      else if (a[t - 1] < a[n - t + 2 + r]) rs = true;
    }
    if (t > n) {
      if (!rs && n % p === 0) result.push(a.slice(1));
    } else {
      a[t] = a[t - p];
      v = a[t] === a[1] ? v + 1 : 0;

      if (u === -1 && a[t - 1] !== a[1]) u = r = t - 2;
      if (u === -1 || t !== n || a[n] !== a[1]) {
        if (u === v) {
          var rev = checkrev(t, u);
          if (rev !== -1) result = result.concat(genb(t + 1, p, rev ? t : r, u, v, rev ? false : rs));
        } else result = result.concat(genb(t + 1, p, r, u, v, rs));
      }
      for (var j = a[t - p] + 1; j < k; j++) {
        a[t] = j;
        result = result.concat(genb(t + 1, t , r, u, 0, rs));
      }
    }
    return result;
  }

  function checkrev(t, i) {
    while (++i < (t + 1) / 2 + 1) {
      if (a[i] < a[t - i + 1]) return 0;
      if (a[i] > a[t - i + 1]) return -1;
    }
    return 1;
  }
}
