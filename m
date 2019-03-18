Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:59100 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726777AbfCRTU6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 15:20:58 -0400
Date: Mon, 18 Mar 2019 15:20:54 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH v2 6/8] modpost: Add modinfo flag to livepatch modules
Message-ID: <20190318192054.GA23203@redhat.com>
References: <20190301141313.15057-1-jmoreira@suse.de>
 <20190301141313.15057-7-jmoreira@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190301141313.15057-7-jmoreira@suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joao Moreira <jmoreira@suse.de>
Cc: live-patching@vger.kernel.org, mbenes@suse.cz, pmladek@suse.cz, jikos@suse.cz, nstange@suse.de, jpoimboe@redhat.com, khlebnikov@yandex-team.ru, jeyu@kernel.org, matz@suse.de, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, michal.lkml@markovi.net

On Fri, Mar 01, 2019 at 11:13:11AM -0300, Joao Moreira wrote:
> From: Miroslav Benes <mbenes@suse.cz>
> 
> Currently, livepatch infrastructure in the kernel relies on
> MODULE_INFO(livepatch, "Y") statement in a livepatch module. Then the
> kernel module loader knows a module is indeed livepatch module and can
> behave accordingly.
> 
> klp-convert, on the other hand relies on LIVEPATCH_* statement in the
> module's Makefile for exactly the same reason.
> 
> Remove dependency on modinfo and generate MODULE_INFO flag
> automatically in modpost when LIVEPATCH_* is defined in the module's
> Makefile. Generate a list of all built livepatch modules based on
> the .livepatch file and store it in (MODVERDIR)/livepatchmods. Give
> this list as an argument for modpost which will use it to identify
> livepatch modules.
> 
> As MODULE_INFO is no longer needed, remove it.
> 
> [jmoreira:
> * fix modpost.c (add_livepatch_flag) to update module structure with
> livepatch flag and prevent modpost from breaking due to unresolved
> symbols]
> 
> Signed-off-by: Miroslav Benes <mbenes@suse.cz>
> Signed-off-by: Joao Moreira <jmoreira@suse.de>
> ---
>  samples/livepatch/livepatch-sample.c |  1 -
>  scripts/Makefile.modpost             |  8 +++-
>  scripts/mod/modpost.c                | 84 +++++++++++++++++++++++++++++++++---
>  3 files changed, 85 insertions(+), 8 deletions(-)
> 
> [ ... snip ... ]

While we're here, we can make the same changes to all the other in-tree
livepatch self-test and sample modules:

  [squash] modpost/livepatch: apply modinfo flag to all in-tree livepatch modules
  https://github.com/torvalds/linux/commit/22c59f05c9618903a946d5f8f79bfa345d31de3c

-- Joe
