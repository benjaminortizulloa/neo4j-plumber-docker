con <- neo4r::neo4j_api$new(
  url = "http://host.docker.internal:1234", 
  user = "", 
  password = ""
)


#' @get /count
get_node_count <- function(){
  res <- neo4r::call_neo4j('MATCH (m) RETURN COUNT(m)', con)
  return(res)
} 

#' @get /data
get_node_data <- function(){
  res <- neo4r::call_neo4j('MATCH (m) RETURN m', con)
  return(res$m)
}

#' @get /delete
delete_data <- function(){
  res <- neo4r::call_neo4j("MATCH (m) DETACH DELETE(m)", con)
  return("success")
}

#' @get /reset
reset_data <- function(){
  set.seed(4321)
  lapply(sample(1:nrow(iris), 30), function(i){
    node <- neo4r::vec_to_cypher(iris[i,], "Species")
    qry <- paste("MERGE", node)
    neo4r::call_neo4j(qry, con)
  })
  
  return('success')
}

reset_data()
