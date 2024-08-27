// alert function used to alert user before delete post or page
function checkAlert(e, confTitle, confMsg) {
  let background = document.createElement("div");
  background.classList.add("popup-background");
  let popup = document.createElement("div");
  popup.classList.add("popup", "text-center");
  let heading = document.createElement("h2");
  heading.classList.add("cap");
  heading.innerHTML = confTitle;
  let msg = document.createElement("p");
  msg.classList.add("lead");
  msg.innerHTML = confMsg;
  let continueBtn = document.createElement("a");
  continueBtn.classList.add("btn", "btn-danger", "cap");
  continueBtn.innerHTML = "delete";
  let targeLink = e.target.href;
  if (targeLink == undefined || targeLink == "") {
    targeLink = e.target.parentElement.href;
  }
  continueBtn.setAttribute("href", targeLink);
  let cancelBtn = document.createElement("a");
  cancelBtn.classList.add("btn", "btn-info", "cap", "mr-5");
  cancelBtn.innerHTML = "cancel";
  cancelBtn.onclick = (e) => {
    e.preventDefault();
    _(".popup-background").remove();
  };
  background.onclick = (e) => {
    _(".popup-background").remove();
  };
  popup.appendChild(heading);
  popup.appendChild(msg);
  popup.appendChild(cancelBtn);
  popup.appendChild(continueBtn);
  background.appendChild(popup);
  document.body.appendChild(background);
}

// just a short cut for document.getElemntById
function _(selector) {
  return document.querySelector(selector);
}

// validate function for text fields like title or description fields
function textValidate(object) {
  if (object.value.length <= 3) {
    object.classList.remove("is-valid");
    object.classList.add("is-invalid");
  } else {
    object.classList.remove("is-invalid");
    object.classList.add("is-valid");
  }
}

// validate function for number field like order or phone or dxnid fields
function intValidate(object, from, to = 9999999) {
  if (object.value.length > 0 && object.value >= from && object.value <= to) {
    object.classList.remove("is-invalid");
    object.classList.add("is-valid");
  } else {
    object.classList.remove("is-valid");
    object.classList.add("is-invalid");
  }
}

function inArray(needle, haystack) {
  let length = haystack.length;
  for (let i = 0; i < length; i++) {
    if (haystack[i] == needle) return true;
  }
  return false;
}

// validate function for image field like course image or episode image fields
function imgValidate(input) {
  const accepts = ["jpg", "jpeg", "png"];
  if (input.files[0]) {
    let imgExtArray = input.files[0].name.split(".");
    let imgExt = imgExtArray[imgExtArray.length - 1];
    if (!inArray(imgExt, accepts)) {
      input.classList.remove("is-valid");
      input.classList.add("is-invalid");
      input.name = "";
    } else {
      input.classList.remove("is-invalid");
      input.classList.add("is-valid");
      input.name = input.getAttribute("data-name");
    }
  } else {
    input.classList.remove("is-valid");
    input.classList.add("is-invalid");
    input.name = "";
  }
}

