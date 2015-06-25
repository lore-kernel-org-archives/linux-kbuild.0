Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:36823 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751253AbbFYIEF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Jun 2015 04:04:05 -0400
Received: by lacny3 with SMTP id ny3so39874526lac.3
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jun 2015 01:04:02 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [RFC 1/4] scripts: add stackusage script
References: <1434849046-19920-1-git-send-email-linux@rasmusvillemoes.dk>
	<1434849046-19920-2-git-send-email-linux@rasmusvillemoes.dk>
	<558964EE.7090009@suse.cz>
Date: Thu, 25 Jun 2015 10:04:00 +0200
In-Reply-To: <558964EE.7090009@suse.cz> (Michal Marek's message of "Tue, 23
	Jun 2015 15:53:50 +0200")
Message-ID: <87egl08b9r.fsf@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jun 23 2015, Michal Marek <mmarek@suse.cz> wrote:

>
> EXTRA_CFLAGS is reserved for use by Makefiles, please use KCFLAGS
> instead.

Will do, thanks. Maybe Documentation/SubmitChecklist and
Documentation/development-process/4.Coding wants to be updated.

> I wonder whether it worked at all, because EXTRA_CFLAGS is
> reset by scripts/Makefile.build.

It did indeed work, but only because I passed the setting on the make
command line and not via the environment. I think one needs an override
directive to actually override the settings from the command line:

$ cat Makefile 
VAR1 := a1
VAR2 := a2
override VAR3 := a3
override VAR4 := a4

all:
        @echo $(VAR1) $(VAR2) $(VAR3) $(VAR4)
$ VAR1=b1 VAR3=b3 make VAR2=b2 VAR4=b4 all
a1 b2 a3 a4
