Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45720 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757248AbcK2NFS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Nov 2016 08:05:18 -0500
Date: Tue, 29 Nov 2016 14:05:08 +0100
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH] Scripts: kconfig: nconf: fix _GNU_SOURCE redefined
 warning
Message-ID: <20161129130508.GA16422@sepie.suse.cz>
References: <1480264106-29881-1-git-send-email-thrust73@gmail.com>
 <5d8cb4b1-fe87-5daf-432b-d6612196a9fc@suse.cz>
 <20161128184639.GB16562@linux-Precision-WorkStation-T5500>
 <1480364961.1959.9.camel@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480364961.1959.9.camel@tiscali.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Cheah Kok Cheong <thrust73@gmail.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 28, 2016 at 09:29:21PM +0100, Paul Bolle wrote:
> [Dropped Yann.]
> 
> On Tue, 2016-11-29 at 02:46 +0800, Cheah Kok Cheong wrote:
> > On Mon, Nov 28, 2016 at 11:39:01AM +0100, Michal Marek wrote:
> > > The Makefile does not specify -D_GNU_SOURCE. Are you adding it manually?
> 
> On Fedora 24 I'm able to trigger this too:
>     $ [...]
>     make -f ./scripts/Makefile.build obj=scripts/kconfig nconfig
>       gcc -Wp,-MD,scripts/kconfig/.nconf.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89   -D_GNU_SOURCE -DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1 -DLOCALE   -c -o scripts/kconfig/nconf.o scripts/kconfig/nconf.c
>     scripts/kconfig/nconf.c:8:0: warning: "_GNU_SOURCE" redefined
>      #define _GNU_SOURCE
>      
>     <command-line>:0:0: note: this is the location of the previous definition
> 
> It's probably added by pkg-config:
>     $ pkg-config --cflags ncursesw
>     -D_GNU_SOURCE

I see. That's not nice of the pkconfig file to set such macro, but oh
well. I applied the patch to kbuild.git#kconfig now, thanks Cheah.

Michal
