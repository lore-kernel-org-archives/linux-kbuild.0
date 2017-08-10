Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:35301 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752281AbdHJWLS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Aug 2017 18:11:18 -0400
MIME-Version: 1.0
In-Reply-To: <1cb96165-34a1-7f8e-4211-e87af3cfb60a@infradead.org>
References: <20170810154251.GA23083@localhost.localdomain> <1cb96165-34a1-7f8e-4211-e87af3cfb60a@infradead.org>
From: Jim Davis <jim.epost@gmail.com>
Date: Thu, 10 Aug 2017 15:11:17 -0700
Message-ID: <CA+r1ZhjGfQNO1Z2KR869eP+azB6L+F32ybh-ZuPFSBqFaKLuEg@mail.gmail.com>
Subject: Re: make clean all broken with -j? + question regarding modpost
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Meyer <thomas@m3y3r.de>, linux-kernel <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thu, Aug 10, 2017 at 11:28 AM, Randy Dunlap <rdunlap@infradead.org> wrote:
> [adding linux-kbuild]
>
> On 08/10/2017 08:42 AM, Thomas Meyer wrote:
>> Hi,
>>
>> 1.) make with multiple targets
>>
>> When running
>> $ make -j4 clean all
>> I get error from make (probably in scripts/Makefile.modbuiltin):

With 4.13-rc4 I can get a similar build failure on my Fedora 26 workstation with

make allnoconfig; make -j2 clean all

/bin/sh: scripts/mod/empty.o: No such file or directory
make[2]: *** [scripts/mod/Makefile:24: scripts/mod/elfconfig.h] Error 1
make[1]: *** [scripts/Makefile.build:561: scripts/mod] Error 2

Here's an ugly workaround for that test case.

diff --git a/Makefile b/Makefile
index 6eba23bcb5ad..6a1fd24dcf31 100644
--- a/Makefile
+++ b/Makefile
@@ -1297,6 +1297,7 @@ MRPROPER_FILES += .config .config.old .version
.old_version \

 # clean - Delete most, but leave enough to build external modules
 #
+.NOTPARALLEL: clean
 clean: rm-dirs  := $(CLEAN_DIRS)
 clean: rm-files := $(CLEAN_FILES)
 clean-dirs      := $(addprefix _clean_, . $(vmlinux-alldirs)
Documentation samples)


-- 
Jim
