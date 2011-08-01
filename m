Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:39976 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753402Ab1HACFK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 31 Jul 2011 22:05:10 -0400
Message-ID: <317e3210947c039a33b970300e62d53d.squirrel@xenotime.net>
In-Reply-To: <1312151687.18010.31.camel@i7.infradead.org>
References: <1312141497-13854-1-git-send-email-lacombar@gmail.com>
    <1312143643.12369.32.camel@i7.infradead.org>
    <CACqU3MXak0Yo+VDQNEqT9rTJ5CjdU6jJ-C1Km7GauMQ+qGW+vg@mail.gmail.com>
    <1312151687.18010.31.camel@i7.infradead.org>
Date: Sun, 31 Jul 2011 19:05:08 -0700
Subject: Re: [PATCH] kbuild: honor the ARCH setting of the existing
 configuration
From: "Randy Dunlap" <rdunlap@xenotime.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Sun, July 31, 2011 3:34 pm, David Woodhouse wrote:
> On Sun, 2011-07-31 at 18:07 -0400, Arnaud Lacombe wrote:
>> I think you totally miss the point of the patch as you keep being
>> self-centered on x86.
>
> I'm focusing on x86 at the moment because x86 is the only architecture
> that's *broken* in this respect. The other architectures that you
> mention below, where they support 64-bit kernels, all work fine with
> only *one* ARCH= setting covering all configurations. It's only x86
> where we haven't actually *finished* the merge.
>
>> I am working with configuration for mips, sh, powerpc, arm and x86.
>> Some of them are for real board, some of them are to regress-test
>> compilers, binutils and kernel builds. Each of those config hardcode
>> the CROSS_COMPILER string and have their own build directory. In each
>> case, I want to be able to just run "make O=/src/obj/v3.0-arm
>> oldnoconfig all" without having to worry about anything else.
>
> Yes, that's a valid but *separate* problem. FWIW I usually solve this
> problem with a two-line GNUmakefile:
> 	ARCH := arm
> 	include Makefile
>
> I haven't checked whether it works for out-of-source-tree builds; I bet
> it could be made to.
>
> I would love to see $ARCH turned into a proper configuration option.

I don't object in principle, but I'm expecting to have to modify/update
multiple *working* scripts as a result.  But of course this won't be
the first time and I don't expect it to be the last time either.
[signed:  eeyore]


-- 


