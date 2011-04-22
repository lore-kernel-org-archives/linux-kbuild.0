Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:43715 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754194Ab1DVKPZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Apr 2011 06:15:25 -0400
Date: Fri, 22 Apr 2011 12:15:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC PATCH] kbuild: implement several W= levels
Message-ID: <20110422101524.GA20671@merkur.ravnborg.org>
References: <20110421213903.GB9660@merkur.ravnborg.org> <20110422081926.GA26286@liondog.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110422081926.GA26286@liondog.tnic>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>, Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Hi Borislav.
 
> > the patch is only an RFC - and is not made on top
> > of an upstream kernel with no additiona stuff applied.
> 
> Thanks for doing this, a couple of suggestions below.
...

You already spend more time analysing this than it took me
to write the patch.
Can I persuade you to implement the various W= levels based
on your analysis and send to Michal for merging?
You can use my v2 PATCH as inspiration.

Please take authorship on the patch as the main work
is to decide what warnings belongs to which level.

[Snipped - lots of good comments]

	Sam
