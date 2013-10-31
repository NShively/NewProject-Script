generateWebTemplate()
{
echo "Web Template"
echo // Nick Shively
echo // $title>> $FileName.md
echo // $(whoami) >> $FileName.md
echo // $(date) >> $FileName.md
echo // "Description" >> $FileName.md
}

generateCPPTemplate()
{

echo "Cpp Template"
echo // Nick Shively
echo //$title >> $FileName.cpp
echo // $(whoami) >> $FileName.cpp
echo // $(date) >> $FileName.cpp
echo // "Description" >> $FileName.cpp
echo
echo "#include <iostream>
using namespace std;

int main()
{
	cout << \"Hello World\";
	return 0;
}" >> $FileName.cpp
}

generateReadme()
{
	echo $title >> README.md
	echo $(whoami) >> README.md
	echo $(date) >> README.md
	echo "===========" >> README.md
}

generateMakefile()
{
echo "$title.x: $FileName.o
	g++ -g $FileName.o -o $title.x

$FileName.o:
	g++ -g -c $FileName.cpp

run:
	./$title.x

debug:
	 g++ -g $FileName.cpp

clean:
	rm $title.x" > makefile
}


Git()
{
	git init
	for File in ~/scripts/*
	do
		git add *.cpp
	git commit 
done
}	



echo "What type of project do you want to generate?"
echo "1) Web"
echo "2) CPP"
echo "Enter a number: "
read type
echo "You chose: $type"
echo "What is the project or lab name?"
read title
echo "What do you want the file to be named?"
read FileName
mkdir $title
cd $title
if [ $type == 2 ]; then
	generateCPPTemplate
	generateMakefile
elif [ $type == 1 ]; then
	generateWebTemplate
else
	echo "Invalid selection"
	exit 1
fi

git init
git add -A
git commit -m "Initial Commit"
