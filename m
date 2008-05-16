Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from web95110.mail.in2.yahoo.com ([203.104.18.162]:27448 "HELO
	web95110.mail.in2.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1750759AbYEPGD6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 May 2008 02:03:58 -0400
Date: Fri, 16 May 2008 07:03:55 +0100 (BST)
From: murtuja bharmal <murtuja_bharmal@yahoo.com>
Subject: Re: Kbuild Makefile output
In-Reply-To: <20080515205840.GA814@mail.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Message-ID: <225576.17638.qm@web95110.mail.in2.yahoo.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joel Becker <Joel.Becker@oracle.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>


--- Joel Becker <Joel.Becker@oracle.com> wrote:

> 1) Have the build name the output files
> appropritately.  That is,
> compile foo.c to foo-kernel.o and foo-userspace.o. 
> Then link as needed.
> The makefile dependencies Just Work.
> 

Thanks Joel,
In case of Solution 1.
what changes required in Makefile.
I mean how to build foo-kernel.c from foo.c using
kbuild makefile.

Suppose this is my makefile

obj-m := mymodule.o

mymodule-objs += \
         dir1/foo.o   \
         dir2/bar.o   

all:
         make -C /usr/src/linux M=`pwd` modules.

I only want to change name for foo.c to foo-kernel.o,
not for bar.c.

Thanks
Murtuja
 


      Best Jokes, Best Friends, Best Food and more. Go to http://in.promos.yahoo.com/groups/bestofyahoo/
