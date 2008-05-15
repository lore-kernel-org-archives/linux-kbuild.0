Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from web95106.mail.in2.yahoo.com ([203.104.18.158]:37850 "HELO
	web95106.mail.in2.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753473AbYEOOhv convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 May 2008 10:37:51 -0400
Date: Thu, 15 May 2008 20:07:47 +0530 (IST)
From: murtuja bharmal <murtuja_bharmal@yahoo.com>
Subject: Re: kbuild output file.
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Message-ID: <906362.445.qm@web95106.mail.in2.yahoo.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: murtuja bharmal <murtuja_bharmal@yahoo.com>, linux-kbuild@vger.kernel.org

Sorry Makefile is like this
dir
|
--------------------------------------
|            |        |        |
dir1    dir2       dir3   dir4
This my makefile in 'dir'.
obj-m := test.o
test-objs += \
                dir1/test1.o    \
                dir2/test2.o    \
                dir3/test3.o
all:
            make -C /usr/src/linux M=`pwd` modules

Now I want to save all output objectfile test1.o test2.o test3.o in one directory
called 'dir4' not in source directory. 'test.o' should look all this object file in 'dir4' for linking, not in the source directory and 'test.ko' should also be create in 'dir4'.
Can any one tell me, what is require changes in Kernel Makefile for the same.

----- Original Message ----
From: murtuja bharmal <murtuja_bharmal@yahoo.com>
To: linux-kbuild@vger.kernel.org
Sent: Thursday, 15 May, 2008 6:35:16 PM
Subject: kbuild output file.

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
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



      Has your work life balance shifted? Find out - http://in.search.yahoo.com/search?&fr=na_onnetwork_mail_taglines&ei=UTF-8&rd=r1&p=work+life+balance
