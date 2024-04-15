document.addEventListener("turbo:load", () => {
  const tagNameInput = document.querySelector("#post-tag3");
    if (tagNameInput){
      const inputElement = document.getElementById("post-tag3");
    inputElement.addEventListener("input", () => {
      const keyword = document.getElementById("post-tag3").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/posts/search_tag/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result3");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const tagName = XHR.response.keyword;
          tagName.forEach((tag) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tag.id);
            childElement.innerHTML = tag.tag_name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(tag.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("post-tag3").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  };
});