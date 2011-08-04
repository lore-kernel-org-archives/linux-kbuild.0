Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f170.google.com ([209.85.210.170]:33577 "EHLO
	mail-iy0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753021Ab1HDNqI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 4 Aug 2011 09:46:08 -0400
Received: by iye16 with SMTP id 16so1734661iye.1
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Aug 2011 06:46:08 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 4 Aug 2011 16:46:08 +0300
Message-ID: <CAHpdbYGXQ-gpeyyo06AvTqhAmrOV3TbxjbJX3FR9JHPAWGsCbQ@mail.gmail.com>
Subject: recordmcount.pl fails the build for ppc machines
From: Ciprian Barbu <ciprian.barbu@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello,

I encountered a problem on a ppc machine when trying to build the
kernel modules for the LINX ipc framework. The output of make is:

% make
# ARCH=ppc
# KERNEL=/lib/modules/2.6.32-28-powerpc/build
# VERBOSE=no
make[1]: Entering directory `/usr/src/linux-headers-2.6.32-28-powerpc'
  CC [M] /home/poly/tpjb/linx-2.5.0/net/linx/af_linx.o
Arch ppc is not supported with CONFIG_FTRACE_MCOUNT_RECORD at
/usr/src/linux-hea
ders-2.6.32-28-powerpc/scripts/recordmcount.pl line 249.
make[2]: *** [/home/poly/tpjb/linx-2.5.0/net/linx/af_linx.o] Error 255
make[1]: *** [_module_/home/poly/tpjb/linx-2.5.0/net/linx] Error 2
make[1]: Leaving directory `/usr/src/linux-headers-2.6.32-28-powerpc'
make: *** [modules] Error 2

As you can see the ARCH variable is set to ppc, but the
recordmcount.pl script only treats the case when "uname -m" return
powerpc.

When the script was modified to accept the "ppc" variant as well the
build was successful.

Regards,

Ciprian Barbu
