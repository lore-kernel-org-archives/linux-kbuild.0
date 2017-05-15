Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:51388 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933836AbdEOSA3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 May 2017 14:00:29 -0400
Subject: Re: sparse on scripts/kconfig/*.c
References: <fa98e27a-c08d-170f-68d1-2ab2918ef5d1@infradead.org>
 <20170510101838.c5nwzaraeybyypwj@mwanda>
 <20170510205357.xshdaack6mwku5np@mwanda>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <605fc799-70c1-14af-904d-723b43ab9025@infradead.org>
Date: Mon, 15 May 2017 11:00:22 -0700
MIME-Version: 1.0
In-Reply-To: <20170510205357.xshdaack6mwku5np@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, smatch@vger.kernel.org

On 05/10/17 13:53, Dan Carpenter wrote:
> I have created some new tools to make this process easier.
> 
> 1) First you still have to edit the Makefile:
> 
> -HOSTCC       = gcc
> +HOSTCC       = ~/progs/smatch/devel/cgcc
> 
> 2) Build the data with this command:
> 
> 	~/progs/smatch/devel/smatch_scripts/build_generic_data.sh --target scripts/
> 
> The --target scripts/ is because we want to run smatch on the scripts/
> directory.
> 
> 3) Run smatch:
> 
> 	~/progs/smatch/devel/smatch_scripts/test_generic.sh --target scripts/
> 
> I just wrote this code today so it might be a bit rough perhaps.  Let me
> know if you have any issues.  It doesn't find anything like I said
> before, but hopefully this can help other people who want to run Smatch
> on user space code.

Thanks, Dan.

I get this when running build_generic_data.sh:

readline() on closed filehandle FILE at /home/rdunlap/projects/smatch/smatch_scripts/../smatch_data/db/fill_db_caller_info.pl line 33.

I see scripts/mod/* being built/checked ... but not scripts/kconfig/*.

Any ideas?


-- 
~Randy
