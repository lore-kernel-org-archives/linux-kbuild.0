Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41890 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754115AbcIEGi1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Sep 2016 02:38:27 -0400
Subject: Re: [PATCH] kbuild/builddeb: Fix !CONFIG_GCC_PLUGINS build
References: <1472932730-1098-1-git-send-email-bp@alien8.de>
From: Michal Marek <mmarek@suse.com>
Message-ID: <57CD12D5.8040305@suse.com>
Date: Mon, 5 Sep 2016 08:38:13 +0200
MIME-Version: 1.0
In-Reply-To: <1472932730-1098-1-git-send-email-bp@alien8.de>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Emese Revfy <re.emese@gmail.com>

Dne 3.9.2016 v 21:58 Borislav Petkov napsal(a):
> From: Borislav Petkov <bp@suse.de>
> 
> When building a bindeb-pkg target into an object output dir, i.e., O=, I
> get:
> 
>   find: `scripts/gcc-plugins': No such file or directory
>   /mnt/kernel/kernel/linux-2.6/scripts/package/Makefile:97: recipe for target 'bindeb-pkg' failed
>   make[3]: *** [bindeb-pkg] Error 1
>   /mnt/kernel/kernel/linux-2.6/Makefile:1310: recipe for target 'bindeb-pkg' failed
>   ...
> 
> Check whether CONFIG_GCC_PLUGINS is enabled before collecting .so plugin
> names.

A fix has already been submitted by Kees Cook. I took your patch as a
reminder to submit my rc-fixes branch to Linus :).

Thanks,
Michal

