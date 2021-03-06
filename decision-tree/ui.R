###########################################################
#   Classification and Regression Tree App (ui)           #
###########################################################

shinyUI(
  fluidPage(
    
  #  titlePanel("Classification and Regression Tree"),
    headerPanel(title=div(img(src="isb.png",align = "right"), h2("Decision Tree App", style="bold")),windowTitle	='Decision Tree'),
    
    sidebarLayout(
      
      sidebarPanel(
        # Upload data:
        h4(p(" Data Input")),
        fileInput("file", "Upload data (csv file)"),
        sliderInput('sample','test sample percentage',10,40,25),
        # h4(p("Select Response Variable")),
        sliderInput('cp','complexity parameter',0,0.5,0),
        fileInput("filep", "Upload new data for prediction (csv file)"),
        htmlOutput("yvarselect"),
        htmlOutput("xvarselect"),
      #  submitButton(text = "Apply Changes", icon("refresh")),br(),
        htmlOutput("fxvarselect")
      ),   # end of sidebar panel
      
    mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("Overview",
                             h4(p("How to use this shiny application")),
                             p("This shiny application require one data input from the user. To do so, click on the Browse (in left side-bar panel) and upload the csv data input file.
                           Note that this application can read only csv file (comma delimited file), so if you don't have csv input data file, first convert your data in csv format 
                           and then proceed. Make sure you have top row as variable names.",align="justify"),
                             p("Once csv file is uploaded successfully, variables in the data file will reflect in left-side Data Selection Panel. Now you can select 
                            dependent variable (Y Variable) from drop-down menu. By default all other remaining variables will be selected as explanatory variables (X variables). 
                              If you want to drop any variable from explanatory variables, just uncheck that variable and it will be dropped from the model.
                            ",align="justify"),
                             p('You can adjust the validation sample proportion from the slider in left sidebar panel. Validation sample will be selected from the input data set. 
                               If you have a similar data set on which you want to make the prediction based on regression tree, You can upload that data set in left side bar panel. 
                               Please note that prediction data should have all explanatory variables similar to model data.',align="justify"),
                             p('You can also adjust the complexity parameter in decision tree model to control size of the tree.'),
                             br(),
                           #  h4(p("Download Sample Input Files")),
                          #   downloadButton('downloadData', 'Download Sample Data (works only in browsers)'),
                           #  br(), br(),
                          #   p("*Please note that download will not work with RStudio interface. Download will work only in web-browsers.")
                            ), # close Overview tab
                            
                    #tabPanel("Data Summary",verbatimTextOutput('summarydata')),
                    tabPanel("Summary Stats",h4("Data"), verbatimTextOutput("head"),verbatimTextOutput("tail"),
                            h4("Data Summary"),verbatimTextOutput("summarydata"),h4("Missing Data Rows"),verbatimTextOutput("missing")),
                    tabPanel("Model Output",
                             h4('Model Result Summary'),
                             verbatimTextOutput("results"),
                             h4('Variable importance'),
                             verbatimTextOutput('imp'),
                             h4('Number of Rows and Columns in Training Data'),
                             verbatimTextOutput('trainobs'),
                             h4('Model Accuracy/Error in Training Data'),
                             verbatimTextOutput("validation"),
                             h4('Number of Rows and Columns in Test Data'),
                             verbatimTextOutput('testobs'),
                             h4('Model Accuracy/Error in Test Data'),
                             verbatimTextOutput("validation1"),
                            # h4("First 10 predictions of train data"),
                            # p('"Yhat" column is the predicted value.'),
                            # verbatimTextOutput('predictionorg'),
                             h4("Download Input Data with Predictions"),
                             downloadButton('downloadData0', 'Download predictions (Works only in browser)')
                             ),
                    tabPanel('Summary of Splits',verbatimTextOutput("summary")),
                    tabPanel("Decision Tree",
                             h4('range of optimal cp'),verbatimTextOutput("cpselect"),
                             # h4('Regression Tree'),
                             #sliderInput('height','chart height',500,5000,1100),
                             plotOutput("plot3",height = 1600),
                       #      h4('Visualize cross-validation results'),
                             plotOutput("plot1",height = 800)
                             ),                   
               #     tabPanel("Node labels",plotOutput("plot2",height = 600, width = 850),
                #             #h4("First column is assigned node number for each obsrvn in model training data"),
                 #            #verbatimTextOutput("nodesout1"),
                  #           dataTableOutput("nodesout"),
                   #          br(),
                    #         h4("Download nodes data from model training data"),
                     #        br(),
                      #       downloadButton('downloadData3','Download nodes data (Works only in browser)')
                       #      ),
                    #tabPanel("Variable",verbatimTextOutput('imp')),
                    tabPanel("Prediction New Data",br(),
                             #h4('Number of Rows and Columns in New Prediction Data'),
                             #verbatimTextOutput('predictobs'),
                             h4("First 10 rows of new data with predictions"),
                             p('"Yhat" column is the predicted value.'),
                             verbatimTextOutput('prediction'),
                             h4("Download new data with predictions"),
                             downloadButton('downloadData1', 'Download predictions (Works only in browser)')
                             )
                             
        ) # end of tabsetPanel
      )# end of main panel
    ) # end of sidebarLayout
  )  # end if fluidPage
) # end of UI