if (document.forms.length > 0) {
  let inputs = document.querySelectorAll('input:not([type="hidden"])');
  inputs.forEach((input) => {
    if (input.getAttribute("data-validate") == "text") {
      if (input.value.length == 0) {
        input.onblur = () => {
          textValidate(input);
        };
      } else {
        textValidate(input);
      }
      input.addEventListener("input", () => {
        textValidate(input);
      });
    } else if (input.getAttribute("data-validate") == "order") {
      if (input.value.length == 0) {
        input.onblur = () => {
          intValidate(input, 1, input.getAttribute("data-max-value"));
        };
      } else {
        intValidate(input, 1, input.getAttribute("data-max-value"));
      }
      input.addEventListener("input", () => {
        intValidate(input, 1, input.getAttribute("data-max-value"));
      });
    } else if (input.getAttribute("data-validate") == "phone") {
      intValidate(
        input,
        _("#phoneNumberLength").getAttribute("data-from"),
        _("#phoneNumberLength").getAttribute("data-to")
      );
      input.addEventListener("input", () => {
        intValidate(
          input,
          _("#phoneNumberLength").getAttribute("data-from"),
          _("#phoneNumberLength").getAttribute("data-to")
        );
      });
    } else if (input.getAttribute("data-validate") == "dxnid") {
      intValidate(input, 9, 9);
      input.addEventListener("input", () => {
        intValidate(input, 9, 9);
      });
    } else if (input.getAttribute("data-validate") == "image") {
      input.addEventListener("input", () => {
        imgValidate(input);
      });
    }
  });

  let textareas = document.querySelectorAll("textarea");
  textareas.forEach((textarea) => {
    if (textarea.getAttribute("data-validate") == "text") {
      if (textarea.value.length == 0) {
        textarea.onblur = () => {
          textValidate(textarea);
        };
      } else {
        textValidate(textarea);
      }
      textarea.addEventListener("input", () => {
        textValidate(textarea);
      });
    }
  });
}

if (document.querySelectorAll(".alert-check").length > 0) {
  alertCheck = document.querySelectorAll("a.alert-check");
  alertCheck.forEach((check) => {
    check.onclick = (e) => {
      e.preventDefault();
      checkAlert(
        e,
        "are you sure ?",
        "you will delete this course to continue click delete"
      );
    };
  });
}

if (document.querySelectorAll(".alert-check-episode").length > 0) {
  alertCheckEpisodes = document.querySelectorAll(".alert-check-episode");
  alertCheckEpisodes.forEach((check) => {
    check.onclick = (e) => {
      e.preventDefault();
      checkAlert(
        e,
        "are you sure ?",
        "you will delete this episode, to continue click delete"
      );
    };
  });
}

if (document.getElementById("visibility_viw")) {
  let visible_btn = document.getElementById("visibility_viw");
  let visible_inp = document.getElementById("visibility_inp");

  if (visible_btn.classList.contains("btn-danger")) {
    visible_btn.innerHTML = visible_btn.getAttribute("data-toggle");
    visible_inp.value = "0";
  } else {
    visible_btn.innerHTML = visible_btn.getAttribute("data-val");
    visible_inp.value = "1";
  }

  visible_btn.addEventListener("click", (e) => {
    e.target.classList.toggle("btn-danger");
    e.target.classList.toggle("btn-success");
    if (e.target.classList.contains("btn-danger")) {
      e.target.innerHTML = e.target.getAttribute("data-toggle");
      visible_inp.value = "0";
    } else {
      e.target.innerHTML = e.target.getAttribute("data-val");
      visible_inp.value = "1";
    }
  });
}

if (document.querySelectorAll(".quest-box").length > 0) {
  let percent = document.getElementById("examPercent");
  if (percent.innerHTML.substr(0, percent.innerHTML.length - 1) == 100) {
    _(".card").classList.add("card-success");
  } else {
    _(".card").classList.add("card-danger");
  }
}

