Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:58873 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934795Ab3DHLwl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Apr 2013 07:52:41 -0400
Received: by mail-we0-f182.google.com with SMTP id k14so4488377wer.13
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Apr 2013 04:52:40 -0700 (PDT)
Date: Mon, 8 Apr 2013 13:52:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] kconfig: do randomise choice entries in presence of
 KCONFIG_ALLCONFIG
Message-ID: <20130408115235.GA7741@free.fr>
References: <20130227214102.6d63544d@skate>
 <1362931313-31829-1-git-send-email-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1362931313-31829-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Arnaud Lacombe <lacombar@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

On Sun, Mar 10, 2013 at 05:01:53PM +0100, Yann E. MORIN wrote:
> Currently, randconfig does randomise choice entries, unless KCONFIG_ALLCONFIG
> is specified.
[--SNIP--]

Ping?

Although this patch does fix the suggested test-case, there are more
complex situations where this patch is not enough. (I need to shrink down
the currently failing Kconfig file to the smallest possible test-case).

We really need some people with more insight in the kconfig code-base to
help us on this subject, at least by reviewing this patch and confirm
we're heading in the right direction.

Regards,
Yann E. MORIN.

PS. Sorry if I missed any reply, I've had some mail churning the past
    two weeks.
YEM.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
