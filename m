Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:52858 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757491AbZABWci (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2009 17:32:38 -0500
Date: Fri, 2 Jan 2009 23:34:14 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Kbuild: reintroduce ALLSOURCE_ARCHS support for tags/cscope.
Message-ID: <20090102223414.GB8843@uranus.ravnborg.org>
References: <1230730656-2987-1-git-send-email-albcamus@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1230730656-2987-1-git-send-email-albcamus@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jike Song <albcamus@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Wed, Dec 31, 2008 at 09:37:36PM +0800, Jike Song wrote:
> This patch reintroduce the ALLSOURCE_ARCHS support for tags/TAGS/
> cscope targets. The Kbuild previously has this feature, but after
> moving the targets into scripts/tags.sh, ALLSOURCE_ARCHS disappears.
> 
> It's something like this:
> 
> 	$ make ALLSOURCE_ARCHS="x86 mips arm" tags cscope


A second point...
If you are serious about this then we need this documented
somewhere. This is not "make help" material so I suggest you
to add a new chapter in Documentation/kbuild/kbuild.txt
where you could include this.

[The file is soon-to-be-present in mainline kernel, it is
part of my second push for this merge window.

	Sam
