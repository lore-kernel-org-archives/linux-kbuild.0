Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:54583 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751239AbZABWae (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2009 17:30:34 -0500
Date: Fri, 2 Jan 2009 23:32:13 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Kbuild: reintroduce ALLSOURCE_ARCHS support for tags/cscope.
Message-ID: <20090102223213.GA8843@uranus.ravnborg.org>
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

Hi Jike.

Did you implment this feature because you really use it
or did you do so because it was 'missing'?

I explicitly avoided the feature as I expected it to be used
very seldom.

	Sam
