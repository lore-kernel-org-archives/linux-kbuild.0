Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:45403 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756953Ab1AMSCb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 13 Jan 2011 13:02:31 -0500
Received: by bwz15 with SMTP id 15so1772464bwz.19
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Jan 2011 10:02:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTikMW799DXo2RuEir1q-zxOvXp4oUT=NYpTrrVwS@mail.gmail.com>
References: <AANLkTi=XeygsSSM8Yx+VaznC0MPfP8Ptw7oN1MHBrH+a@mail.gmail.com>
	<AANLkTinM4WoR=rSUbk4j94U9pqSgJOdB84A+5sfj71dK@mail.gmail.com>
	<AANLkTi=NLmekT9SfgiuS2FGnGXNYyXBKZxorobEBLbMh@mail.gmail.com>
	<AANLkTinGQ8q2GDkr4rYC3JT3DggfzH3GQOKmthJtp+4S@mail.gmail.com>
	<AANLkTikMW799DXo2RuEir1q-zxOvXp4oUT=NYpTrrVwS@mail.gmail.com>
Date: Thu, 13 Jan 2011 19:02:29 +0100
Message-ID: <AANLkTinAFeHUL41k2OSF-UmLHf_NxgkLZcrvT48uCnoi@mail.gmail.com>
Subject: Re: Building an external x86_64 module from an x86 (32-bit) machine?
From: Philippe Auphelle <pauphelle@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Arnaud,

First of all, when it started, I thought it was a kbuild (and friends) question.
But after I found the solution, I thought of that, and after thinking
twice, it looked to me that the problem would (or should?) have been
the same on other archs that support multiple bitnesses in a single
arch, like ARM, PPC, MIPS, even good'ole s390 or whatever.
When I looked at the gcc (cross or not cross?) for instance, it
appeared that the -m32 / -m64 option wasn't specific to x86 but
existed in other archs.
I suspect that menuconfig behaves more or less the same about the
bitness in other archs too (OK, I admit, I didn't check that *at all*
;-) )  And here again, if it doesn't right now, I have a feeling that
it eventually should. The reasons behind the unification of i386 and
x86_64 back in 2007-2008 apply just the same to other architectures,
and if there are still some that haven't been unified, I bet they will
one day.

The solution ended up being a better understanding / explaination about
- what gcc is able to do natively, without a cross toolchain, in a
given architecture with different bitnesses,
- how to use kbuild with multiple "remote" target directories,
- a peculiarity with menuconfig

Admittedly, I didn't make any deep check on any of the other archs, though.

But still, unless I'm missing something big, not much of this seems
really soooo x86 specific after all.
And all things considered, I'm still unsure whether I should really
double-post this on the x86 list... /PhA.
