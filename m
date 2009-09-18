Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qw-out-2122.google.com ([74.125.92.25]:60978 "EHLO
	qw-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750979AbZIRBtv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Sep 2009 21:49:51 -0400
MIME-Version: 1.0
In-Reply-To: <200909171345.30988.arnd@arndb.de>
References: <830a8fa70909161930r518a9644ja954ced2ae5814b4@mail.gmail.com>
	 <200909171345.30988.arnd@arndb.de>
Date: Fri, 18 Sep 2009 09:49:53 +0800
Message-ID: <2375c9f90909171849n429bc474heabdc4d4fd064226@mail.gmail.com>
Subject: Re: [patch] Makefile: can't build modules outside the kernel tree if
	it was built using O=
From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Content-Transfer-Encoding: 8bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Caveh Jalali <ecaveh@gmail.com>, sam@ravnborg.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 17, 2009 at 7:45 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thursday 17 September 2009, Caveh Jalali wrote:
>
>> when the platform specific include directories were shuffled around
>> without updating the
>> top level Makefile.  however, i think this FAIL is generic, and not
>> limited to powerpc.
>> here's a patch to the top level Makefile to teach it about the shuffled files:
>>
>>
>> --- /local/caveh/linux/linux-2.6.31/Makefile    2009-09-09
>> 15:13:59.000000000 -0700
>> +++ Makefile    2009-09-16 12:23:05.000000000 -0700
>> @@ -958,9 +958,9 @@ ifneq ($(KBUILD_SRC),)
>>                 echo "  in the '$(srctree)' directory.";\
>>                 /bin/false; \
>>         fi;
>> -       $(Q)if [ ! -d include2 ]; then                                  \
>> -           mkdir -p include2;                                          \
>> -           ln -fsn $(srctree)/include/asm-$(SRCARCH) include2/asm;     \
>> +       $(Q)if [ ! -d include2 ]; then                                   \
>> +           mkdir -p include2;                                           \
>> +           ln -fsn $(srctree)/arch/$(SRCARCH)/include/asm include2/asm; \
>>         fi
>>  endif
>
> I think we should no longer have the include2 directory at all with new kernels.
>
> LINUXINCLUDE already contains the right path in theory:
>
> LINUXINCLUDE    := -Iinclude \
>                   $(if $(KBUILD_SRC),-Iinclude2 -I$(srctree)/include) \
>                   -I$(srctree)/arch/$(hdr-arch)/include               \
>                   -include include/linux/autoconf.h

Hmm, at least in mmotm, we still have include2...

Maybe Sam is queueing the patches to remove include2?
���{.n�+�������+%�����ݶ��w��{.n�+����{��F�W��{ay�ʇڙ�,j��f���h��������z_�(�階�ݢj"���m������G������?����&���~��
