Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:61976 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751219Ab3D0Rmb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 27 Apr 2013 13:42:31 -0400
Received: by mail-wi0-f171.google.com with SMTP id l13so1578448wie.10
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Apr 2013 10:42:30 -0700 (PDT)
Date: Sat, 27 Apr 2013 19:42:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
Message-ID: <20130427174226.GA25088@free.fr>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric>
 <20130427153833.GC3355@free.fr>
 <alpine.DEB.2.02.1304271325240.12586@oneiric>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1304271325240.12586@oneiric>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Robert, All,

On Sat, Apr 27, 2013 at 01:30:34PM -0400, Robert P. J. Day wrote:
>   to recap, current status of kernel source:
> 
> $ git show
> commit d7d7271f421f1e45289f2a737c7f636c02c673ce
> Merge: 96edcf3 c95789e
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Fri Apr 26 08:17:07 2013 -0700
> ...
> 
>   next:
> 
> $ make distclean
> 
>   next:
> 
> $ make allmodconfig
> 
>   next:
> 
> $ make localmodconfig
> 
>   at which time i get asked four questions that i respond to manually:
> 
> User namespace (USER_NS) [N/y/?] (NEW)
> Require conversions between uid/gids and their internal representation (UIDGID_STRICT_TYPE_CHECKS) [N/y/?] (NEW)
> BT8XX GPIO abuser (GPIO_BT8XX) [N/m/y/?] (NEW)
> EVM support (EVM) [N/y/?] (NEW)
> 
> for which i simply hit ENTER each time, and no errors. *however*, if i
> run "make localmodconfig" a second time (which theoretically should be
> acceptable, correct?), that's when i get:
> 
> $ make localmodconfig
> using config: '.config'
> WARNING: ATH9K_HW is required, but nothing in the
>   current config selects it.
> WARNING: ATH_COMMON is required, but nothing in the
>   current config selects it.
> WARNING: ATH9K_COMMON is required, but nothing in the
>   current config selects it.
> module ath9k did not have configs CONFIG_ATH9K
> module ath did not have configs CONFIG_ATH_COMMON
> module ath9k_hw did not have configs CONFIG_ATH9K_HW
> module ath9k_common did not have configs CONFIG_ATH9K_COMMON
> #
> # configuration written to .config
> #
> $
> 
>   i assume it should be easy for someone else to reproduce this, but
> if you want me to do any more testing later this afternoon, let me
> know.

I've bisected v3.7 (good) to v3.8 (already bad) with your lsmod, and
using this script:
    #!/bin/bash
    set -e
    git clean -dX
    git clean -d
    make allmodconfig
    make LSMOD=/home/ymorin/r.pj.day.lsmod localmodconfig
    grep ATH9K .config

(and manually answering the few new questions), and it turned up the
following cset as the culprit:
    23c1d7f: wireless: allow Atheros card to not depend on ath.ko

Not sure where to go from there... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
