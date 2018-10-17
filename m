Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53794 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727053AbeJRBHP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 21:07:15 -0400
Date: Wed, 17 Oct 2018 19:10:34 +0200
From: Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH 2/3] x86/mcelog: Remove one mce_helper definition
Message-ID: <20181017171034.GO22571@zn.tnic>
References: <20181017170554.18841-1-bigeasy@linutronix.de>
 <20181017170554.18841-3-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181017170554.18841-3-bigeasy@linutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, linux-kbuild@vger.kernel.org, Tony Luck <tony.luck@intel.com>, linux-edac <linux-edac@vger.kernel.org>, x86@kernel.org

On Wed, Oct 17, 2018 at 07:05:53PM +0200, Sebastian Andrzej Siewior wrote:
> Commit 5de97c9f6d85f ("x86/mce: Factor out and deprecate the /dev/mcelog
> driver") moved the old interface into one file including mce_helper
> definition as static and "extern".
> 
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Borislav Petkov <bp@suse.de>
> Cc: linux-edac <linux-edac@vger.kernel.org>
> Cc: x86@kernel.org
> Fixes:  5de97c9f6d85f ("x86/mce: Factor out and deprecate the /dev/mcelog driver")

I'm not sure about the Fixes: tag - it'll trigger a flood of backporting
for no reason AFAICT.

-- 
Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imendörffer, Jane Smithard, Graham Norton, HRB 21284 (AG Nürnberg)
