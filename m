Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud6.xs4all.net ([194.109.24.28]:49383 "EHLO
        lb2-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751635AbcK1U32 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Nov 2016 15:29:28 -0500
Message-ID: <1480364961.1959.9.camel@tiscali.nl>
Subject: Re: [PATCH] Scripts: kconfig: nconf: fix _GNU_SOURCE redefined
 warning
From: Paul Bolle <pebolle@tiscali.nl>
Date: Mon, 28 Nov 2016 21:29:21 +0100
In-Reply-To: <20161128184639.GB16562@linux-Precision-WorkStation-T5500>
References: <1480264106-29881-1-git-send-email-thrust73@gmail.com>
         <5d8cb4b1-fe87-5daf-432b-d6612196a9fc@suse.cz>
         <20161128184639.GB16562@linux-Precision-WorkStation-T5500>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cheah Kok Cheong <thrust73@gmail.com>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

[Dropped Yann.]

On Tue, 2016-11-29 at 02:46 +0800, Cheah Kok Cheong wrote:
> On Mon, Nov 28, 2016 at 11:39:01AM +0100, Michal Marek wrote:
> > The Makefile does not specify -D_GNU_SOURCE. Are you adding it manually?

On Fedora 24 I'm able to trigger this too:
    $ [...]
    make -f ./scripts/Makefile.build obj=scripts/kconfig nconfig
      gcc -Wp,-MD,scripts/kconfig/.nconf.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89   -D_GNU_SOURCE -DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1 -DLOCALE   -c -o scripts/kconfig/nconf.o scripts/kconfig/nconf.c
    scripts/kconfig/nconf.c:8:0: warning: "_GNU_SOURCE" redefined
     #define _GNU_SOURCE
     
    <command-line>:0:0: note: this is the location of the previous definition

It's probably added by pkg-config:
    $ pkg-config --cflags ncursesw
    -D_GNU_SOURCE

And apparently we call pkg-config in scripts/kconfig/Makefile. Or in
scripts/kconfig/lxdialog/check-lxdialog.sh. Not sure, I didn't yet dive deeper
into this.

Hope this helps,


Paul Bolle
