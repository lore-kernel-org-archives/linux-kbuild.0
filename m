Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:50477 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767Ab3BOMBm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Feb 2013 07:01:42 -0500
Date: Fri, 15 Feb 2013 13:01:37 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC][PATCH] kernel: Replace timeconst.pl with a bc script
Message-ID: <20130215120137.GA16769@merkur.ravnborg.org>
References: <1360883635-25268-1-git-send-email-hpa@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1360883635-25268-1-git-send-email-hpa@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kbuild@vger.kernel.org, mingo@kernel.org, tglx@linutronix.de, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>

On Thu, Feb 14, 2013 at 03:13:55PM -0800, H. Peter Anvin wrote:
> From: "H. Peter Anvin" <hpa@zytor.com>
> 
> bc is the standard tool for multi-precision arithmetic.  We switched
> to Perl because akpm reported a hard-to-reproduce build hang, which
> was very odd because affected and unaffected machines were all running
> the same version of GNU bc.
> 
> Unfortunately switching to Perl required a really ugly "canning"
> mechanism to support Perl < 5.8 installations lacking the Math::BigInt
> module.
> 
> It was recently pointed out to me that some very old versions of GNU
> make had problems with pipes in subshells, which was indeed the
> construct used in the Makefile rules in that version of the patch;
> Perl didn't need it so switching to Perl fixed the problem for
> unrelated reasons.  With the problem (hopefully) root-caused, we can
> switch back to bc and do the arbitrary-precision arithmetic naturally.
> 
> Signed-off-by: H. Peter Anvin <hpa@zytor.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Marek <mmarek@suse.cz>
> Cc: Sam Ravnborg <sam@ravnborg.org>

The kbuild stuff looks fine. The bc stuff I do not know about.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
