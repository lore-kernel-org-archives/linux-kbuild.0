Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-va3.bigfish.com ([216.32.180.113]:60404 "EHLO
	mail125-va3-R.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753420AbYFMVeW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Jun 2008 17:34:22 -0400
Message-ID: <4852E245.4020502@am.sony.com>
Date: Fri, 13 Jun 2008 14:10:29 -0700
From: Tim Bird <tim.bird@am.sony.com>
MIME-Version: 1.0
Subject: Re: Not as much ccache win as I expected
References: <4852C51D.30206@am.sony.com> <8499950a0806131354u7d2431b2n2df50b7b6c98f18d@mail.gmail.com>
In-Reply-To: <8499950a0806131354u7d2431b2n2df50b7b6c98f18d@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Oleg Verych <olecom@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org

Oleg Verych wrote:
> And what kinds of source/kconfig changes are made for every build?

I start with a baseline config for an embedded board, then
alter, one at a time, individual config items related to kernel size.
No source changes are made.

I do full removal of the kernel source tree and build area
before the start of each test.

> (any versions, e.g. localversion, .version, aren't important, they are for
> modules ko and vmlinux, afaik)
Ok - this is helpful.

> kbuild is `ccache` on itself. Every *.o.cmd is kind of info `ccache`
> hashes (except things like stderr, gcc version) to check repeated
> rebuilds.
Yeah, I'm pretty impressed with how well kbuild avoids rebuilding
stuff in the first place.

Maybe I should just be grateful for any ccache hits I get.

Thanks,
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