if (_(".addQuestion")) {
  let oldRemoveBtn = document.querySelectorAll(".remove-btn");
  if (oldRemoveBtn.length > 0) {
    oldRemoveBtn.forEach((rmBtm) => {
      rmBtm.addEventListener("click", () => {
        rmBtm.parentElement.parentElement.parentElement.style.display = `none`;
        let deleteInput = document.createElement("input");
        deleteInput.name = `questions[${rmBtm.parentElement
          .querySelector(".input-question")
          .getAttribute("data-number")}][2]`;
        deleteInput.value = `delete`;
        rmBtm.parentElement.appendChild(deleteInput);
      });
    });
  }
  let oldRemoveAnserBtn = document.querySelectorAll(".anser-remove-btn");
  if (oldRemoveAnserBtn.length > 0) {
    oldRemoveAnserBtn.forEach((rmAnBtm) => {
      rmAnBtm.addEventListener("click", () => {
        rmAnBtm.parentElement.parentElement.style.display = `none`;
        rmAnBtm.parentElement.parentElement.querySelector(
          `input:nth-of-type(2)`
        ).value = "delete";
      });
    });
  }

  let oldaddAnserBtns = document.querySelectorAll(".add-anser-btn");
  oldaddAnserBtns.forEach((oldAddAnserBtn) => {
    oldAddAnserBtn.onclick = (e) => {
      e.preventDefault();
    };
    oldAddAnserBtn.addEventListener("click", () => {
      let anserCount = oldAddAnserBtn.parentElement.querySelectorAll(
        'input:not([type="hidden"])'
      ).length;
      let oldanserInput = document.createElement("input");
      let oldisRightInput = document.createElement("input");
      let oldIsrightBtn = document.createElement("span");
      oldIsrightBtn.classList.add("is_right", "bg-danger");
      oldIsrightBtn.addEventListener("click", function () {
        this.classList.toggle("bg-danger");
        this.classList.toggle("bg-success");
        if (this.classList.contains("bg-danger")) {
          oldIsrightBtn.value = 0;
        } else {
          oldIsrightBtn.value = 1;
        }
      });
      let oldOptionsArea = document.createElement("div");
      oldOptionsArea.classList.add("options");
      let oldAnserContainer = document.createElement("div");
      let oldRemoveAnserBtn = document.createElement("span");
      oldRemoveAnserBtn.classList.add("anser-remove-btn");
      oldRemoveAnserBtn.innerHTML = cancelBtnContent;
      oldRemoveAnserBtn.addEventListener("click", function () {
        this.parentElement.parentElement.remove();
      });
      oldOptionsArea.appendChild(oldRemoveAnserBtn);
      oldOptionsArea.appendChild(oldIsrightBtn);
      oldAnserContainer.classList.add("anser-container");
      oldanserInput.addEventListener("input", () => {
        textValidate(oldanserInput);
      });
      oldanserInput.addEventListener("blur", () => {
        textValidate(oldanserInput);
      });

      oldanserInput.placeholder = `anser ${anserCount + 1}`;
      oldanserInput.type = `text`;
      oldanserInput.name = `ansers[${oldAddAnserBtn.parentElement.previousElementSibling
        .querySelector(".input-question")
        .getAttribute("data-number")}][${anserCount}][0]`;
      oldisRightInput.type = `hidden`;
      oldisRightInput.name = `ansers[${oldAddAnserBtn.parentElement.previousElementSibling
        .querySelector(".input-question")
        .getAttribute("data-number")}][${anserCount}][1]`;
      oldanserInput.classList.add("form-control", "mb-2", "anser-input");
      if (oldAddAnserBtn.parentElement.querySelector(".custom-alert")) {
        oldAddAnserBtn.parentElement.querySelector(".custom-alert").remove();
      }
      oldAnserContainer.appendChild(oldanserInput);
      oldAnserContainer.appendChild(oldisRightInput);
      oldAnserContainer.appendChild(oldOptionsArea);
      oldAddAnserBtn.parentElement.appendChild(oldAnserContainer);
    });
  });

  let oldHeadingText = document.querySelectorAll(
    ".question-box .card-header h3"
  );
  oldHeadingText.forEach((oldHeading) => {
    let oldInputHeading = oldHeading.parentElement.querySelector(
      ".input-question"
    );
    let oldremoveBtn = oldHeading.parentElement.querySelector(".remove-btn");
    oldInputHeading.addEventListener("blur", () => {
      if (oldInputHeading.value.length > 0) {
        oldHeading.innerHTML = oldInputHeading.value;
      }
      oldHeading.style.display = "block";
      oldInputHeading.type = "hidden";
      oldremoveBtn.style.display = "inline";
    });
    oldInputHeading.value = oldHeading.innerHTML;
    oldHeading.addEventListener("click", () => {
      oldInputHeading.value = oldHeading.innerHTML;
      oldInputHeading.type = "text";
      oldInputHeading.focus();
      oldHeading.style.display = "none";
      oldremoveBtn.style.display = "none";
    });
  });

  let oldIsrightBtn = document.querySelectorAll(".options .is_right");
  oldIsrightBtn.forEach((OldIsright) => {
    OldIsright.addEventListener("click", function () {
      this.classList.toggle("bg-success");
      this.classList.toggle("bg-danger");
      if (this.classList.contains("bg-danger")) {
        this.parentElement.parentElement.querySelector(
          "input:nth-of-type(2)"
        ).value = 0;
      } else {
        this.parentElement.parentElement.querySelector(
          "input:nth-of-type(2)"
        ).value = 1;
      }
    });
  });

  let questionsCount = document.querySelectorAll(".question-box").length + 1;
  let cancelBtnContent =
    '<span class="cancel-btn-content"></span><span class="cancel-btn-content"></span>';
  let addQuestion = _(".addQuestion");
  addQuestion.addEventListener("click", () => {
    let b_holder = document.createElement("div"); // bootstrap container [ col-md-4 ]
    b_holder.classList.add("col-md-4", "mb-2");
    let card = document.createElement("div"); // card div
    card.classList.add("card", "questions-box");
    let cardHeader = document.createElement("div"); // card header
    cardHeader.classList.add("card-header", "box-header", "text-center");
    let headingText = document.createElement("h3"); // card header text
    let inputHeadin = document.createElement("input");
    inputHeadin.classList.add("form-control", "input-question");
    inputHeadin.name = `questions[${questionsCount}][0]`;
    inputHeadin.type = `hidden`;
    inputHeadin.setAttribute("data-number", questionsCount);
    let inputQuesId = document.createElement("input");
    inputQuesId.name = `questions[${questionsCount}][1]`;
    inputQuesId.type = `hidden`;
    inputQuesId.value = ``;
    inputHeadin.addEventListener("blur", () => {
      if (inputHeadin.value.length > 0) {
        headingText.innerHTML = inputHeadin.value;
      }
      headingText.style.display = "block";
      inputHeadin.type = "hidden";
      removeBtn.style.display = "inline";
    });
    let removeBtn = document.createElement("span");
    removeBtn.classList.add("remove-btn");
    removeBtn.addEventListener("click", () => {
      removeBtn.parentElement.parentElement.parentElement.remove();
    });
    removeBtn.innerHTML = cancelBtnContent;
    removeBtn.classList.add("big_close_btn");
    cardHeader.appendChild(removeBtn);
    headingText.innerHTML = `question ${questionsCount}`;
    inputHeadin.value = headingText.innerHTML;
    headingText.addEventListener("click", () => {
      inputHeadin.value = headingText.innerHTML;
      inputHeadin.type = "text";
      inputHeadin.focus();
      headingText.style.display = "none";
      removeBtn.style.display = "none";
    });

    let carBody = document.createElement("div");
    carBody.classList.add("card-body");
    let addAnserBtn = document.createElement("button");
    addAnserBtn.classList.add(
      "add-anser-btn",
      "btn",
      "btn-info",
      "mb-2",
      "float-right"
    );
    addAnserBtn.onclick = (e) => {
      e.preventDefault();
    };
    let icon = document.createElement("i");
    icon.classList.add("fa", "fa-fw", "fa-lg", "fa-plus");
    addAnserBtn.appendChild(icon);
    addAnserBtn.innerHTML += "Anser";
    let clickCounter = 1;
    addAnserBtn.addEventListener("click", () => {
      let anserinput = document.createElement("input");
      let isRightInput = document.createElement("input");
      let anserContainer = document.createElement("div");
      anserContainer.classList.add("anser-container");
      anserinput.addEventListener("input", () => {
        textValidate(anserinput);
      });
      anserinput.addEventListener("blur", () => {
        textValidate(anserinput);
      });

      anserinput.placeholder = `anser ${clickCounter}`;
      anserinput.name = `ansers[${addAnserBtn.parentElement.previousElementSibling
        .querySelector(".input-question")
        .getAttribute("data-number")}][${clickCounter}][0]`;
      isRightInput.name = `ansers[${addAnserBtn.parentElement.previousElementSibling
        .querySelector(".input-question")
        .getAttribute("data-number")}][${clickCounter}][1]`;
      isRightInput.type = `hidden`;
      isRightInput.value = `0`;
      anserinput.classList.add("form-control", "mb-2", "anser-input");
      let optionsArea = document.createElement("div");
      optionsArea.classList.add("options");
      let removeAnserBtn = document.createElement("span");
      removeAnserBtn.classList.add("anser-remove-btn");
      removeAnserBtn.addEventListener("click", () => {
        removeAnserBtn.parentElement.remove();
      });
      let is_right = document.createElement("span");
      is_right.classList.add("is_right", "bg-danger");
      is_right.addEventListener("click", function () {
        this.classList.toggle("bg-danger");
        this.classList.toggle("bg-success");
        if (this.classList.contains("bg-danger")) {
          isRightInput.value = 0;
        } else {
          isRightInput.value = 1;
        }
      });
      removeAnserBtn.innerHTML = cancelBtnContent;
      removeAnserBtn.appendChild(isRightInput);
      optionsArea.appendChild(is_right);
      optionsArea.appendChild(removeAnserBtn);
      anserContainer.appendChild(anserinput);
      anserContainer.appendChild(optionsArea);
      addAnserBtn.parentElement.appendChild(anserContainer);
      if (addAnserBtn.parentElement.querySelector(".custom-alert")) {
        addAnserBtn.parentElement.querySelector(".custom-alert").remove();
      }
      clickCounter++;
    });
    questionsCount++;
    let customAlert = document.createElement("div");
    customAlert.classList.add(
      "custom-alert",
      "custom-alert-danger",
      "float-left"
    );
    customAlert.innerHTML = "ther is no ansers";
    customAlertType = document.createElement("span");
    customAlertType.classList.add("type");
    customAlert.appendChild(customAlertType);
    carBody.appendChild(addAnserBtn);
    carBody.appendChild(customAlert);
    cardHeader.appendChild(headingText);
    cardHeader.appendChild(inputHeadin);
    cardHeader.appendChild(inputQuesId);
    card.appendChild(cardHeader);
    card.appendChild(carBody);
    b_holder.appendChild(card);
    _("form .container:last-of-type .row:last-of-type").appendChild(b_holder);
  });
}

