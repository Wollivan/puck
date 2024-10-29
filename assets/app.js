const shareBtn = document.getElementById("share");

shareBtn.addEventListener("click", async () => {
  try {
    await navigator.share({
      title: "PRINT THIS FOR ME!\n",
      text: "Hey friend with a 3D printer...\nI found a game I want to play, please can you print me a copy? I'll let you win the first game!",
      url: "https://puck.wollivan.dev",
    });
    console.log("Data was shared successfully");
  } catch (err) {
    console.error("error:", err.message);
  }
});