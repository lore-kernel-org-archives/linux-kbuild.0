Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37450 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751798AbbCMKAk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Mar 2015 06:00:40 -0400
Message-ID: <5502B546.5010806@suse.cz>
Date: Fri, 13 Mar 2015 11:00:38 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC PATCH] Don't reset timestamps in include/generated if not
 needed
References: <15447.1425431256@turing-police.cc.vt.edu>	<CA+55aFx368q6kAuNV_7zskFdyh2yxYfpm77Yak5WQiexin_d9A@mail.gmail.com>	<20150311100101.GA30787@sepie.suse.cz> <CAK7LNASH7oTCcNbyt_D+aaNuG+UFb8MXLUHBMWtW+ZcjmFsnjw@mail.gmail.com>
In-Reply-To: <CAK7LNASH7oTCcNbyt_D+aaNuG+UFb8MXLUHBMWtW+ZcjmFsnjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Valdis Kletnieks <Valdis.Kletnieks@vt.edu>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Dne 13.3.2015 v 05:59 Masahiro Yamada napsal(a):
> 2015-03-11 19:01 GMT+09:00 Michal Marek <mmarek@suse.cz>:
>> We already have it and it is called "filechk." Valdis, can you check if
>> the below patch works equally well for you?
> 
> This looks almost nice, but a few comments below.

Thanks for the review!


>>  $(obj)/$(bounds-file): kernel/bounds.s Kbuild
> 
> You are checking the resulting file content,
> so the dependency on "Kbuild" is not necessary.
> 
> Instead, you need to add "FORCE" so that this rule is always invoked.

Good point.


>>         $(Q)mkdir -p $(dir $@)
> 
> You can drop this line because filechk automatically creates the
> output directory.

Likewise.

Michal
