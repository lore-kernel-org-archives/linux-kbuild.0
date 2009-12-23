Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vw0-f192.google.com ([209.85.212.192]:54140 "EHLO
	mail-vw0-f192.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752437AbZLWCDT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Dec 2009 21:03:19 -0500
Received: by vws30 with SMTP id 30so2307676vws.33
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Dec 2009 18:03:18 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 23 Dec 2009 10:03:18 +0800
Message-ID: <f895eeee0912221803l7e25f79ck75d1c359a697c9d8@mail.gmail.com>
Subject: how to compile the linux kernel in an other directory
From: Everest <ykai007@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

I want to compily the Linux kernel 2.6 kernel in an alternate place
and do not use the Makefile in top directory of kernel. (not different
output directory use make O=DIR)

For example: I have my kernel source in /home/everest/kernel, and
I want to compile it in /home/everest/build with the Makefile in it.
Also I need to change some of kernel source to my own directory,
I want to develop my own fs in /home/everest/fs and I don't want to
modify the code in kernel/fs.

So I want to modify a makefile from Linux kernel 2.6 Makefile, but it
seens not so easy to me, becaust many rules in Makefile(in top level
directory or oher directory like /arch/arm/Makefile) use the PATH only
available in CURRENT DIRECTORY. I want to modify only one Makefile and
don't affect others.

I notice that there is a tag in kernel Makefile: KBUILD_SRC, is that
useful for me? But I didn't get how to use this tag and the Makefile
only says:

   # KBUILD_SRC is set on invocation of make in OBJ directory
   # KBUILD_SRC is not intended to be used by the regular user (for now)

Who can tell me how to use it? Thanks very much!
Or is there any other to solve my problem?

Thanks again!


-- 
Best wishes

Everest
