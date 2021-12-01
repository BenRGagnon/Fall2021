#!/bin/bash



phonebook='./phonebook.txt'

menu()
{
echo ""
echo "--------------"
echo "  Phone Book  " 
echo "--------------"
echo "1. Display"
echo "2. Find"
echo "3. Add" 
echo "4. Modify"
echo "5. Delete"
echo "6. Exit"
echo ""
}

# access phonebook and set permissions
touch "$phonebook"
chmod 600 "$phonebook"

clear

# Continue prompting until input is 6
while [ "$option" != "6" ] 
do 
	fname=""
	lname=""
	phone=""
	address=""

	oldfname=""
	oldlname=""
	oldphone=""
	oldaddress=""

	newfname=""
	newlname=""
	newphone=""
	newaddress=""

	case "$option" in
	# Display the contents of the phone book
	1)
		# if the file at directory $phonebook exists
		if [ -s "$phonebook" ]
		then
			echo ""
			echo "Sorted by Last Name"
			echo ""
			# sort the phonebook in alphabetical order and print in a column format
			sort -t":" -k2 "$phonebook" | column -s: -t | more
		# error message for if the directory doesnt exist
		else
			echo ""
			echo "No phone directory '$phonebook' found"
		fi
		# reprompt
		menu
		echo -n "Enter option [1-6] "
		read option
		continue
		;;
	2) 
		# find contact in the phonebook

		# throw an error if the user doesn't have file read permissions
		if [ ! -r "$phonebook" ] 
		then 
			echo""
			echo"You do not have permission to read $phonebook"
			echo""
			
			exit 1
		fi
		
		echo""
		
		# checl for exit command		
		while [ -z "$fname" ]
		do
			echo -n "First Name: "
			read fname
			if [ "$fname" = "exit" ]
			then 
				exit 0
			fi
		done

		while [ -z "$lname" ]
		do 
			echo -n "Last name: " 
			read lname
			if [ "$lname" = "exit" ]
			then
				exit 0
			fi
		done

		# trim off whitespace
		fname=$(echo "$fname" | tr -s ' ')
		lname=$(echo "$lname" | tr -s ' ')

		echo ""
		# search phonebook for contact first name: last name
		entry=$(grep -iw "$fname:$lname" "$phonebook")

		# check if entry is zero
		if [ -z "$entry" ]
		then
			echo "No match found"
			
			menu 
			echo -n "Enter option [1-6]: "
			read option
			continue
		else # print if not empty
			echo "$entry"
		fi
		# remprompt for next command
		menu 
		echo -n "Enter option [1-6]: "
		read option
		continue 
		;;
	3) 	# add a new contact
		# throw error if user doesn't have write priviledges
		if [ ! -w "$phonebook" ]
		then
			menu
			echo "Error: You do not have permission to write into $phonebook"
			echo ""
			exit 1
		fi
		echo ""
		# prompt input until it is not empty
		while [ -z "$fname" ]
		do
			# prompt and read input
			echo -n "First name: "
			read fname

			# check if user entered exit command
			if [ "$fname" = "exit" ]
			then 
				exit 0
			fi
		done
		# prompt input until not empty
		while [ -z "$lname" ]
		do
			# prompt and read input
			echo -n "Last name: "
			read lname
			
			# check if user entered exit command
			if [ "$lname" = "exit" ] 
			then
				exit 0
			fi
		done
		# prompt input until not empty
		while [ -z "$phone" ]
		do
			# prompt and read input
			echo -n "Phone Number: "
			read phone
			# check if user entered exit command
			if [ "$phone" = "exit" ]
			then
				exit 0
			fi
		done
		#prompt input until not empty
		while [ -z "$address" ]
		do 
			# prompt and read input
			echo -n "Address: "
			read address
			#check if user entered exit command
			if [ "$address" = "exit" ] 
			then	
				exit 0
			fi
		done
	# format data entty and concactenate to phonebook
	echo "$fname:$lname:$phone:$address" >> "$phonebook"
	echo "New contact added"
	#prompt for new command
	menu 
	echo -n "Enter option [1-6]"
	read option
	continue
	;;
	4)
		if [ ! -w "$phonebook" ]
		then
			echo ""
			echo "Error: You don\'t have permission to write into $phonebook"
			echo ""
			exit 1
		fi
		echo ""
		while [ -z "$oldfname" ]
		do
			echo -n "Enter old First Name"
			read oldfname

			if [ "$oldfname" = "exit" ]
			then
				exit 0
			fi
		done

		while [ -z "$oldlname" ] 
		do
			echo -n "Old Last Name: "
			read oldlname
			if [ "oldlname" = "exit" ]
			then
				exit 0 
			fi
		done

		echo ""
		
		while [ -z "$newfname" ]
		do
			echo -n "New First Name: "
			read newfname
			if [ "$newfname" = "exit" ]
			then
				exit 0
			fi
		done

		while [ -z "$newlname" ]
		do
			echo -n "New Last Name: "
			read newlname
			if [ "$newfname" = "exit" ]
			then
				exit 0
			fi
		done

		while [-z "$newphone" ]
		do
			echo -n "New Phone Number: "
			read newphone
			if [ "$newphone" = "exit" ]
			then
				exit 0
			fi
		done

		 
  		while [-z "$newaddress" ]
                do
                        echo -n "New Address: "
                        read newaddress
                        if [ "$newaddress" = "exit" ]
                        then
                                exit 0
                        fi
                done

		oldfname=$(echo "$oldfname" | tr -z ' ')
		oldlname=$(echo "$oldlname" | tr -s ' ')

		echo ""
		oldentry=$(grep -iw "$oldfname:$oldlname" "$phonebook")
		newentry="$newfname:$newlname:$newphone:$newaddress"

		if [ -z "$oldentry" ]
		then
			echo "No match found"
			
			menu
			echo -n "Enter option [1-6]: "
			read option
			continue
		else
			sed -i "s/$oldentry/$newentry/" "$phonebook"
			echo "Modified contact"
		fi
		menu
		echo -n "Enter option [1-6]: "
		read option
		continue
		;;
	5)	echo ""
		while [ -z "$fname" ]
		do
			echo -n "First name: "
			read fname		
			if [ "$fname" = "exit" ]
			then	
				exit 0
			fi
		done

		while [ -z "$lname" ]
		do
			echo -n "Last Name: "
			read lname
			if [ "$lname" = "exit" ]
			then
				exit 0
			fi
		done
		
		fname=$(echo "$fname" | tr -s ' ')
		lname=$(echo "$lname" | tr -s ' ')

		tmpfile=$(mktemp)
		grep -iwv "$fname:$lname" "$phonebook" > "tempfile"

		orgirowcount=$(wc -l < "$phonebook")
		tmprowcount=$(wc -l < "$tmpfile")

		if [ "$orgirowcount" -eq "$tmprowcount" ]
		then
			echo ""
			echo "No match found"
		
			menu 
			echo -n "Enter option [1-6]: "
			read option
			continue
		else
			mv "$tmpfile" "$phonebook"
			echo -n "Deleted contact"
	
			menu 
                        echo -n "Enter option [1-6]: "
                        read option
			continue
		fi
		;;
		6)echo ""
		exit 0
		;;
		*)menu 
                  echo -n "Enter option [1-6]: "
                  read option
	esac
done
echo ""

exit
