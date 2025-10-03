#!/bin/bash
#Damian Czarnecki 20004926 student_id
#ver 3.0
#12/06/2021



delete_file_1() {
  
         echo "you have chosen number 1"

         echo    "Enter filename you want to delete."
         #echo -n 
        #read userInput
        
        if [ -z $1 ] 		#checks if user input from cmd line was present
        then 
            echo "Filename field is empty. Please enter filename"
                read -p "Pretty please ?" userInput;
            	#renames the variable if cmd line input wasnt detected 
		fi

        while [ -z "$userInput" ] 		#checks if user input from cmd line was present
        do 
                echo "Still, ... Filename field is empty"
            
                read -p "$USER Please type filename" userInput;
            	#renames the variable if cmd line input wasnt detected 
		done



            if find -name $userInput -print -quit |grep '^'; #here script checks if the filename $userInput exists and if does follows with yes or no input
                then
                echo      "Is this the file you are looking for ?'$userInput'"
                echo -n "(Y) Yes or (N) No ? "
                read yn
                
            fi

            until [  -e $userInput ]; #if the file does not exists or is incorrect prompts user to retry or to quit to main menu
                do                  #additionally this whole process of invalid input error is put in a loop
                
                echo "These are not the files you are looking for.."   
                echo "You can try again, or..."
                read -p "Press 5 to return to main menu" userInput;
                

                if [ "$userInput" == '5' ]		#if user chooses 5 quits to main menu
                    then
                   return
                fi

                if find -name $userInput -print -quit |grep '^'; #here script checks if the filename $userInput exists and if does follows with yes or no input
                    then                                       #but is in the loop...
                
                    echo      "Is this the file you are looking for ?'$userInput'"
                    echo -n "(Y) Yes or (N) No ? "
                    read yn
                
                fi
            done
                

            

            if [ "$yn" == 'Y' ] || [ "$yn" == 'y' ] #if user chooses yes the file gets deleted 
                then
                rm -R $userInput
                echo "The file '$userInput' has been removed. Success!!!"
                read -p "Press enter to continue to Main Menu" # and asks to continue to main menu
                return
            else
                echo "File '$userInput' is safe and sound, not deleted" # if choosing anything else than Y or Y the file won't be deleted
                read -p "Press enter to continue to Main Menu" # and again asks to continue to main menu
                return
            fi
}

display_file_2() {
  		#Here code deals with Option 2 : file display
       
            echo "you have chosen number 2"
            echo   "Enter filename you want to display." #prompts user to enter filename to display        
            

            if [ -z $1 ] 		#checks if user input from cmd line was present
                then 
                echo "Filename field is empty. Please enter filename"
                read -p "Pretty please ?" userInput;
            	#renames the variable if cmd line input wasnt detected 
		    fi

            while [ -z "$userInput" ] 		#checks if user input from cmd line was present
                do 
                echo "Still, ... Filename field is empty"
            
                read -p "$USER Please type filename" userInput;
            	#renames the variable if cmd line input wasnt detected 
            done

            if find $userInput ; #here checks if the file exists, if it does asks if wants to be displayed: yes or no
                then
                echo    "Do you really want to display '$userInput' file?"
                echo -n "(Y) Yes or (N) No ? "
                read yn
                
            fi

            until [  -e $userInput ] ; # in case of incorrect input user is thrown in to a loop
                do                  
                
                echo "These are not the files you are looking for.."   #prompts user of invalid input filename 
                echo "You can try again, or..."                        #asks for a retry
                read -p "Press 5 to return to main menu." userInput;     # or if user wants to quit to main menu
                

                if [ "$userInput" == '5' ]		#if user chooses 5 quits to main menu
                    then
                    return
                fi

                if find $userInput; #here checks if the file exists, if it does asks if wants to be displayed: yes or no
                    then                                       # but it is in the loop
                
                    echo    "Do you really want to list '$userInput' file?" 
                    echo -n "(Y) Yes or (N) No ? "                               
                    read yn
                
                fi
            done


            if [ "$yn" == 'Y' ] || [ "$yn" == 'y' ] #if user chooses Y or y the files is displayed
                then
                cat -n $userInput                     # with counted numebres lines of the content
                echo "^Have a look see on '$userInput' file.^"
                wc -w $userInput                      #and with counted numbers of words of the content
                echo "^Word count^"
                read -p "Press enter to continue to Main Menu" # scripts prompts user to continue to main menu
                return
            
            else
                echo "The file '$userInput' was not displayed " # if user chooses anything else than Y or y file won't be displayed
                read -p "Press enter to continue to Main Menu" # and simply asks to press enter to return to main menu
                return
            fi

}

show_proces_3() {
  	#here code deals with Option 3 : Listing all ongoing processes  
      
            echo "you have chosen number 3"
            read -p "If you want to list all of the ongoing processes, press Enter." 
                # script asks to press enter to continue with displaying the processes
           
                
            
            ps -aux #shows the precesses
            echo here are all the processes
            read -p "Press enter to continue to Main Menu" #prompts user to press enter to continue to main menu
            return
}

List_dir_4() {
   	#here code deals with Option 4 : Listing all files and directories
        
            echo "you have chosen number 4"
            echo "If you want to list all the files, directories and subdirectories, enter starting directory."
            echo   -n "Choose 1 for home directory, or 2 for current directory or 5 to go back to main menu."  #prompts user to choose lisings of files, 
                                                                                                    #directories and sub-dir home directory and current location directory       
            read HomeOrCurrent



            if [ "$HomeOrCurrent" == '1' ] #if user chooses Y or y the files is displayed
                then
                echo "You have chosen to list Home directory"

                ls -lR $HOME

                read -p "Press enter to continue to Main Menu" # scripts prompts user to continue to main menu
                return
            elif [ "$HomeOrCurrent" == '5' ]		#if user chooses 5 quits to main menu
                then
                echo "You have successfully left ! "
                return

            else 
                echo "You have chosen to list current directory"

                ls -lR

                read -p "Press enter to continue to Main Menu" # and simply asks to press enter to return to main menu
                return
            fi
        
}
#function made for user to follow to the main menu
press_enter() {
  echo ""
  echo -n "	Press Enter to continue "
  read
  clear
}
#incase of wrong input in main menu
incorrect_selection() {
  echo "Incorrect selection! Try again."
}
#main menu with 5 different options, and selection error in case of wrong selection
until [ "$selection" = "5" ]; do
  clear
  echo ""
  echo "Welcome Dear" $USER "User"
  echo "    	1  -  Delete a specific file "
  echo "    	2  -  Display the contents of a file"
  echo "    	3  -  Show all the processes being carried out"
  echo "    	4  -  List all files and directories on screen"
  echo "    	5  -  Quit this script..."
  echo ""
  echo -n  "  Enter selection: "
  read selection
  echo ""
  case $selection in #this piece includes all the functions/options which are responsive to the main menu input 1 - 5
    1 ) clear ; delete_file_1 ; press_enter ;;
    2 ) clear ; display_file_2 ; press_enter ;;
    3 ) clear ; show_proces_3 ; press_enter ;;
    4 ) clear ; List_dir_4 ; press_enter ;;
    5 ) clear ; exit ;;
    * ) clear ; incorrect_selection ; press_enter ;;
  esac
done
