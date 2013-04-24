Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:55282 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756264Ab3DXR4z (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 24 Apr 2013 13:56:55 -0400
Received: by mail-wi0-f177.google.com with SMTP id hj19so2375455wib.16
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Apr 2013 10:56:54 -0700 (PDT)
Date: Wed, 24 Apr 2013 19:56:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 5/6] kconfig: implement KCONFIG_PROBABILITY for randconfig
Message-ID: <20130424175648.GA24710@free.fr>
References: <cover.1366665921.git.yann.morin.1998@free.fr>
 <e5fafd7ae13357e3d5cc604c89022982022a8909.1366665922.git.yann.morin.1998@free.fr>
 <20130423215044.GA20111@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130423215044.GA20111@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Peter Korsgaard <jacmet@uclibc.org>

Michal, All,

On Tue, Apr 23, 2013 at 11:50:44PM +0200, Yann E. MORIN wrote:
> On Mon, Apr 22, 2013 at 11:31:24PM +0200, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Introduce a KCONFIG_PROBABILITY environment variable to tweak the
> > probability between 0 (all options off) and 100 (all options on).
> 
> Please, drop this patch: randconfig is utterly broken is a very subtle
> way (even without this patch applied), which I still have to track down,
> and I'm not confident I can find and properly fis it before the end of
[--SNIP--]
> More on this later. For now, just drop this probability patch. The other
> patches are still good for 3.10.

Michal, I have something interesting now that I'm testing. If you did
not already apply the rest of the series, just hold-on just a bit more,
I'll re-spin a new version of the series later tonight.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
