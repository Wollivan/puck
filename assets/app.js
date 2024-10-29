const shareBtn = document.getElementById("share");

shareBtn.addEventListener("click", async () => {
  try {
    await navigator.share({
      title: "PRINT THIS FOR ME!\n",
      text: "\nI found a game I want to play, please can you print me a copy? The website said to print with 100% infill whatever that means, but they sound smart, you should listen to them!",
      url: "https://github.com/Wollivan/puck/tree/main/puck",
    });
    console.log("Data was shared successfully");
  } catch (err) {
    console.error("error:", err.message);
  }
});