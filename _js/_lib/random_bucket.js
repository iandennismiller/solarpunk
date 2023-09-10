// http://stackoverflow.com/a/12987776/1146681
var bucket = [];

function getRandomFromBucket() {
   var randomIndex = Math.floor(Math.random()*bucket.length);
   return bucket.splice(randomIndex, 1)[0];
}

function initRandomBucket(len) {
    for (var i = 0; i < len; i++) {
        bucket.push(i);
    }
}
