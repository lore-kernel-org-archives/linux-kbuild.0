Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48425 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751902Ab3FZNs5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 26 Jun 2013 09:48:57 -0400
Date: Wed, 26 Jun 2013 15:48:53 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] Revert "kconfig: fix randomising choice entries in
 presence of KCONFIG_ALLCONFIG"
Message-ID: <20130626134852.GA25921@sepie.suse.cz>
References: <20130625205836.GB14074@free.fr>
 <1372196264-3407-1-git-send-email-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1372196264-3407-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>, Sedat Dilek <sedat.dilek@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Alexandre Bounine <alexandre.bounine@idt.com>, Matt Porter <mporter@kernel.crashing.org>

On Tue, Jun 25, 2013 at 11:37:44PM +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> This reverts commit 8357b48549e17b3e4e402c7f977b65708922e60f.
> 
> It breaks more stuff than it fixes.

Thanks, I applied it to kbuild.git#kconfig, after verifying that the
issue is gone.

Michal
