Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:44893 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752647AbZD2XrC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Apr 2009 19:47:02 -0400
Date: Thu, 30 Apr 2009 01:49:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: error when using KCONFIG_ALLCONFIG?
Message-ID: <20090429234911.GA1922@uranus.ravnborg.org>
References: <49F8D6EC.1090800@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49F8D6EC.1090800@xenotime.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

On Wed, Apr 29, 2009 at 03:38:36PM -0700, Randy Dunlap wrote:
> Hi,
> 
> I often use
> make KCONFIG_ALLCONFIG=filename allnoconfig
> 
> and it works fine.  However, when I use O= with that:
> 
> make O=xx64 KCONFIG_ALLCONFIG=filename allnoconfig
> 
> I get an xx64/.config file that is the same as
> 
> make O=xx64 allnoconfig
> 
> I.e., the KCONFIG_ALLCONFIG=filename part was ignored.
> 
> Is this new?  expected?  known?
I dunno if it is new but it is not expected.
Can you try if it help to move 'filename' to output directory.

Thanks,
	Sam
