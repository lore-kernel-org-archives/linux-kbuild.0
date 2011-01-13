Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:61512 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750771Ab1AMFiu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 13 Jan 2011 00:38:50 -0500
Received: by iwn9 with SMTP id 9so1247499iwn.19
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Jan 2011 21:38:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=XeygsSSM8Yx+VaznC0MPfP8Ptw7oN1MHBrH+a@mail.gmail.com>
References: <AANLkTi=XeygsSSM8Yx+VaznC0MPfP8Ptw7oN1MHBrH+a@mail.gmail.com>
Date: Thu, 13 Jan 2011 00:38:49 -0500
Message-ID: <AANLkTinM4WoR=rSUbk4j94U9pqSgJOdB84A+5sfj71dK@mail.gmail.com>
Subject: Re: Building an external x86_64 module from an x86 (32-bit) machine?
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Philippe Auphelle <pauphelle@gmail.com>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Wed, Jan 12, 2011 at 12:33 PM, Philippe Auphelle <pauphelle@gmail.com> wrote:
> Hi,
>
> Running a 2.6.35 kernel, and gcc 4.4.5, I'm trying to build both an
> x86 (32) and an x86_64 external (out of tree) module from my x86
> (32-bit) dev machine.
>
> I have tried various tricks, such as using ARCH=X86_64 when running
> make, but to no avail so far: Whatever I do, V=1 shows kbuild invoking
> gcc with -m32 and ld with elf_i386.
>
> I have googled around for a few hours without finding a solution to
> the problem.
> Since the x86 arch is unified and gcc is able to gen (and link) x86_64
> targets, it looks like this could be done, and I must be missing
> something.
> Could anyone point me to the right direction?
>
I suppose that you ensured that your kernel tree when you are building
for x86-32 has been "prepared" for building for x86-32, and that you
are using a dedicated x86-64 config and preparation when you try to
build for x86-64 ?

I'm just asking because I reproduced what I guess you are seeing using
an ARCH=x86 config&prep tree on an x86-64 machine. When I try to build
the module with ARCH=x86_64, -m32 is still specified. At least, there
should be a test to assert that CONFIG_ARCH == ARCH when building a
external module.

While at this, I also think the build should die and report an error
when trying to build an external modules when "CONFIG_MODULES is not
set". Currently the build just fails miserably :/ [yes, that's a
different issue.]

Thanks,
 - Arnaud
