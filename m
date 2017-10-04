Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:54045 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750945AbdJDEHH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Oct 2017 00:07:07 -0400
Received: by mail-qt0-f181.google.com with SMTP id 47so16900914qts.10
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Oct 2017 21:07:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNARAVPOQh5SpLGRN5z-me-FhQerP5HVfxstaEaJuinsA7A@mail.gmail.com>
References: <20171003204839.27551-1-dianders@chromium.org> <20171003204839.27551-2-dianders@chromium.org>
 <CAK7LNARAVPOQh5SpLGRN5z-me-FhQerP5HVfxstaEaJuinsA7A@mail.gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 3 Oct 2017 21:07:05 -0700
Message-ID: <CABXOdTdJADZ5=sFYsoUdDa519e3SXhTGP-_ZsMhzaT8J_VOD+A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] kbuild: Pass HOSTCC and similar to tools Makefiles
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Douglas Anderson <dianders@chromium.org>, Michal Marek <mmarek@suse.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Guenter Roeck <groeck@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>

On Tue, Oct 3, 2017 at 8:20 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2017-10-04 5:48 GMT+09:00 Douglas Anderson <dianders@chromium.org>:
>> The main Linux Makefiles and the tools sub-Makefiles have different
>> conventions for passing in CC / CFLAGS.
>>
>> Here's brief summary for the kernel:
>> * CC: target C compiler (must be passed as an argument to make to
>>   override)
>> * HOSTCC: host C compiler (must be passed as an argument to make to
>>   override)
>> * CFLAGS: ignored (kernel manages its own CFLAGS)
>> * KCFLAGS: extra cflags for the target (expected as an env var)
>> * HOSTCFLAGS: host C compiler flags (not modifiable by the caller of
>>   make)
>>
>> Here's a brief summary for the tools:
>> * CC: host C compiler (must be passed as an argument to make to
>>   override)
>> * CFLAGS: base arguments for the host C compiler which are added to by
>>   sub builds (expected as an env var)
>>
>> When the main kernel Makefile calls into the tools Makefile, it should
>> adapt things from its syntax to the tools Makefile syntax.
>>
>> If we don't do this, we have a few issues:
>> * If someone wants to user another compiler (like clang, maybe) for
>>   hostcc then the tools will still be compiled with gcc.
>> * If you happen to be building and you left ${CFLAGS} set to something
>>   random (maybe it matches ${CC}, the _target_ C compiler, not the
>>   _host_ C compiler) then this random value will be used to compile
>>   the tools.
>>
>> In any case, it seems like it makes sense to pass CC, CFLAGS, and
>> similar properly into the tools Makefile.
>>
>> NOTE: in order to do this properly, we need to add some new
>> definitions of HOSTAS and HOSTLD into the main kernel Makefile.  If we
>> don't do this and someone overrides "AS" or "LD" on the command line
>> then those (which were intended for the target) will be used to build
>> host side tools.  We also make up some imaginary "HOSTASFLAGS" and
>> "HOSTLDFLAGS".  Someone could specify these, but if they don't at
>> least these blank variables will properly clobber ASFLAGS and LDFLAGS
>> from the kernel.
>>
>> This was discovered in the Chrome OS build system where CFLAGS (an
>> environment variable) was accidentally left pointing to flags that
>> would be an appropriate match to CC.  The kernel didn't use these
>> CFLAGS so it was never an issue.  Turning on STACKVALIDATION, however,
>> suddenly invoked a tools build that blew up.
>>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>
>>  Makefile | 30 ++++++++++++++++++++++++++++--
>>  1 file changed, 28 insertions(+), 2 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index cf007a31d575..0d3af0677d88 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -298,7 +298,9 @@ HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS)
>>  HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS)
>>  HOST_LFS_LIBS := $(shell getconf LFS_LIBS)
>>
>> +HOSTAS       = as
>>  HOSTCC       = gcc
>> +HOSTLD       = ld
>>  HOSTCXX      = g++
>>  HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
>>                 -fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
>> @@ -1616,11 +1618,35 @@ image_name:
>>  # Clear a bunch of variables before executing the submake
>>  tools/: FORCE
>>         $(Q)mkdir -p $(objtree)/tools
>> -       $(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(src)/tools/
>> +       $(Q)ASFLAGS="$(HOSTASFLAGS)"\
>> +               LDFLAGS="$(HOSTLDFLAGS)" \
>> +               CFLAGS="$(HOSTCFLAGS)" \
>> +               CXXFLAGS="$(HOSTCXXFLAGS)" \
>> +               $(MAKE) \
>> +               AS="$(HOSTAS)" \
>> +               CC="$(HOSTCC)" \
>> +               CXX="$(HOSTCXX)" \
>> +               LD="$(HOSTLD)" \
>> +               MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" \
>> +               O=$(abspath $(objtree)) \
>> +               subdir=tools \
>> +               -C $(src)/tools/
>>
>>  tools/%: FORCE
>>         $(Q)mkdir -p $(objtree)/tools
>> -       $(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(src)/tools/ $*
>> +       $(Q)ASFLAGS="$(HOSTASFLAGS)"\
>> +               LDFLAGS="$(HOSTLDFLAGS)" \
>> +               CFLAGS="$(HOSTCFLAGS)" \
>> +               CXXFLAGS="$(HOSTCXXFLAGS)" \
>> +               $(MAKE) \
>> +               AS="$(HOSTAS)" \
>> +               CC="$(HOSTCC)" \
>> +               CXX="$(HOSTCXX)" \
>> +               LD="$(HOSTLD)" \
>> +               MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" \
>> +               O=$(abspath $(objtree)) \
>> +               subdir=tools \
>> +               -C $(src)/tools/ $*
>>
>
> Please do not do this.
>
>
>
> CC:     for building tools that run on the target machine
> HOSTCC: for building tools that run on the build machine
>
>
> IMHO, this should be consistent to avoid confusion.
>
>
> Grepping CROSS_COMPILE under tools/ directory,
> I see many Makefile expect CC for the target system.
>
> For ex, tools/croup/Makefile
>
> CC = $(CROSS_COMPILE)gcc
>
>
>
> Why don't you fix tools/objtool/Makefile ?
>
>

Interesting question. You are right, most tools are target tools, not
host tools. Maybe it _would_ make sense to use HOSTCC/HOSTCFLAGS to
build it. Copying Josh for input.

Guenter
