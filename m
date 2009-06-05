Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:37909 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752399AbZFEWNV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jun 2009 18:13:21 -0400
Date: Sat, 6 Jun 2009 00:14:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch 3/3] scripts/headers_check.pl: correct RE in header CONFIG leak check
Message-ID: <20090605221454.GK29008@uranus.ravnborg.org>
References: <200905122102.n4CL2q6F007223@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200905122102.n4CL2q6F007223@imap1.linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kbuild@vger.kernel.org, rpjday@crashcourse.ca, dwmw2@infradead.org

On Tue, May 12, 2009 at 01:43:36PM -0700, akpm@linux-foundation.org wrote:
> From: "Robert P. J. Day" <rpjday@crashcourse.ca>
> 
> Correct the regular expression in scripts/headers_check.pl to include '_'
> as a valid character in the class; otherwise, the check will report a
> "leaked" symbol of CONFIG_A_B_C as merely CONFIG_A.
> 
> This patch will make no difference whatsoever in the current kernel tree
> as the call to the perl routine that does that check is currently
> commented out:
> 
>                 &check_include();
>                 &check_asm_types();
>                 &check_sizetypes();
>                 &check_prototypes();
>                 # Dropped for now. Too much noise &check_config();
> 
> However, I noticed that problem when I was building the yum downloadable
> kernel source rpm for fedora 11 (beta), which *does* run that check, and
> that's where the problem became obvious.

Applied,
	Sam
