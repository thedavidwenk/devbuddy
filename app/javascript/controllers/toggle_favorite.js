// Listen for AJAX success event
document.addEventListener('ajax:success', function(event) {
  const xhr = event.detail[2];
  const status = xhr.status;
  
  // Check if the AJAX request was successful (status 200)
  if (status === 200) {
    const responseData = xhr.response;
    
    // Update the HTML element with the new content or handle as needed
    // For example, update a specific container with new HTML content
    const updatedContent = document.querySelector('.favorites-container');
    updatedContent.innerHTML = responseData;
  } else {
    console.error('Error: AJAX request failed.');
  }
});