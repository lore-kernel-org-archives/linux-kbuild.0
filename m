Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([88.198.36.42]:48460 "EHLO baikonur.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755952AbbDVQBb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2015 12:01:31 -0400
Date: Wed, 22 Apr 2015 17:55:36 +0200
From: maximilian attems <max@stro.at>
Subject: Re: [PATCHv4 1/1] deb-pkg: Add device tree blobs to the package
Message-ID: <20150422155535.GC32026@gluino>
References: <20150203121648.046396044@rtp-net.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150203121648.046396044@rtp-net.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: linux-kbuild@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.cz>

On Tue, Feb 03, 2015 at 01:16:33PM +0100, Arnaud Patard wrote:
> When building a package with make deb-pkg (say, for arm), the dtb files are
> not added to the package. Given that things are still evolving on arm, it
> make sense to have them along with the kernel and modules.
> 
> v4: Use $KCONFIG_CONFIG
> v3: handle with OF but without dtbs_install.
>     Use $MAKE ... as done everywhere else in the script
> v2: make use of dtbs_install
> 
> Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
> ---

the patch seems to apply to current linus with 
Hunk #1 succeeded at 143 with fuzz 1.

acked.

