Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:56534 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751416Ab2LTW13 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Dec 2012 17:27:29 -0500
Received: by mail-we0-f181.google.com with SMTP id t11so1845738wey.12
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Dec 2012 14:27:28 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 1/3] scripts/kconfig: ensure we use proper CONFIG_ prefix
Date: Thu, 20 Dec 2012 23:27:25 +0100
References: <1353542766-24422-1-git-send-email-yann.morin.1998@free.fr> <1353542766-24422-2-git-send-email-yann.morin.1998@free.fr> <20121220222014.GA24788@pobox.suse.cz>
In-Reply-To: <20121220222014.GA24788@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201212202327.25128.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Michal, All,

On Thursday 20 December 2012 Michal Marek wrote:
> On Thu, Nov 22, 2012 at 01:06:04AM +0100, Yann E. MORIN wrote:
> > Now that we get the CONFIG_ prefix from the environment, we must
> > ensure we use the proper prefix in case the user has it set in
> > the environment.
> > 
> > Simply unexport CONFIG_ to fallback to our hard-coded default.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Sorry for the delay. I applied this patch, so that the $CONFIG_ patches
> do not cause any breakage in 3.8-rc1. We can discuss later if / how to
> change it to use some Kconfig syntax instead.

Ok, no problem! :-)

Of course, you can then forget about the first patch in the pull-request
I sent a few minutes ago. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

