Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57850 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727859AbgELHhP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 03:37:15 -0400
Date: Tue, 12 May 2020 09:37:10 +0200
From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] firmware/dmi: Report DMI Bios & EC firmware release
Message-ID: <20200512093710.74fd1dd5@endymion>
In-Reply-To: <CAL2Jzuw8K-p11kZ1DdcVtTn76GE-Y+nr-=UM86DJAiUGSNh6zg@mail.gmail.com>
References: <20200207083550.360461-1-e.velu@criteo.com>
        <20200211142112.649d7237@endymion>
        <ba5b88c9-f056-9375-d1fb-7832c76db29f@criteo.com>
        <CAL2Jzuw8K-p11kZ1DdcVtTn76GE-Y+nr-=UM86DJAiUGSNh6zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Erwan Velu <erwanaliasr1@gmail.com>
Cc: Erwan Velu <e.velu@criteo.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Mattias Jacobsson <2pi@mok.nu>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, "Darren Hart (VMware)" <dvhart@infradead.org>, Changbin Du <changbin.du@intel.com>, Russell King <rmk+kernel@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

Hi Erwan,

On Mon, 11 May 2020 19:10:52 +0200, Erwan Velu wrote:
> Jean, I don't see my patches in the 5.7-rc series.
> Is there anything wrong with them ?

Nothing wrong with your patch, but unfortunately I missed the merge
window and sent my pull request a few days too late, so it was not
accepted. Your patch is still in my pending queue:

http://jdelvare.nerim.net/devel/linux/jdelvare-dmi/

and therefore included in every linux-next snapshot, but it won't be
merged in v5.7, you'll have to wait for v5.8.

This is entirely my fault and I am sorry about that.

-- 
Jean Delvare
SUSE L3 Support
