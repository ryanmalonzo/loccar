function selectionnerModele() {
    let id = location.search.split("id=")[1] ? parseInt(location.search.split("id=")[1]) : 0;
    if (id !== 0) {
        document.getElementById("model").selectedIndex = id;
    }
}

function chargerQuantite() {
    window.location.href = "index.php?controller=admin&action=stock&id=" + document.getElementById("model").value;
}

// Bouton de retour en haut de page

let btn = $("#scroll-to-top");

$(window).scroll(function() {
    300 < $(window).scrollTop() ? btn.show() : btn.hide()
}), btn.on("click", function() {
    window.scrollTo(0, 0)
});