String getpost = """
 query MyQuery {
  posts {
    nodes {
      title
      content
      featuredImage {
        sourceUrl
      }
      special_message {
        message
      }
    }
  }
}


""";