Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from py-out-1112.google.com ([64.233.166.176]:60321 "EHLO
	py-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758507AbYEAWyy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 May 2008 18:54:54 -0400
Received: by py-out-1112.google.com with SMTP id u52so1853623pyb.10
        for <linux-kbuild@vger.kernel.org>; Thu, 01 May 2008 15:54:53 -0700 (PDT)
Message-ID: <8499950a0805011554p25bc8230l9f3556bf3a1ff15a@mail.gmail.com>
Date: Thu, 1 May 2008 23:54:53 +0100
From: "Oleg Verych" <olecom@gmail.com>
Subject: Re: `sed`ing asm-offsets (Re: gcc 3.4.6 fails to build 2.6.25 due to offsetof() not digestible by gas)
In-Reply-To: <20080501214219.GA8386@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <16355.213.30.72.21.1209618475.squirrel@galactus.symlabs.net>
	 <20080501120616.GY29330@cs181133002.pp.htv.fi>
	 <38941.81.193.128.196.1209654347.squirrel@galactus.symlabs.net>
	 <20080501163453.GF29330@cs181133002.pp.htv.fi>
	 <34486.81.193.128.196.1209659903.squirrel@galactus.symlabs.net>
	 <20080501165333.GG29330@cs181133002.pp.htv.fi>
	 <33623.81.193.128.196.1209661842.squirrel@galactus.symlabs.net>
	 <20080501185352.GU24008@flower.upol.cz>
	 <20080501214219.GA8386@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Sam Ravnborg (kbuild list)" <linux-kbuild@vger.kernel.org>

> >   sed -ne "/^->/{s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /*
> > \3 */:; s:->::; p;}" < asm-offsets.s
[]
>  >  Can you come up with a _minimal_ fix that makes it compatible with
>  >  busy-box AND GNU sed?
>
>  Script works in GNU and busybox sed, except that "$#" thing.
>  Let's wait for `set -x` feedback.

Unreadable for humans `sed` can be as short as this:

[busybox] sed '/#def/s-.[$#]- -gp;d'

or without "-fverbose-asm" (i.e. #comments after instruction) even like this

olecom@flower:/tmp/blinux$ busybox sed '/#def/s [$]  p;d'
arch/x86/kernel/asm-offsets.s
+ busybox sed '/#def/s [$]  p;d' arch/x86/kernel/asm-offsets.s
#define tsk_state 0 /*offsetof(struct task_struct, state)*/
#define tsk_flags 20 /*offsetof(struct task_struct, flags)*/
#define tsk_pid 328 /*offsetof(struct task_struct, pid)*/
olecom@flower:/tmp/blinux$

The only thing to change is (unreadable) #define in asm-offsets.c:

#define DEFINE(sym, val) \
        asm volatile("\n#define " #sym " %0 /*" #val "*/": : "i" (val))

(BLANK also, but it's a phony load)
_____
