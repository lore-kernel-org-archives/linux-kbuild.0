Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pqueuea.post.tele.dk ([193.162.153.9]:36346 "EHLO
	pqueuea.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751819Ab0LPWCa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Dec 2010 17:02:30 -0500
Received: from pfepb.post.tele.dk (pfepb.post.tele.dk [195.41.46.236])
	by pqueuea.post.tele.dk (Postfix) with ESMTP id 1B541DBAA7
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Dec 2010 22:42:14 +0100 (CET)
Date: Thu, 16 Dec 2010 22:41:51 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [kbuild-devel] Fwd: PATCH: Put .zdebug* section on white list
Message-ID: <20101216214151.GA4665@merkur.ravnborg.org>
References: <4D0A75C4.4070907@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4D0A75C4.4070907@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

I guess you wanted to forward this to the list at vger...

	Sam

On Thu, Dec 16, 2010 at 12:25:40PM -0800, H. Peter Anvin wrote:

> From: "H.J. Lu" <hjl.tools@gmail.com>
> Subject: PATCH: Put .zdebug* section on white list
> To: LKML <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>
> Date: Wed, 15 Dec 2010 17:11:22 -0800
> Message-ID: <AANLkTik90p-L+4_GnwXzoekCK0E2uemZD6tOK_kEFd2n@mail.gmail.com>
> 
> Hi,
> 
> "as --compress-debug-sections" will generate compressed debug sections
> with section names ".zdebug*".  This patch puts .zdebug* section on
> white list.
> 
> 
> -- 
> H.J.

> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 6a087ff..2bab622 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -790,6 +790,7 @@ static const char *section_white_list[] =
>  {
>  	".comment*",
>  	".debug*",
> +	".zdebug*",		/* Compressed debug sections. */
>  	".GCC-command-line",	/* mn10300 */
>  	".mdebug*",        /* alpha, score, mips etc. */
>  	".pdr",            /* alpha, score, mips etc. */


> ------------------------------------------------------------------------------
> Lotusphere 2011
> Register now for Lotusphere 2011 and learn how
> to connect the dots, take your collaborative environment
> to the next level, and enter the era of Social Business.
> http://p.sf.net/sfu/lotusphere-d2d
> _______________________________________________
> kbuild-devel mailing list
> kbuild-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/kbuild-devel

