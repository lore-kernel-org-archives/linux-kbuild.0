Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:40525 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751874AbZAGUHM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 7 Jan 2009 15:07:12 -0500
Date: Wed, 7 Jan 2009 21:08:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RESEND][PATCH] Kbuild: reintroduce ALLSOURCE_ARCHS support for tags/cscope.
Message-ID: <20090107200850.GG4647@uranus.ravnborg.org>
References: <1231138623-26972-1-git-send-email-albcamus@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1231138623-26972-1-git-send-email-albcamus@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jike Song <albcamus@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Mon, Jan 05, 2009 at 02:57:03PM +0800, Jike Song wrote:
> This patch reintroduce the ALLSOURCE_ARCHS support for tags/TAGS/
> cscope targets. The Kbuild previously has this feature, but after
> moving the targets into scripts/tags.sh, ALLSOURCE_ARCHS disappears.
> 
> It's something like this:
> 
> 	$ make ALLSOURCE_ARCHS="x86 mips arm" tags cscope
> 
> Signed-off-by: Jike Song <albcamus@gmail.com>

Applied,

	Sam
