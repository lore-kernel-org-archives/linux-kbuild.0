Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:40650 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756717Ab1AMQ6o convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 13 Jan 2011 11:58:44 -0500
Received: by bwz15 with SMTP id 15so1710887bwz.19
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Jan 2011 08:57:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=NLmekT9SfgiuS2FGnGXNYyXBKZxorobEBLbMh@mail.gmail.com>
References: <AANLkTi=XeygsSSM8Yx+VaznC0MPfP8Ptw7oN1MHBrH+a@mail.gmail.com>
	<AANLkTinM4WoR=rSUbk4j94U9pqSgJOdB84A+5sfj71dK@mail.gmail.com>
	<AANLkTi=NLmekT9SfgiuS2FGnGXNYyXBKZxorobEBLbMh@mail.gmail.com>
Date: Thu, 13 Jan 2011 17:57:52 +0100
Message-ID: <AANLkTinGQ8q2GDkr4rYC3JT3DggfzH3GQOKmthJtp+4S@mail.gmail.com>
Subject: Re: Building an external x86_64 module from an x86 (32-bit) machine?
From: Philippe Auphelle <pauphelle@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

OK, problem solved, case closed!

Now in case this can help someone else, the whole recipe follows, and
it should work for generating various x86 kernels of any bitness from
a single 32-bit or 64-bit Linux, AND from there out-of-tree modules.
It just requires the regular native x86 gcc toolchain (post 4.2.2
version) for either 32 or 64-bit x86, no cross compiler, no nuttin',
just (may be) all or part of the packages corresponding on your distro
to debian's lib64gcc1.deb, libc6-amd64.deb, libc6-dev-amd64.deb and
g++4.4-multilib.deb
Since I already had those installed, I couldn't check what part, if
any, was needed to kbuild to x86_64.

What I wanted to do was to configure and prepare kernel configs for
32-bit and 64-bit x86 kernels in “remote” directories, i.e. in
directories that were out of the kernel source tree.
The linux.com page mentioned below is about the only source I found
for detailed info about handling multiple kernel targets with kbuild,
with all the gory details, explanations, do's and don't:

http://www.linux.com/learn/linux-career-center/29812-the-kernel-newbie-corner-building-and-running-a-new-kernel

Then it took me some time to figure out a peculiar behavior of make
menuconfig : make menuconfig does NOT prompt for 64-bitness UNLESS it
is called with an ARCH setting like:

make ARCH=x86 O=/home/foo/2.6.35-24-generic-x86_64 menuconfig

The trick is to set ARCH=x86. When using ARCH=x86_64, not only does
"make menuconfig" NOT prompt for bitness, but it does NOT set bitness
to 64-bit either.
I knew that 64-bit prompt existed because I had seen once before,
during my previous (and failed) attempts, but couldn't figure out how
I had triggered it (and why I couldn't see it again). And it took me
quite a while to figure this one out!
(side note):
What I would ideally expect menuconfig to do is this:
When ARCH= is set to any form of x86 (be it x86, x86_64, i386 or
X86_32), I would expect menuconfig to show the prompt for bitness,
with the 64-bit prompt preset by menuconfig according to the ARCH
value that was provided. I suppose this would be just as useful for
other non-x86 ARCH targets that have variable bitnesses, too.

Anyway, the whole process to kbuild an x86_64 external module from a
32-bit x86 machine is thus:
Create a specific .config file set for 64-bit in a remote directory,
using something like:
make ARCH=x86 O=/home/foo/2.6.35-24-generic-x86_64 menuconfig

Use
make ARCH=x86_64 O=/home/foo/2.6.35-24-generic-x86_64 modules_prepare
to prepare the remote kernel tree for external module building (see
Documentation/kbuild/modules.txt, “ How to build external modules”).

Or (preferably) use a plain make
make ARCH=x86_64 O=/home/foo/2.6.35-24-generic-x86_64
to run a full kernel build. The later is most likely better, since as
Arnaud mentoned above, Documentation/kbuild/modules.txt says:

NOTE: "modules_prepare" will not build Module.symvers even if
CONFIG_MODVERSIONS is set; therefore, a full kernel build needs to be
executed to make module versioning work.

CAVEAT:
On the modules_prepare or plain build make operations, note that one
MUST use the ARCH=x86_64 (and NOT the ARCH=x86 such as "make
menuconfig" wants). Otherwise, the make will be done for a 32-bit
target and will immediately fail somehow because of mismatching
options between the .config file and the make logic.

I just completed the full x86_64 kernel build, that worked perfectly,
and I do have a brand new x86_64 object kernel tree in my "remote"
target directory. And yes, all the .ko are x86_64 ones, too. ;-)
And following this, my own make for my external module happily cranked
out an x86_64 external module.

Thanks for your help! /PhA.
