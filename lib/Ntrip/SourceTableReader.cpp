#pragma ident "$Id 2016-11-14 $"
/**
 * @file SourceTableReader.cpp
 * Class to read and store the sourcetable from
 * an existing file
 */

//============================================================================
//
//  This file is part of GPSTk, the GPS Toolkit.
//
//  The GPSTk is free software; you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published
//  by the Free Software Foundation; either version 2.1 of the License, or
//  any later version.
//
//  The GPSTk is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public
//  License along with GPSTk; if not, write to the Free Software Foundation,
//  Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110, USA
//
//  Copyright (c)
//
//  Q.Liu,XY. CAO, Wuhan Uniersity, 2016.
//
//============================================================================

#include "SourceTableReader.hpp"
using namespace gpstk;
using namespace gpstk::StringUtils;

namespace gpstk
{


    // Default constructor
    SourceTableReader::SourceTableReader()
    {
        mountPointMap.clear();
        tableLength = 0;
    }

    // Destructor
    SourceTableReader::~SourceTableReader()
    {
        // do nothing
    }

    // Method to open AND load source table content file.
    void SourceTableReader::open(const char *fn)
         throw( FileMissingException )
    {
        // We need to be sure current data stream is closed
        (*this).close();

        try
        {
            // Open the stream
            FFTextStream::open(fn, std::ios::in);
            if(!FFTextStream::is_open())
            {
                FileMissingException fm("The file '" + std::string(fn) +
                                        "' does not exit, or you don't have the reading permission");
                GPSTK_THROW(fm);
            }

            loadData();
        }
        catch(FileMissingException &e)
        {
            GPSTK_THROW(e);
        }

    }

    // Method to open AND load source table file.
    void SourceTableReader::open(const std::string &fn)
    throw ( FileMissingException )
    {
        // We need to be sure current data stream is closed
        (*this).close();

        try
        {
            this->open(fn.c_str());
        }
        catch(FileMissingException &e)
        {
            GPSTK_THROW(e);
        }
    }
	
    // Load the source table contents
    void SourceTableReader::loadData()
    throw( FFStreamError, gpstk::StringUtils::StringException )
    {
        mountPointMap.clear();

        try
        {
            string line;

            string STRline = "STR";
			string  Lengthline = "Content-Length:";
			string endline = "ENDSOURCETABLE";

			formattedGetLine(line,true);
			
			// first line
			if(line != "SOURCETABLE 200 OK")
			{
				cout << "Undefined format for sourcetable.txt" << endl;

				throw;
			}

			// clear all 
			mountPointMap.clear();
			
            while(1)
            {
				formattedGetLine(line,true);

				if( line.find(Lengthline) != string::npos )
				{
					// content-length
					line = strip(line,Lengthline);

					tableLength = int( asFloat(line) );

					continue;
				}
				else if( line.find(STRline)!= string::npos )
				{
					// only interested in stream,skip NET and CAS

					// size == 19
					std::vector<std::string> content = split(line,";");

					// content[0] must be STR
					string mountpoint = content[1];

					// fill all informations
					mountPointMap[mountpoint].identifier     = content[2];
					mountPointMap[mountpoint].format         = content[3];
					mountPointMap[mountpoint].format_details = content[4];
					mountPointMap[mountpoint].carrierNo      = int(asFloat(content[5]));
					mountPointMap[mountpoint].navsystem      = content[6];
					mountPointMap[mountpoint].network        = content[7];
					mountPointMap[mountpoint].country        = content[8];
					mountPointMap[mountpoint].latitude       = asDouble(content[9]);
                    mountPointMap[mountpoint].longitude     = asDouble(content[10]);
					mountPointMap[mountpoint].nmeaFlag       = int(asFloat(content[11]));
					mountPointMap[mountpoint].solution       = int(asFloat(content[12]));
					mountPointMap[mountpoint].generator      = content[13];
					mountPointMap[mountpoint].compression    = content[14];
					mountPointMap[mountpoint].authentication = content[15];
					mountPointMap[mountpoint].fee            = content[16];
					mountPointMap[mountpoint].bitrate        = int(asDouble(content[17]));
					mountPointMap[mountpoint].misc           = content[18];

					continue;
				}
				else if( line == endline )
				{
					// end file
					(*this).close();
					
					return;
				}
				else
				{
					continue;
				}
               
            } // end while(1)

        } // End of 'try' block

        catch (EndOfFile& e)
        {
			// We should close this data stream before returning
           (*this).close();

           return;
        }
        catch (...)
        {

           // We should close this data stream before returning
           (*this).close();

           return;
        }
    }

