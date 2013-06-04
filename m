Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:62722 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751415Ab3FDIqj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Jun 2013 04:46:39 -0400
Received: by mail-pb0-f43.google.com with SMTP id ma3so6959866pbc.30
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Jun 2013 01:46:39 -0700 (PDT)
Received: from localhost.localdomain ([110.184.117.111])
        by mx.google.com with ESMTPSA id nz3sm6079174pbb.33.2013.06.04.01.46.36
        for <linux-kbuild@vger.kernel.org>
        (version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
        Tue, 04 Jun 2013 01:46:38 -0700 (PDT)
From: =?UTF-8?q?=E5=BC=A0=E5=BF=A0=E5=B1=B1?= <zzs0213@gmail.com>
Subject: [PATCH] let kbuild mkdir for dir/file.o
Date: Tue,  4 Jun 2013 16:45:31 +0800
Message-Id: <1370335532-17891-1-git-send-email-zzs0213@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Last week I send this patch, but no reply.
Now I try to explain it clearly:

When I try to add a file(which in a subdir) to my board's obj-y, the build progress crashed.

for example, I use at91rm9200ek board, and in kernel dir run:

	mkdir objtree
	make O=objtree at91rm9200-defconfig
	mkdir arch/arm/mach-at91/dir
	touch arch/arm/mach-at91/dir/file.c

and edit arch/arm/mach-at91/dir/file.c to add some code.
then edit arch/arm/mach-at91/Makefile, change the flowwing line:

	obj-$(CONFIG_MACH_AT91RM9200EK)	+= board-rm9200ek.o

to:

	obj-$(CONFIG_MACH_AT91RM9200EK)	+= board-rm9200ek.o dir/file.o

Now build it:

	make O=objtree

Then the error appears:
	...
	CC      arch/arm/mach-at91/board-rm9200dk.o
	CC      arch/arm/mach-at91/board-rm9200ek.o
	CC      arch/arm/mach-at91/dir/file.o
	linux-2.6/arch/arm/mach-at91/dir/file.c:5: fatal error: opening dependency file arch/arm/mach-at91/dir/.file.o.d: No such file or directory

Check the objtree:
	LANG=en ls objtree/arch/arm/mach-at91/dir
	ls: cannot access objtree/arch/arm/mach-at91/dir: No such file or directory

It's appearantly that the target dir not created for file.o

I check kbuild source code. It seems that kbuild create dirs for that in $(obj-dirs).
But if the dir need not to create a built-in.o, It should never in  $(obj-dirs).

So I make this patch to make sure It in  $(obj-dirs)

Anybody Anyidea?

张忠山 (1):
  let kbuild mkdir for dir/file.o

 scripts/Makefile.lib |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.7.9.5

