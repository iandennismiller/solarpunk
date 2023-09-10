var searchIndex;
var citations;

var BASE_URL = "/covid-web";


var indexLoaded = function (e) {
    var resp = pako.inflate(e.target.response, { to: 'string' });
    var data = JSON.parse(resp);
    searchIndex = lunr.Index.load(data);

    document.getElementById("wait").style.display = "none";
    document.getElementById("search").placeholder = "search";
    // document.getElementById("search").disabled = false;
    document.getElementById("search").focus();

    if (location.search != "") {
        search(get_search_query());
    }
    else {
        document.getElementById("search").placeholder = "ready to search";
    }
}


var citationsLoaded = function (e) {
    var resp = pako.inflate(e.target.response, { to: 'string' });
    citations = JSON.parse(resp);
}


var search = function(query) {
    var search_field = document.getElementById("search");
    if (search_field) {
        search_field.value = query;
    }

    results = searchIndex.search(query);

    var results_node = document.getElementById("results");
    results_node.innerHTML = "";

    var result_count = document.getElementById("result_count");
    result_count.innerText = results.length + " documents found.";

    for (var idx in results) {
        var cite_data = citations[results[idx].ref];

        var link_node = document.createElement("a");
        link_node.appendChild(document.createTextNode(cite_data['t']));
        link_node.href = BASE_URL + "/articles/" + results[idx].ref.toLowerCase() + ".html";
        link_node.className = "search-result";

        var meta_node = document.createElement("p");

        var author_str = '';
        for (var author_idx in cite_data['a']) {
            var author_link_node = document.createElement("a");
            author_link_node.appendChild(document.createTextNode('👤\xa0' + cite_data['a'][author_idx]));
            author_link_node.href = BASE_URL + "/authors/" + slugify(cite_data['a'][author_idx], {lower: true, remove: /[*+~.,()"!:@]/g}).replace("'", "-") + ".html";
            meta_node.appendChild(author_link_node);
            meta_node.appendChild(document.createTextNode(" "));
        }
        meta_node.appendChild(document.createTextNode(" ⏰\xa0" + cite_data['y']));

        var journal_link_node = document.createElement("a");
        journal_link_node.appendChild(document.createTextNode(" 📚\xa0" + cite_data['j']));
        journal_link_node.href = BASE_URL + "/journals/" + slugify(cite_data['j'], {lower: true, remove: /[*+~.,()'"!:@]/g}) + ".html";
        meta_node.appendChild(journal_link_node);

        var list_node = document.createElement("LI");
        list_node.appendChild(link_node);
        list_node.appendChild(meta_node);

        results_node.appendChild(list_node);

        // if (idx > 20) {
        //     break;
        // }
    }

    if (results.length == 0) {
        var list_node = document.createElement("LI");
        list_node.appendChild(document.createTextNode("No results"));
        results_node.appendChild(list_node);
    }

}


var search_from_field = function() {
    var query = document.getElementById("search").value;
    search(query);
}


var request_index = function() {
    var xhr = new XMLHttpRequest;
    xhr.responseType = "arraybuffer";
    xhr.open('get', BASE_URL + '/data/index.json.gz');
    xhr.addEventListener('load', indexLoaded);
    xhr.send();    
}


var request_citations = function() {
    var xhr_citations = new XMLHttpRequest;
    xhr_citations.responseType = "arraybuffer";
    xhr_citations.open('get', BASE_URL + '/data/citations.json.gz');
    xhr_citations.addEventListener('load', citationsLoaded);
    xhr_citations.send();
}


var init_search_field = function() {
    var button_node = document.getElementById("search_button");
    button_node.addEventListener("click", search_from_field); 
    
    // Execute a function when the user releases a key on the keyboard
    var search_input_node = document.getElementById("search");
    search_input_node.addEventListener("keyup", function(event) {
    // Number 13 is the "Enter" key on the keyboard
    if (event.keyCode === 13) {
        // Cancel the default action, if needed
        event.preventDefault();
        // Trigger the button element with a click
        document.getElementById("search_button").click();
    }
    });    
}


var get_search_query = function() {
    var queryString = location.search; // Returns:'?q=123'
    let params = new URLSearchParams(queryString);
    let query = params.get("q");

    return(query);
}


var init_search = function() {
    init_search_field();
    request_index();
    request_citations();

    if (location.search != "") {
        var search_field = document.getElementById("search");
        if (search_field) {
            search_field.value = get_search_query();
        }
    }

}
