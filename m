Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:56883 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759240Ab3DIMDA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Apr 2013 08:03:00 -0400
Received: by mail-we0-f170.google.com with SMTP id z2so5417687wey.29
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Apr 2013 05:02:59 -0700 (PDT)
Date: Tue, 9 Apr 2013 14:02:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] kconfig: do randomise choice entries in presence of
 KCONFIG_ALLCONFIG
Message-ID: <20130409120254.GA6418@free.fr>
References: <20130227214102.6d63544d@skate>
 <1362931313-31829-1-git-send-email-yann.morin.1998@free.fr>
 <20130408115235.GA7741@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130408115235.GA7741@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Arnaud Lacombe <lacombar@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

On Mon, Apr 08, 2013 at 01:52:35PM +0200, Yann E. MORIN wrote:
> On Sun, Mar 10, 2013 at 05:01:53PM +0100, Yann E. MORIN wrote:
> > Currently, randconfig does randomise choice entries, unless KCONFIG_ALLCONFIG
> > is specified.
[--SNIP--]
> Although this patch does fix the suggested test-case, there are more
> complex situations where this patch is not enough. (I need to shrink down
> the currently failing Kconfig file to the smallest possible test-case).

Here is a newer, worse test-case (with my patch applied ontop Michal's
kbuild/kconfig tree):

---8<--- config.in
    config A
        bool "A"
    
    if A
    choice
        bool "B/C"
    config B
        bool "B"
    config C
        bool "C"
    endchoice
    endif # A
    
    if B
    choice
        bool "D/E"
    config D
        bool "D"
    config E
        bool "E"
    endchoice
    endif # B
---8<---

With an empty './defconfig' file:
    KCONFIG_ALLCONFIG=defconfig conf --randconfig config.in
will sometime emit a .config with *both* B=y and C=y although they are
mutually exclusive, being in a choice block.

However, if the two choices are inverted:

---8<--- config.in
    config A
        bool "A"
    
    if B
    choice
        bool "D/E"
    config D
        bool "D"
    config E
        bool "E"
    endchoice
    endif # B
    
    if A
    choice
        bool "B/C"
    config B
        bool "B"
    config C
        bool "C"
    endchoice
    endif # A
---8<---

Then --randconfig will properly randomise *both* choices!

Note: if my patch is not applied, then only B will ever be selected, and
C will never be.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
