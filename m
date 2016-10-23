Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:55161 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756423AbcJWQUr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Oct 2016 12:20:47 -0400
From: Sven Joachim <svenjoac@gmx.de>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
References: <20161021111600.9417-1-bigeasy@linutronix.de>
        <20161021212127.GA32611@angband.pl>
Date: Sun, 23 Oct 2016 18:19:57 +0200
In-Reply-To: <20161021212127.GA32611@angband.pl> (Adam Borowski's message of
        "Fri, 21 Oct 2016 23:21:27 +0200")
Message-ID: <87eg37niky.fsf@turtle.gmx.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adam Borowski <kilobyte@angband.pl>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk

On 2016-10-21 23:21 +0200, Adam Borowski wrote:

> On Fri, Oct 21, 2016 at 01:16:00PM +0200, Sebastian Andrzej Siewior wrote:
>> Debian started to build the gcc with --enable-default-pie by default
>
> To be exact: this is since gcc-6 6.2.0-7 dated Tue, 18 Oct 2016 13:53:00 +0200
> on amd64 arm64 armel armhf i386 mips mipsel mips64el ppc64el s390x.
>
>> so the kernel build ends before it starts properly with:
>> |kernel/bounds.c:1:0: error: code model kernel does not support PIC mode
>> 
>> Is this okay or do we want some kind of check to see if -fno-PIE is supported?
>> It is mentioned in the 4.4.7 gcc manpage is it is not *that* new :)
>
> A naive "git log -Sno-PIE" on gcc sources shows commit 3e7f6cce[1] from Feb
> 2004, and as gcc automatically supports no-XXX whenever XXX is added, it
> appears the option is older than that.

Testing on Debian 3.1 (sarge) chroot, it seems that GCC 3.4 is the first
release to accept -fPIE/-fno-PIE.  Which could be a problem since
according to Documentation/Changes GCC 3.2 is sufficient to build the
kernel.

>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> ---
>>  Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/Makefile b/Makefile
>> index bf6e44a421df..97296d66b586 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -398,7 +398,7 @@ KBUILD_CPPFLAGS := -D__KERNEL__
>>  KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>>  		   -fno-strict-aliasing -fno-common \
>>  		   -Werror-implicit-function-declaration \
>> -		   -Wno-format-security \
>> +		   -Wno-format-security -fno-PIE \
>>  		   -std=gnu89
>>  
>>  KBUILD_AFLAGS_KERNEL :=
>> -- 
>> 2.9.3
>
> The patch works for me.  I haven't done any but most trivial testing,
> though.
>
>
> [1]. Using the https://gcc.gnu.org/git/gcc.git git gateway, commit hashes
> may be different elsewhere.

Cheers,
       Sven
