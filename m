Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:40036 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751389Ab1AGPPO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 7 Jan 2011 10:15:14 -0500
Date: Fri, 7 Jan 2011 15:15:13 +0000
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] deb-pkg: Make deb-pkg generate a seperate
	linux-libc-dev deb
Message-ID: <20110107151513.GZ20262@vostochny.stro.at>
References: <1293896653-17947-1-git-send-email-max@stro.at> <4D271CF3.1090702@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4D271CF3.1090702@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

On Fri, Jan 07, 2011 at 03:02:27PM +0100, Michal Marek wrote:
> 
> hdrpackagename and headerpackagename aren't exactly intuitive names.
> What about kernel_headers_package and libc_headers_package?
> 

ack, sent patch on top of that one to fix both and the dir names.

thanks.

-- 
maks
