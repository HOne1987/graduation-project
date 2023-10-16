//update image
const aiImg = document.getElementById("ai_img");
const imgIn = document.getElementById("img_in");
imgIn.onchange = function () {
    aiImg.src = URL.createObjectURL(imgIn.files[0])
}
function pc1() {
    document.getElementById('ai_img').src = "img/bird.jpg";
}
function pc2() {
    document.getElementById('ai_img').src = "img/bgbird.png";
}
function pc3() {
    document.getElementById('ai_img').src = "img/sheeplq.jpg";
}
function pc4() {
    document.getElementById('ai_img').src = "img/SheepOG_out.jpg";
}
function pc5() {
    document.getElementById('ai_img').src = "img/ObjectDeletionBefore.jpg";
}
function pc6() {
    document.getElementById('ai_img').src = "img/ObjectDeletionAfter.jpg";
}
function pc7() {
    document.getElementById('ai_img').src = "img/Instructpix2pixBefore.jpg";
}
function pc8() {
    document.getElementById('ai_img').src = "img/Instructpix2pixAfter.jpg";
}







//charater counter
const messageEle = document.getElementById('prom');
const counterEle = document.getElementById('counter');

messageEle.addEventListener('input', function (e) {
    const target = e.target;

    // Get the `maxlength` attribute
    const maxLength = target.getAttribute('maxlength');

    // Count the current number of characters
    const currentLength = target.value.length;

    counterEle.innerHTML = `${currentLength}/${maxLength}`;
});
