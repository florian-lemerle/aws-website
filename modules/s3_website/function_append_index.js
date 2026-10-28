async function handler(event) {
  var request = event.request;
  var uri = request.uri;
        
  // Check whether the URI is missing a file name (e.g. /posts/)
  if (uri.endsWith('/')) {
      request.uri += 'index.html';
  } 
  // Check whether the URI is missing a file extension (e.g. /posts/my-post)
  else if (!uri.includes('.')) {
      request.uri += '/index.html';
  }
        
  return request;
}