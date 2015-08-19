Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43593 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751728AbbHSOQ1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Aug 2015 10:16:27 -0400
Subject: Re: [RFC v2 0/4] scripts: add stack{usage,delta} scripts
References: <1434849046-19920-1-git-send-email-linux@rasmusvillemoes.dk>
 <1435220492-15868-1-git-send-email-linux@rasmusvillemoes.dk>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <55D48FB9.50605@suse.cz>
Date: Wed, 19 Aug 2015 16:16:25 +0200
MIME-Version: 1.0
In-Reply-To: <1435220492-15868-1-git-send-email-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-kbuild@vger.kernel.org

On 2015-06-25 10:21, Rasmus Villemoes wrote:
> The current checkstack.pl script has a few problems, stemming from the
> overly simplistic attempt at parsing objdump output with regular
> expresions. Since gcc 4.6 introduced the -fstack-usage option, we can
> now get the exact stack use instead of resorting to ad hoc methods.
> 
> This introduces two small scripts. One for running make with KCFLAGS
> set to -fstack-usage, followed by collecting the generated .su files
> in a single output file. Another for taking two such output files and
> computing the changes in stack use.
> 
> 2/4 and 3/4 may be too small by themselves; they can easily be
> squashed into 1/4.
> 
> v2: Use KCFLAGS instead of EXTRA_CFLAGS. A few more details in commit
> messages. Simpler option handling in stackusage. Removed accidental
> leftover debug prints.

Do you plan any new iterations, or is this final despite the [RFC]? If
it's final, I will apply it.

Michal
