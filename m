Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([88.198.36.42]:48461 "EHLO baikonur.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754619AbbDVQBc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2015 12:01:32 -0400
Date: Wed, 22 Apr 2015 17:52:01 +0200
From: maximilian attems <maks@stro.at>
Subject: Re: [PATCH] deb-pkg: v2: move setting debarch for a separate function
Message-ID: <20150422155201.GB32026@gluino>
References: <552E59D9.7060101@suse.cz>
 <1429191766-13385-1-git-send-email-riku.voipio@linaro.org>
 <5537B412.1000109@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5537B412.1000109@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: riku.voipio@linaro.org, linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org

On Wed, Apr 22, 2015 at 04:45:38PM +0200, Michal Marek wrote:
> On 2015-04-16 15:42, riku.voipio@linaro.org wrote:
> > From: Riku Voipio <riku.voipio@linaro.org>
> > 
> > create_package() function tries to resolve used architecture
> > for everry package. Split the setting the architecture to a
> > new function, set_debarch(), called once on startup.
> > 
> > This allows using debarch from other parts of script as
> > needed.
> > 
> > v2: Follow Michals suggestion on setting variables at
> > top scope and also setting the fallback $debarch in the
> > new function
> > 
> > Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> 
> Thanks, applied to kbuild.git#misc. But please base your patches on
> Linus's or the maintainer's tree next time. Your patch had some
> conflicts, because it was based on some non-upstream patches.

thanks, acked.

