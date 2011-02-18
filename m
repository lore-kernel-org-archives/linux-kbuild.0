Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:52458 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756973Ab1BRPz7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Feb 2011 10:55:59 -0500
Received: by qwd7 with SMTP id 7so458611qwd.19
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Feb 2011 07:55:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20110216201139.GB25184@merkur.ravnborg.org>
References: <AANLkTimpG+9nvad8WnjaORcyZR8Yu5AaYwbQDGOWDjYJ@mail.gmail.com>
	<20110216201139.GB25184@merkur.ravnborg.org>
Date: Fri, 18 Feb 2011 16:55:56 +0100
Message-ID: <AANLkTinepdVhjkKz9OQ96c52=i5-y7fxPVpS_Ni3nvMv@mail.gmail.com>
Subject: Re: kbuild/kconfig for non-Linux projects
From: Thomas De Schampheleire <patrickdepinguin+kbuild@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Wed, Feb 16, 2011 at 9:11 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, Feb 16, 2011 at 10:08:08AM +0100, Thomas De Schampheleire wrote:
>> Hi,
>>
>> I'm interested in using kbuild/kconfig for other projects than the
>> Linux kernel. I notice that a lot of projects (e.g. Buildroot,
>> Busybox, uClibc, OpenBricks, ...) are already using this framework,
>> but it's unclear to me which steps are needed to do so.
>>
>> I found a related thread on this mailing list that seemed to have died out.
>> http://www.mail-archive.com/kbuild-devel@lists.sourceforge.net/msg02487.html
>>
>> I also found a code repository 'menuconfig' here, although I doubt
>> that this is an official one:
>> http://code.google.com/p/menuconfig/source/browse/trunk/
>>
>> Specifically, I'd like to know:
>> * are there 'official' sources to kbuild in some repository outside
>> the linux kernel?
>> * which steps are needed to use kbuild in a project other than the
>> linux kernel? Is there some documentation available?
>
> You could take a look at klibc - the kbuild integration used
> there is much simpler than what we have in the kernel.
> It may need a little refresh - but copying over
> Kbuild.include should be 90% of the update.
>
> As for documentation - you should at least read Documentation/kbuild/*
>
>> * what is the license under which kbuild is distributed? In case it's
>> GPL, does this impact the license of the software project using
>> kbuild, i.e. does using kbuild imply the project being a derived work?
>
> kbuild is part of the build-system. So there is nothing wrong using kbuild
> to build your proprietary (closed source) stuff.
> So kbuild are under GPLv2 - but that does not impact you program.

Thank you all for the input! I'll take a look at the links you
provided and try it out.

Best regards,
Thomas
