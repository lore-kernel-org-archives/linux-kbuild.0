Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from web95113.mail.in2.yahoo.com ([203.104.18.165]:41159 "HELO
	web95113.mail.in2.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751042AbYEONL7 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 May 2008 09:11:59 -0400
Date: Thu, 15 May 2008 18:35:16 +0530 (IST)
From: murtuja bharmal <murtuja_bharmal@yahoo.com>
Subject: kbuild output file.
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Message-ID: <790973.47098.qm@web95113.mail.in2.yahoo.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello All.
I want to collect all my object file in onedirectory and then want to create a kernel module.
For example: This my directory structure.
dir
|
--------------------------------------
|            |        |        |
dir1    dir2       dir3   dir4
This my makefile in 'dir'.
obj-m := test.o
test-objs += \
                dir1/test1.o
                dir2/test2.o
                dir3/test3.o
all:
            make -C /usr/src/linux M=`pwd` modules
Now I want to save all output objectfile test1.o test2.o test3.o in one directory
called 'dir4' not in source directory. 'test.o' should look all this object file in 'dir4' for linking, not in the source directory and 'test.ko' should also be create in 'dir4'.
Can any one tell me, what is require changes in Kernel Makefile for the same.
Thansk
Murtuja Bharmal


      From Chandigarh to Chennai - find friends all over India. Go to http://in.promos.yahoo.com/groups/citygroups/
