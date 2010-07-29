Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:38397 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755078Ab0G2T2E (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Jul 2010 15:28:04 -0400
Date: Thu, 29 Jul 2010 21:28:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: How to access if/endif dependencies programmatically?
Message-ID: <20100729192801.GA7877@merkur.ravnborg.org>
References: <AANLkTim9b=n7CvnSJhwDrE_HrnJOJ0H=EpOkGBvJt1CC@mail.gmail.com> <20100729091650.GA6085@merkur.ravnborg.org> <AANLkTin1kVoL0kaozsb26id7nsM-BfN1wx1sWf1=EpMi@mail.gmail.com> <AANLkTikEWncPf_tWzcVzMm_trrbiH++EdrtJRD5c-jO_@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AANLkTikEWncPf_tWzcVzMm_trrbiH++EdrtJRD5c-jO_@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: kbuild <linux-kbuild@vger.kernel.org>

> >
> > Can the two prompts have different "depends on"-dependencies, or are
> > the following two definitions exactly equivalent?
> >
> I guess what I really meant was this:
> 
> 1)
> config C
> bool "c"
> depends on A
> depends on B

Here symbol "C" has one prompt "c".
And in the menu structure it depends on A && B.

> 
> 2)
> config C
> bool "c1"
> depends on A
> config C
> bool "c2"
> depends on B

Here symbol "C" has two prompts.
Prompt "c1" depends on A - so this prompt is only shown when A is y (or m)
Prompt "c2" depends on B - so it is only shown when B is y (or m)

If both A and B is set then both prompts are visible.
You will then see when you select one prompt the other will be selected too.

This is very easy to test with a small config file to menuconfig.

> (This version should actually create two different prompts instead of
> just adding dependencies to the same symbol.)
Correct.

	Sam
