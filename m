Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:18231 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751423AbdEJKTV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 May 2017 06:19:21 -0400
Date: Wed, 10 May 2017 13:18:38 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: sparse on scripts/kconfig/*.c
Message-ID: <20170510101838.c5nwzaraeybyypwj@mwanda>
References: <fa98e27a-c08d-170f-68d1-2ab2918ef5d1@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa98e27a-c08d-170f-68d1-2ab2918ef5d1@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, May 09, 2017 at 09:47:41AM -0700, Randy Dunlap wrote:
> Hi,
> 
> I've been attempting to run sparse on the kconfig/ C files -- without success.
> 
> The kbuild files don't try to support CHECK in scripts/kconfig/ AFAICT,
> and just running sparse on the C files has issues with not being able to
> find header files.
> 
> Has anyone done this?  Any clues about how to do it?
> 

Smatch has pretty much only been used on kernel code, and it really
shows.  For userspace code, you'd want to make a list of the no return
functions and some other customizations.  Also the kernel uses a quite
limitted sample of C.

Anyway, what Christophe said is right.  Change the Makefile:
-HOSTCC       = gcc
+HOSTCC       = ~/progs/smatch/devel/cgcc

make CHECK="~/progs/smatch/devel/smatch --file-output" scripts/kconfig/
find -name \*.c.smatch -exec cat \{\} \; > smatch_warns.txt

I just did that now, and there is nothing interesting there.  If there
were something there, then there is a good chance I would have seen it
already because I've been running smatch_scripts/kchecker on every .c
file.  Say you don't have your .config set up for sparc then it doesn't
really work great, but what it does it uses the x86 headers but if there
are any header files missing it just includes a promising header with
the same name or it continues without the .h file.  The output is mostly
garbage but I had five sparc patches merged in 2016 so I'm a top ten
sparc dev for the year.  :P

regards,
dan carpenter


