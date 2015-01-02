Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([88.198.36.42]:49492 "EHLO baikonur.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750783AbbABUak (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 15:30:40 -0500
Date: Fri, 2 Jan 2015 12:21:52 -0800
From: maximilian attems <max@stro.at>
Subject: Re: [RFC] builddeb: Try to determine distribution
Message-ID: <20150102202151.GA3519@gluino>
References: <1420229669-5550-1-git-send-email-sedat.dilek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420229669-5550-1-git-send-email-sedat.dilek@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, Thorsten Glaser <tg@debian.org>, Alexander Wirt <formorer@debian.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org



On Fri, Jan 02, 2015 at 09:14:29PM +0100, Sedat Dilek wrote:
> This is based on ideas of me and Ben.
> Thanks goes to Thorsten and Alexander for the vital help in 2012.
> 
> Like in my initial patch [1] lsb_release is used to determine
> the short codename as distribution name for debian/changelog.

In contrast to the code snippet from Ben, you assume lsb_release
to be installed, which is a wrong assumption.
 
> Ben gave some helpful and detailed information in [2].
> There he also suggested to have an option to explicitly set the
> distribution (see $KDEB_CHANGELOG_DIST variable).
> 
> I have hardcoded the script-name when the default distribution
> is used. This is a bit ugly.
> 
> This patch is based on the snippet of Ben in [2] and tested
> against Linux v3.19-rc2.
> 
> [1] https://lkml.org/lkml/2012/4/23/516
> [2] http://marc.info/?l=linux-kbuild&m=142022188322321&w=2
> 