let dayleTable = document.querySelector(".dayle-table");
if (dayleTable) {
  let videoHolfer = $(".video-holder");
  let videoToggler = $(".video-holder");
  let video = $(".video");

  videoToggler.click((e) => {
    videoHolfer.toggleClass("active");
    video.slideToggle(500);
  });
  textareas = dayleTable.querySelectorAll(".table-row .table-cell textarea");
  textareas.forEach((textarea) => {
    textarea.addEventListener("focus", () => {
      textarea.setAttribute("data-place", textarea.placeholder);
      textarea.removeAttribute("placeholder");
    });
    textarea.addEventListener("blur", () => {
      textarea.placeholder = textarea.getAttribute("data-place");
    });
    textarea.addEventListener("input", () => {
      textarea.parentElement.parentElement
        .querySelectorAll("textarea")
        .forEach((textarea) => {
          textarea.name = textarea.getAttribute("data-name");
        });
      let hiddenId = textarea.parentElement.parentElement.parentElement.querySelector(
        "input.id"
      );
      hiddenId.name = hiddenId.getAttribute("data-name");
    });
  });
}

let upldImage = _("#uploaded-image");
if (upldImage) {
  upldImage.addEventListener("change", () => {
    let preview = _("#image-review");
    if (upldImage.files.length > 0) {
      let src = URL.createObjectURL(upldImage.files[0]);
      preview.src = src;
      preview.classList.remove("inactive");
      _(".image-holder .icon").style.display = "none";
    } else {
      upldImage.classList.add("inactive");
      _(".image-holder .icon").style.display = "inline";
    }
  });
}

