Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:38648 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754403AbcK1KjE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Nov 2016 05:39:04 -0500
Subject: Re: [PATCH] Scripts: kconfig: nconf: fix _GNU_SOURCE redefined
 warning
References: <1480264106-29881-1-git-send-email-thrust73@gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <5d8cb4b1-fe87-5daf-432b-d6612196a9fc@suse.cz>
Date: Mon, 28 Nov 2016 11:39:01 +0100
MIME-Version: 1.0
In-Reply-To: <1480264106-29881-1-git-send-email-thrust73@gmail.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cheah Kok Cheong <thrust73@gmail.com>
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 27.11.2016 v 17:28 Cheah Kok Cheong napsal(a):
> Fix below warning when make nconfig is run initially
> or after make clean.
> 
>   HOSTCC  scripts/kconfig/nconf.o
> scripts/kconfig/nconf.c:8:0: warning: "_GNU_SOURCE" redefined
>  #define _GNU_SOURCE
>  ^
> <command-line>:0:0: note: this is the location of the previous definition

The Makefile does not specify -D_GNU_SOURCE. Are you adding it manually?

Thanks,
Michal
