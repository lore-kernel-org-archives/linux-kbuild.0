Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:46042 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755149Ab3D0Pih (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 27 Apr 2013 11:38:37 -0400
Received: by mail-wi0-f175.google.com with SMTP id h11so1524107wiv.2
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Apr 2013 08:38:36 -0700 (PDT)
Date: Sat, 27 Apr 2013 17:38:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
Message-ID: <20130427153833.GC3355@free.fr>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1304261459030.17575@oneiric>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Robert, All,

On Fri, Apr 26, 2013 at 03:05:02PM -0400, Robert P. J. Day wrote:
>   probably a simple explanation for this, but my first time playing
> with "make localmodconfig" and it appears to be tossing all my
> ath9k-related module settings.
> 
>   currently running ubuntu on a 64-bit asus laptop with the following
> ath9k-related modules:
> 
> $ lsmod | grep ath9k
> ath9k                 149545  0
> mac80211              558577  1 ath9k
> ath9k_common           14054  1 ath9k
> ath9k_hw              408874  2 ath9k,ath9k_common
> ath                    23828  3 ath9k,ath9k_common,ath9k_hw
> cfg80211              211955  3 ath9k,mac80211,ath
> $
> 
>   starting with current kernel "git pull", i do:
> 
> $ make allmodconfig
> 
> at which point i get:
> 
> $ grep ATH9K .config
> CONFIG_ATH9K_HW=m
> CONFIG_ATH9K_COMMON=m
> CONFIG_ATH9K_DFS_DEBUGFS=y
> CONFIG_ATH9K_BTCOEX_SUPPORT=y
> CONFIG_ATH9K=m
> CONFIG_ATH9K_PCI=y
> CONFIG_ATH9K_AHB=y
> CONFIG_ATH9K_DEBUGFS=y
> CONFIG_ATH9K_DFS_CERTIFIED=y
> CONFIG_ATH9K_MAC_DEBUG=y
> CONFIG_ATH9K_RATE_CONTROL=y
> CONFIG_ATH9K_HTC=m
> CONFIG_ATH9K_HTC_DEBUGFS=y
> $
> 
> which looks reasonable(?).  then run:
> 
> $ make localmodconfig
> 
> have to answer maybe 4 questions manually, at which point i have:
> 
> $ grep ATH9K .config

Can you send the output of your lsmod, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