let navbar = _("nav.navbar");
if (navbar) {
  if (window.pageYOffset > 10) {
    navbar.classList.add("active");
  } else {
    navbar.classList.remove("active");
  }
  window.onscroll = function () {
    if (window.pageYOffset > 10) {
      navbar.classList.add("active");
    } else {
      navbar.classList.remove("active");
    }
  };
}

let BgObjects = document.querySelectorAll(".bg-object");
if (BgObjects.length > 0) {
  BgObjects.forEach((object) => {
    window.addEventListener("scroll", () => {
      let y = window.pageYOffset / 2;
      let objectTop = object.getClientRects()[0].top;
      if (y >= objectTop) {
        if (object.getAttribute("data-direction") == "left") {
          object.style.left = `${object.getAttribute("data-position")}px`;
        } else {
          object.style.right = `${object.getAttribute("data-position")}px`;
        }
      }
    });
  });
}

function upgradeToPrem(e) {
  popupBg = document.createElement("div");
  popupBg.classList.add("popup-background");

  popupContent = document.createElement("div");
  popupContent.classList.add("popup", "text-center");

  let heading = document.createElement("h3");
  heading.innerHTML = `upgrade to premium`;
  heading.classList.add("text-center", "cap");

  let paragraph = document.createElement("p");
  paragraph.classList.add("lead");
  paragraph.innerHTML = `to upgrade please contact us on:`;

  popupContent.appendChild(heading);
  popupContent.appendChild(paragraph);

  popupBg.appendChild(popupContent);
  document.body.appendChild(popupBg);

  popupBg.addEventListener("click", () => {
    popupBg.remove();
  });
}

