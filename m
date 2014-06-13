Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f44.google.com ([209.85.215.44]:44452 "EHLO
	mail-la0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751330AbaFMFOD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Jun 2014 01:14:03 -0400
Received: by mail-la0-f44.google.com with SMTP id hr17so1185813lab.17
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jun 2014 22:14:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGNsrLAGM1+RDWX0+bq5gHP13sm1vaoFXiAy_95=VF6NiijyWg@mail.gmail.com>
References: <1397562708-7531-1-git-send-email-fathi.boudra@linaro.org>
	<CAGNsrLB++mnabWRofV=L1f7dhMeuK13vtXvV29u8jN8FZKxTrA@mail.gmail.com>
	<CAGNsrLAGM1+RDWX0+bq5gHP13sm1vaoFXiAy_95=VF6NiijyWg@mail.gmail.com>
Date: Fri, 13 Jun 2014 08:14:01 +0300
Message-ID: <CAGNsrLBk15trjcXLdcdKY8Tu8RAqqH-T_LFoXsn_QO=dZ+rLLw@mail.gmail.com>
Subject: Re: [PATCH v2] builddeb: fix missing headers in linux-headers package
From: Fathi Boudra <fathi.boudra@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, Ben Hutchings <ben@decadent.org.uk>

Michal,

This patch is sitting here since 2 months without any reply and you
just sent the pull request for 3.16-rc1.
The linux-headers package is broken...

On 9 May 2014 09:42, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> gentle ping
>
> On 25 April 2014 09:12, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>> Ben, Michal, what about this patch?
>>
>> On 15 April 2014 14:51, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>>> The kernel headers package (linux-headers) doesn't include several
>>> header files required to build out-of-tree modules.
>>>
>>> It makes the package unusable on e.g. ARM architecture:
>>>  /usr/src/linux-headers-3.14.0/arch/arm/include/asm/memory.h:24:25:
>>>  fatal error: mach/memory.h: No such file or directory
>>>  #include <mach/memory.h>
>>>  ^
>>>  compilation terminated.
>>>
>>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>>> ---
>>>  Changes from v1:
>>>  - add missing module.lds, mips/Kbuild.platforms and Platform files
>>>  - generically look for all include directories in arch/$SRCARCH
>>>
>>>  scripts/package/builddeb | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>>> index f46e4dd..42b1e20 100644
>>> --- a/scripts/package/builddeb
>>> +++ b/scripts/package/builddeb
>>> @@ -287,9 +287,11 @@ EOF
>>>
>>>  fi
>>>
>>> -# Build header package
>>> +# Build kernel header package
>>>  (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
>>>  (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
>>> +(cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform >> "$objtree/debian/hdrsrcfiles")
>>> +(cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f >> "$objtree/debian/hdrsrcfiles")
>>>  (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
>>>  destdir=$kernel_headers_dir/usr/src/linux-headers-$version
>>>  mkdir -p "$destdir"
>>> --
>>> 1.9.1
