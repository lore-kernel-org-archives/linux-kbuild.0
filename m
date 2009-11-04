Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:53853 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750741AbZKEADl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Nov 2009 19:03:41 -0500
Date: Thu, 5 Nov 2009 00:40:23 +0100
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] deb-pkg: Make deb-pkg generate a seperate linux-libc-dev deb
Message-ID: <20091104234023.GJ29378@baikonur.stro.at>
References: <1257373849-25557-1-git-send-email-max@stro.at> <200911050020.00291.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200911050020.00291.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frans Pop <elendil@planet.nl>
Cc: linux-kbuild@vger.kernel.org, sam@ravnborg.org

On Thu, Nov 05, 2009 at 12:19:59AM +0100, Frans Pop wrote:
> maximilian attems wrote:
> > userland dev likes latest incarnation of that userland API.
> > make it easy to also build it on make deb-pkg invocation:
> >
> > dpkg-deb: building package `linux-libc-dev' in
> > `../linux-libc-dev_2.6.32-rc6-4_amd64.deb'.
> 
> I would very much prefer it if this was either optional or a separate 
> target. I have personally never had any need for such a package and would 
> like to be able to not build it.
> 
> I agree it should be possible, just not forced.

so what you propose a bindeb-pkg target for the linux-image only?

there is clearly demand for linux-source and linux-headers packages
build out of deb-pkg.
