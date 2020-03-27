library(shiny)
library(RODBC)
library(RODBCext)

shinyServer(function(input, output) {
  
  connect = odbcConnect("DsnName", uid='root', pwd='root', DBMSencoding = "UTF-8")
  
  output$distPlot <- renderPlot({
    
    x    <- as.matrix(sqlQuery(odbcConnect("DsnName", uid='root', pwd='root', DBMSencoding = "UTF-8"),paste("select * from peptide_chain")))
    y  <- length(x)   
    hist(y,main="Histogram of % peptide length distribution in the ANTIPSEUDOMONAS  database" , 
         xlab="% peptide length distribution",breaks ="sturges", col = "chocolate", border = "white")
    
  })
  
  output$tabPP =DT::renderDataTable({datatable(sqlQuery(connect,paste("SELECT * from producer_organism")))})
  output$tabPO=DT::renderDataTable({datatable(sqlQuery(connect,paste("SELECT * from producer_organism")))})
  output$tabP=DT::renderDataTable({datatable(sqlQuery(connect,paste("SELECT name,formula, peptide_chain_peptide_chain_id, peptide_chain_spectral_analysis_id from peptide")))})
  output$tabPC =DT::renderDataTable({datatable(sqlQuery(connect,paste("SELECT sequence,spectral_analysis_id from peptide_chain" )))})
  
  data = sqlQuery(connect,paste("SELECT * from producer_organism"))
  data2 = sqlQuery(connect,paste("SELECT name,formula, peptide_chain_peptide_chain_id, peptide_chain_spectral_analysis_id from peptide"))
  data3 = sqlQuery(connect,paste("SELECT sequence,spectral_analysis_id from peptide_chain" ))
  
  

  Data_join= cbind(data, data2,data3)
  #fig <- plot_ly(data, labels = ~name,type = 'pie')
  output$tabPA=DT::renderDataTable({datatable(Data_join)})
  
  output$distPlot <- renderPlot({
    dataPIE=sqlqQuery(connect,"select name , count(*) FREQ from producer_organism group by name ")
    P=pie(dataPIE$FREQ, labels = dataPIE$name, main = "Distribution selon le nom")
    P
  })
  
  data4 = sqlQuery(connect,paste("SELECT * from pharmacological_properties"))
  data5 = sqlQuery(connect,paste("SELECT * from producer_organism"))
  join= cbind(data5, data4)
  output$tabPHAR=DT::renderDataTable({datatable(join)})
                   
  
  
})