let upgradeBtns = document.querySelectorAll(".upgradeToPrem");
if (upgradeBtns.length > 0) {
  upgradeBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
      upgradeToPrem();
    });
  });
}

let products = document.querySelectorAll(".product");
if (products.length > 0) {
  function removePopup() {
    document.querySelector(".popup-overlay").remove();
    document.querySelector(".img-box").remove();
  }
  products.forEach((product) => {
    product.addEventListener("click", (e) => {
      let popupOverlay = document.createElement("div");
      popupOverlay.className = "popup-overlay";
      document.body.appendChild(popupOverlay);
      popupOverlay.addEventListener("click", () => removePopup());

      let imgBox = document.createElement("div");
      imgBox.classList.add("img-box", "row", "container");
      document.body.appendChild(imgBox);

      let close = document.createElement("span");
      close.appendChild(document.createTextNode("X"));
      close.className = "colse-btn";
      imgBox.appendChild(close);

      let offsetRight = document.createElement("div");
      offsetRight.classList.add("offset-3");
      imgBox.appendChild(offsetRight);

      let imgHolder = document.createElement("div");
      imgHolder.setAttribute("class", "col-md-6");
      imgBox.appendChild(imgHolder);

      let img = document.createElement("img");
      img.src = product.querySelector("img").src;
      imgHolder.appendChild(img);

      let offsetLeft = document.createElement("div");
      offsetLeft.classList.add("offset-3");
      imgBox.appendChild(offsetLeft);

      // let content = document.createElement("div");
      // content.classList.add("content", "col-md-6");
      // imgBox.appendChild(content);

      // let title = document.createElement("h3");
      // title.classList.add("text-center", "cap");
      // title.innerHTML = product.getAttribute("data-title");
      // content.appendChild(title);

      // let paragraph = document.createElement("p");
      // paragraph.classList.add("lead");
      // paragraph.innerHTML = product.getAttribute("data-p");
      // content.appendChild(paragraph);

      close.addEventListener("click", () => removePopup());
    });
  });
}
