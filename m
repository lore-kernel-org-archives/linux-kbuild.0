Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:34575 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751883AbYAFPpS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Jan 2008 10:45:18 -0500
Date: Sun, 6 Jan 2008 16:45:21 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Kbuild update
Message-ID: <20080106154521.GB3504@uranus.ravnborg.org>
References: <20080103213255.GA21811@uranus.ravnborg.org> <20080104132316.GA2485@hacking> <20080104143953.GA30536@uranus.ravnborg.org> <20080105054840.GB9976@does.not.exist> <20080106142606.GB2528@hacking> <20080106150744.GJ2082@does.not.exist>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080106150744.GJ2082@does.not.exist>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: WANG Cong <xiyou.wangcong@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

> 
> And don't underestimate the amount of work required - even when talking 
> about requiring "only" 10% of the help texts translated that's a four 
> digit number of lines to translate.

The .pot file is 80601 lines long and contains 11485 strings.
[Not counting cris architecture specific strings as it failed]

> 
> > If we can make this to be an offical project for Linux kernel, I
> > think it won't be a big problem.
> 
> We don't even manage to maintain the English language texts properly,
> and I am therefore not overly optimistic that we'll have the 
> translations maintained properly for many years.
Italian was 100% translated at one point in time.
And the Linux Kernel Translation project has a number of
spelling error fixes in queue (I dunno if they have been applied).

So even when run as an external project it was ok for some languages,
and having it official and someone taking patches to .po files would
for sure allow more users to build a kernel.

	Sam
