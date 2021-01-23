<img src="/TruthTableToGherkinTest/gherkinTestFromTruthTableLogo.ico"></img>

# Utilities.TruthTableToGherkinTest

Download installer from [www.michaelekins.co.uk](https://www.michaelekins.co.uk/projects.html#gherkinTestFromTruthTable)

Structure of csv must be:
> ""Header1","Header2","Header3","Header4","Header5","Header6"
> "Given1Statement","Given2Statement","Given3Statement",,"Then1Statement","Then2Statement","Then3Statement"
> "Given1Value","Given2Value","Given3Value",,"Then1Value","Then2Value","Then3Value"

Please note the empty column between **Given** and **Then** statements

example whenStatement (define this in the code):
>      "When I try to fit the shape in the hole"
 example csv file:
>      the shape,the colour,the hole,,shape fits,the colour
>      a square,red,a square,,true,irrelevant
>      a square,red,a circle,, false,irrelevant
>      a square,red,a triangle,,false,irrelevant
>      ...

 example output:
>      Given the shape is a square
>          And the colour is red
>          And the hole is a square
>          When I try to fit the shape in the hole
>          Then the shape fits is true
>          And the colour is irrelevant

