Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59038 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750983Ab2LTWUP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Dec 2012 17:20:15 -0500
Date: Thu, 20 Dec 2012 23:20:14 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 1/3] scripts/kconfig: ensure we use proper CONFIG_
	prefix
Message-ID: <20121220222014.GA24788@pobox.suse.cz>
References: <1353542766-24422-1-git-send-email-yann.morin.1998@free.fr> <1353542766-24422-2-git-send-email-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1353542766-24422-2-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

On Thu, Nov 22, 2012 at 01:06:04AM +0100, Yann E. MORIN wrote:
> Now that we get the CONFIG_ prefix from the environment, we must
> ensure we use the proper prefix in case the user has it set in
> the environment.
> 
> Simply unexport CONFIG_ to fallback to our hard-coded default.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Sorry for the delay. I applied this patch, so that the $CONFIG_ patches
do not cause any breakage in 3.8-rc1. We can discuss later if / how to
change it to use some Kconfig syntax instead.

Michal
