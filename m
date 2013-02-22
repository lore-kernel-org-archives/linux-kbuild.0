Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ee0-f48.google.com ([74.125.83.48]:49323 "EHLO
	mail-ee0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753894Ab3BVDli (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Feb 2013 22:41:38 -0500
Received: by mail-ee0-f48.google.com with SMTP id t10so90016eei.21
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Feb 2013 19:41:37 -0800 (PST)
MIME-Version: 1.0
From: Ajith Adapa <adapa.ajith@gmail.com>
Date: Fri, 22 Feb 2013 09:11:06 +0530
Message-ID: <CADAe=+LzQWQs87h+Nvn9xarW5iUuGd+4zC1-Mdh-2TjH++LU5Q@mail.gmail.com>
Subject: Regarding issue using manual steps in using KBUILD
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

Currently one of our client is using a customized Make script so that
they can build the kernel module in their buildsystem. Make script
follows following steps

1. Create .o for all .c files

2. Creates final module.o with all the above .o files

3. Using modpost creates Module.markers (Below is the command I see
getting executed when using 2.6.32 kernel)

/lib/modules/2.6.32.58/source/scripts/mod/modpost  -i
/lib/modules/2.6.32.58/source/Module.symvers -S -K
/lib/modules/2.6.32.58/source/Module.markers -M  ../l2/Module.markers
../l2/l2_module.o

I guess this step creates modulename.mod.c file once successful.

4. Now create modulename.mod.o file.

5. Finally link up everything creating .ko file.

Above steps works great with 2.6.32 kernel but When I am trying the
same on 3.6 kernel Step-3 doesn't return anything other than Error 1
at the end.

Seems Modpost is one tough nut to crack as it has doesn't have any
options or debug logs to display its output status. So I built modpost
with -g option.
In modpost main function read_symbols function is called with input as
"/lib/modules/3.6.10/source/Module.symvers" which in turn calls
read_elf function which is failing currently.

I know its the dirty way where we need to fix makefile for every
kernel version. I would like to know is there something which got
changed after 2.6.32 kernel which is causing the MODPOST to fail.

Any inputs would be of great help. Thanks in advance.

Regards,
Ajith
--------------------------------------------
codingfreak.blogspot.com
