Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:54359 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750960Ab1AGP10 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 7 Jan 2011 10:27:26 -0500
Date: Fri, 7 Jan 2011 16:27:24 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] deb-pkg: Make deb-pkg generate a seperate linux-libc-dev
 deb
Message-ID: <20110107152724.GE1841@sepie.suse.cz>
References: <1293896653-17947-1-git-send-email-max@stro.at>
 <4D271CF3.1090702@suse.cz>
 <20110107151513.GZ20262@vostochny.stro.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110107151513.GZ20262@vostochny.stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org

On Fri, Jan 07, 2011 at 03:15:13PM +0000, maximilian attems wrote:
> On Fri, Jan 07, 2011 at 03:02:27PM +0100, Michal Marek wrote:
> > 
> > hdrpackagename and headerpackagename aren't exactly intuitive names.
> > What about kernel_headers_package and libc_headers_package?
> > 
> 
> ack, sent patch on top of that one to fix both and the dir names.

OK, applied both to kbuild-2.6.git#packaging.

Michal
