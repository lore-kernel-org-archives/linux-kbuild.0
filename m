Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46487 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753743Ab3ALO7t (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Jan 2013 09:59:49 -0500
Message-ID: <50F17A52.5050806@suse.cz>
Date: Sat, 12 Jan 2013 15:59:30 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] fix: spaces in srctree and objtree paths no longer break
 builds.
References: <CAK2BWArN+HmtQMYJ8R_sBMQsahrR8TYeTTsyLUU9AvvFJFD=dQ@mail.gmail.com> <20121223184431.GA1685@merkur.ravnborg.org>
In-Reply-To: <20121223184431.GA1685@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sunil Beta Baskar <betasam@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

On 23.12.2012 19:44, Sam Ravnborg wrote:
> On Sun, Dec 23, 2012 at 08:59:20PM +0530, Sunil Beta Baskar wrote:
>> Signed-off-by: Sunil Beta <betasam@gmail.com>
>> ---
>>  Makefile |    7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 07bc925..c2ae267 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -149,8 +149,13 @@ else
>>  _all: modules
>>  endif
>>
>> -srctree        := $(if $(KBUILD_SRC),$(KBUILD_SRC),$(CURDIR))
>> +srctree            := $(if $(KBUILD_SRC),$(KBUILD_SRC),$(CURDIR))
>>  objtree        := $(CURDIR)
>> +
>> +# FIX! spaces in path can break build
>> +srctree         := $(shell echo $(srctree) | sed "s/ /\\\ /g" )
>> +objtree         := $(shell echo $(objtree) | sed "s/ /\\\ /g" )
>> +
>>  src        := $(srctree)
>>  obj        := $(objtree)
> 
> I applied your patch manually (the patch is broken).
> My build failed like this:
>   SYSHDR  arch/x86/syscalls/../include/generated/uapi/asm/unistd_32.h
> /bin/sh: /home/sam/kernel/my\ space.git/arch/x86/syscalls/syscallhdr.sh: No such file or directory
> make[1]: *** [arch/x86/syscalls/../include/generated/uapi/asm/unistd_32.h] Error 127
> 
> This it in other words not enough.

There will always be too many or too few backslashes. So just check for
bad characters early and fail if there are any.

Michal
