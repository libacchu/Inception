# NGINX



## openssl
OpenSSL is a cryptography toolkit implementing the Secure Sockets Layer (SSL v2/v3) and Transport Layer Security (TLS v1) network protocols and related cryptography standards required by them.

The openssl program is a command line tool for using the various cryptography functions of OpenSSL's crypto library from the shell.  It can be used for

	o  Creation and management of private keys, public keys and parameters
	o  Public key cryptographic operations
	o  Creation of X.509 certificates, CSRs and CRLs
	o  Calculation of Message Digests
	o  Encryption and Decryption with Ciphers
	o  SSL/TLS Client and Server Tests
	o  Handling of S/MIME signed or encrypted mail
	o  Time Stamp requests, generation and verification


## Utility to create a certificate
#### -command req 
Creates and processes certificate requests first

### -x509 
(type of certificate)
this option outputs a self-signed certificate instead of a certificate request.
This is typically used to generate a test certificate or a self-signed root CA

### -nodes
if this option is specified, then if a private key is generated, it will not be encrypted

### -days n
when the -x509 option is used, it specifies the number of days to certify the certificate

### -newkey <argument (lenght of key)>
this option creates a new certificate request and a new private key. The argument takes one of several forms.
rsa:nbits , where nbits is the number of bits, generates an RSA key of size nbits

### -keyout <filename of the key>
this gives the filename to write the newly generated private key to

### -out <filename of certificate>
This specifies the name of the output file to write to or the default stdout

### -subj argument
Replaces the subject field of the input request with the specified data and outputs the modified request