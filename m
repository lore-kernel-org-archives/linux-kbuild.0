Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:50313 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1750776Ab1AMFpm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 13 Jan 2011 00:45:42 -0500
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Wed, 12 Jan 2011 21:45:38 -0800
Date: Wed, 12 Jan 2011 21:45:36 -0800
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: Building an external x86_64 module from an x86 (32-bit)
 machine?
Message-Id: <20110112214536.f8f9ac93.rdunlap@xenotime.net>
In-Reply-To: <AANLkTi=XeygsSSM8Yx+VaznC0MPfP8Ptw7oN1MHBrH+a@mail.gmail.com>
References: <AANLkTi=XeygsSSM8Yx+VaznC0MPfP8Ptw7oN1MHBrH+a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Philippe Auphelle <pauphelle@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Wed, 12 Jan 2011 18:33:50 +0100 Philippe Auphelle wrote:

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

AFAIK, it's just a matter of having a 64-bit compiler available.
Most 32-bit distros that I know of just have a 32-bit compiler available,
so you would need a "cross-compiler" for 64-bit code generation on a
32-bit host, whereas on a 64-bit host, gcc can build 32-bit code or
64-bit code.  But I'm no expert on this.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
