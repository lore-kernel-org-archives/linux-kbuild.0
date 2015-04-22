Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47236 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933789AbbDVOpk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2015 10:45:40 -0400
Message-ID: <5537B412.1000109@suse.cz>
Date: Wed, 22 Apr 2015 16:45:38 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] deb-pkg: v2: move setting debarch for a separate function
References: <552E59D9.7060101@suse.cz> <1429191766-13385-1-git-send-email-riku.voipio@linaro.org>
In-Reply-To: <1429191766-13385-1-git-send-email-riku.voipio@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org

On 2015-04-16 15:42, riku.voipio@linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
> 
> create_package() function tries to resolve used architecture
> for everry package. Split the setting the architecture to a
> new function, set_debarch(), called once on startup.
> 
> This allows using debarch from other parts of script as
> needed.
> 
> v2: Follow Michals suggestion on setting variables at
> top scope and also setting the fallback $debarch in the
> new function
> 
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>

Thanks, applied to kbuild.git#misc. But please base your patches on
Linus's or the maintainer's tree next time. Your patch had some
conflicts, because it was based on some non-upstream patches.

Michal
