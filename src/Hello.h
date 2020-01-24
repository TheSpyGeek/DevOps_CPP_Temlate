#ifndef HELLO_H
#define HELLO_H

#include <string>

class Hello {
public:
	Hello();
	~Hello();

	void print();

	std::string getMessage(){return "Bonjour";}


private:


};

#endif