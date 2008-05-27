Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.231]:55973 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757138AbYE0TBq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 May 2008 15:01:46 -0400
Received: by rv-out-0506.google.com with SMTP id l9so3085480rvb.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 May 2008 12:01:45 -0700 (PDT)
Message-ID: <19f34abd0805271201g587a2e8w4379f3d3f20f2cfa@mail.gmail.com>
Date: Tue, 27 May 2008 21:01:45 +0200
From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: 'make arch/x86/' fails
In-Reply-To: <20080527184426.GA6235@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <19f34abd0805271114o70f62d6gdf2f37109364a86@mail.gmail.com>
	 <20080527184426.GA6235@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Tue, May 27, 2008 at 8:44 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Tue, May 27, 2008 at 08:14:31PM +0200, Vegard Nossum wrote:
>> Hi,
>>
>> I don't know if this is a regression or what (I've observed it for a
>> while), but now I thought I'd let you know about it:
>>
>> $ make arch/x86/
>>   CHK     include/linux/version.h
>>   CHK     include/linux/utsrelease.h
>>   CC      kernel/bounds.s
>>   GEN     include/linux/bounds.h
>>   CC      arch/x86/kernel/asm-offsets.s
>>   GEN     include/asm-x86/asm-offsets.h
>>   CALL    scripts/checksyscalls.sh
>> [...]/linux-2.6/arch/x86/Makefile:37: *** Recursive variable
>> `KBUILD_CFLAGS' references itself (eventually).  Stop.
>> make: *** [arch/x86/] Error 2
>
> This is unfortunately what you should expect
> because the directory arch/x86/ is special as it does
> not contain a regular Kbuild file but instead contains
> a badly named arch configuration file (Makefile).
>
>>
>> Are there any work-arounds or easy fixes for this? Thanks.
> For each directory in arch/x86/* do make arch/x86/{directory}
>

Thanks.

How about splitting a part of arch/*/Makefile into
arch/*/Makefile.arch and including this new Makefile.arch from the
top-level Makefile instead?

-include $(srctree)/arch/$(SRCARCH)/Makefile
+include $(srctree)/arch/$(SRCARCH)/Makefile.arch

(I know you're busy these days, but do you think I would waste my time
in pursuing this any further? :-))


Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
