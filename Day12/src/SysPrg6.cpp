#include <iostream>
#include <csignal>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>

using namespace std;

void func1(int id)
{
	cout<<"Signal is received by the child"<<endl;
	cout<<"Child Died"<<endl;
	cout<<"ID: "<<id<<endl;
}

int main()
{
	int pid;
	signal(SIGKILL, func1);
	pid = fork();
	if(pid ==0)
	{
		cout<<"CHILD PID: "<<pid<<endl;
		//signal(SIGINT, func1);
		sleep(2);
	}
	else
	{
		cout<<"PID : "<<pid<<endl;

		kill(pid,SIGKILL);
		sleep(50);
		cout<<"\nParent exiting"<<endl;
	}
}