extern "C" void MODIFY_DATA(char* initial_data, char* modified_data);
#include <fstream>
#include <iostream>

void inputFromFile(char* data, int file_size)
{
   std::ifstream input_file;
   bool enter_file = 0;
   char file_name[100];
   while (!enter_file)
   {
      std::cout << "enter the file name: ";
      std::cin >> file_name;
      input_file.open(file_name);
      if (input_file.is_open())
         enter_file = true;
      else
         std::cout << "this file does not exist! try again.\n\n";
   }
   input_file.read(data, file_size);
   input_file.close();
}

void outputToFile(char* data, int file_size)
{
   std::ofstream output_file;
   output_file.open("output.txt");
   output_file << data;
   output_file.close();
}

int main()
{
   const int DATA_CAPACITY = 1024;
   char initial_data[DATA_CAPACITY], modified_data[DATA_CAPACITY];
   inputFromFile(initial_data, DATA_CAPACITY);
   MODIFY_DATA(initial_data, modified_data);
   outputToFile(modified_data, DATA_CAPACITY);
}