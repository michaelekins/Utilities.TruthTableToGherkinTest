using System.Collections.Generic;
using System.IO;
using LumenWorks.Framework.IO.Csv;

// structure of csv must be: 
// "Given1Statement","Given2Statement","Given3Statement",,"Then1Statement","Then2Statement","Then3Statement"
// "Given1Value","Given2Value","Given3Value",,"Then1Value","Then2Value","Then3Value"

//example whenStatement: 
//      "When I try to fit the shape in the hole"
// example csv:
//      the shape,the colour,the hole,,shape fits,the colour
//      a square, red, a square,,true, irrelevant
//      a square,red,a circle,, false, irrelevant
//      a square, red, a triangle,,false, irrelevant
//      ...

// example output:
//      Given the shape is a square
//          And the colour is red
//          And the hole is a square
//          When I try to fit the shape in the hole
//          Then the shape fits is true
//          And the colour is irrelevant

namespace TruthTableToGherkinTest
{
    class Program
    {
        static void Main()
        {
            var csvFilename = @"C:\test\testfile.csv";

            var whenStatement = "When I try to fit the shape in the hole";            

            using (CsvReader csv = new CsvReader(new StreamReader(csvFilename), true))
            {
                int fieldCount = csv.FieldCount;
                string[] headers = csv.GetFieldHeaders();

                var outputLines = new List<string>();

                while (csv.ReadNextRecord())
                {
                    var colIndex = 0;
                    outputLines.Add(string.Format("Given {0} is {1}", headers[colIndex], csv[colIndex]));
                    colIndex++;

                    while (csv[colIndex] != "")
                    {
                        outputLines.Add(string.Format("    And {0} is {1}", headers[colIndex], csv[colIndex]));
                        colIndex++;
                    }

                    outputLines.Add(string.Format("    {0}", whenStatement));
                    colIndex++;

                    outputLines.Add(string.Format("    Then {0} is {1}", headers[colIndex], csv[colIndex]));
                    colIndex++;

                    while (colIndex < fieldCount)
                    {
                        outputLines.Add(string.Format("    And {0} is {1}", headers[colIndex], csv[colIndex]));
                        colIndex++;
                    }

                    outputLines.Add("");
                }

                System.IO.File.WriteAllLines(@"C:\test\gherkinTests.txt", outputLines);
            }
        }
    }
}