	// dump the stream contained in sourcetable
	void SourceTableReader::dumpSourceTable()
	{
		map<MountPointID,mountpointSTR>::const_iterator mptr = 
			mountPointMap.begin();
		
		// loop
		for(;mptr != mountPointMap.end();mptr++)
		{
			string mountpoint = (*mptr).first;

			mountpointSTR stream = (*mptr).second;

			cout << mountpoint << "\t"
				 << stream.identifier << "\t"
				 << stream.format << "\t"
				 << stream.format_details << "\t"
				 << stream.carrierNo << "\t"
				 << stream.navsystem << "\t"
				 << stream.network << "\t"
				 << stream.country << "\t"
				 << stream.latitude << "\t"
                 << stream.longitude << "\t"
				 << stream.nmeaFlag << "\t"
				 << stream.solution << "\t"
				 << stream.generator << "\t"
				 << stream.compression << "\t"
				 << stream.authentication << "\t"
				 << stream.fee << "\t"
				 << stream.bitrate << "\t"
				 << stream.misc
				 << endl;
		}
	}

	// dump designated mountpoint
    void SourceTableReader::dumpStream(string &mountpoint)
	{
		if( haveStream(mountpoint) )
		{
			map<MountPointID,mountpointSTR>::const_iterator mptr = 
				mountPointMap.find(mountpoint);

			mountpointSTR stream = (*mptr).second;

			cout << mountpoint << "\t"
				 << stream.identifier << "\t"
				 << stream.format << "\t"
				 << stream.format_details << "\t"
				 << stream.carrierNo << "\t"
				 << stream.navsystem << "\t"
				 << stream.network << "\t"
				 << stream.country << "\t"
				 << stream.latitude << "\t"
                 << stream.longitude << "\t"
				 << stream.nmeaFlag << "\t"
				 << stream.solution << "\t"
				 << stream.generator << "\t"
				 << stream.compression << "\t"
				 << stream.authentication << "\t"
				 << stream.fee << "\t"
				 << stream.bitrate << "\t"
				 << stream.misc
				 << endl;

		}
		else
		{
			cout << "warning: no " << mountpoint << "in sourcetable! " << endl;
		}

	}


	// 
    bool SourceTableReader::haveStream(string &mountpoint)
	{
		return( mountPointMap.find(mountpoint) != mountPointMap.end() );
	}

	//
    SourceTableReader::mountpointSTR SourceTableReader::getStream(string &mountpoint)
	{
		map<MountPointID,mountpointSTR>::const_iterator mptr = 
				mountPointMap.find(mountpoint);
			
		return (*mptr).second;

	}


	// if can not find this format, return 0
    int SourceTableReader::RTCMTypeNumber(string &format)
	{
		int c = 0;

		map<MountPointID,mountpointSTR>::iterator mptr;

		for( mptr = mountPointMap.begin();mptr != mountPointMap.end(); mptr++ )
		{
			// upper case
			if( (*mptr).second.format == upperCase(format) )
			{
				c++;
			}

		}

		return c;
	}

    void SourceTableReader::updateFromNet(string &file, NetUrl &url)
    {
        // get source table buffer
        //////////////////////////

        // source table buffer
        static char buff[MAXSRCTBL];
        char* p = buff;
        unsigned char *table=(unsigned char*)malloc(MAXSRCTBL);
        int len = strlen(ENDSRCTBL);
        int nb = 0;

        NetQueryBase* query = new NetQueryNtrip1();

        while(p<buff+MAXSRCTBL-1)
        {
            try
            {
                query->startRequest(url,"");

                if (query->getStatus() == NetQueryBase::error)
                {
                    break;
                }
                if (query->getStatus() != NetQueryBase::dataReceiveable)
                {
                  continue;
                }

                int buffLen = query->waitForReadyRead((unsigned char*)p);

                if(buffLen > 0)
                {
                    nb += buffLen;
                    p += buffLen;
                }
                if (p-len-3>buff&&strstr((const char*)(p-len-3),ENDSRCTBL))
                {
                    break;
                }

            }
            catch(MountPointNotFound& e)
            {
                cout << e.what();
                continue;
            }
            catch(SocketRecvError& e)
            {
                cout << e.what();
                continue;
            }
        }
        for(int i=0;i<nb;++i)
        {
            table[i] = buff[i];
        }
        query->stop();
        delete query;

        // write the buffer to file
        ///////////////////////////
        ofstream out(file,ios::out);
        out.write((const char*)table,nb);
        out.flush();
        out.close();

    }

    void SourceTableReader::updateFromNet(string &file, string &host, string &port)
    {
        NetUrl url;
        url.setCasterHost(host);
        url.setCasterPort(port);
        updateFromNet(file, url);
    }

}  // End of namespace gpstk