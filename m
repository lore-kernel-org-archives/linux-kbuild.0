Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-px0-f193.google.com ([209.85.216.193]:52038 "EHLO
	mail-px0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750765AbZGJHxW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 Jul 2009 03:53:22 -0400
Date: Fri, 10 Jul 2009 15:55:30 +0800
From: Amerigo Wang <xiyou.wangcong@gmail.com>
Subject: Re: [PATCH] kconfig: simplification of scripts/extract-ikconfig
Message-ID: <20090710075530.GB6263@cr0.nay.redhat.com>
References: <20090623225245.GA10443@streefland.net> <20090624021506.GA5871@cr0.nay.redhat.com> <20090624114607.GA10817@streefland.net> <20090624133148.GA12878@streefland.net> <20090629025146.GA5998@cr0.nay.redhat.com> <20090629113613.GA6853@streefland.net> <20090709023855.GA5648@cr0.nay.redhat.com> <20090709082651.GA6165@streefland.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090709082651.GA6165@streefland.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dick Streefland <dick@streefland.net>
Cc: Amerigo Wang <xiyou.wangcong@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 09, 2009 at 10:26:51AM +0200, Dick Streefland wrote:
>On Thursday 2009-07-09 10:38, Amerigo Wang wrote:
>| I appologize for my delay, I totally missed this thread, sorry.
>| 
>| I just tested it, it works! So,
>| 
>| Tested-by: WANG Cong <xiyou.wangcong@gmail.com>
>
>Great, thanks.
>
>| But, I still don't understand the behavior of 'grep -abo',
>| please try the following commands:
>| 
>| echo -e '\x01\x02\x03\x04' > test.bin
>| od -x test.bin
>| tr $'\x01\x02\x03\x04' '1234' < test.bin | grep -abo '4'
>| 
>| Am I missing something here??
>
>The output with grep-2.5.3 is 3:4, which means that the string "4" was
>found at offset 3 (0-based). With grep-2.5.1, you get 0:4, which means
>that the line containing the string "4" has offset 0. The "tr" commands
>in the script ensure that the patterns we are looking for are always at
>the start of a line, so that it doesn't matter which version of grep is
>installed.

Hmm, I see, it is really a _big_ change. :)

Have you checked other version of grep? I mean lower version, of course,
does your script work with them too?

Thank you!

