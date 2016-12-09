Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:34644 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752829AbcLIC4b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Dec 2016 21:56:31 -0500
Date: Fri, 9 Dec 2016 11:56:37 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [regression ?] kbuild: fix building bzImage with
 CONFIG_TRIM_UNUSED_KSYMS enabled
Message-ID: <20161209025637.GC4661@jagdpanzerIV.localdomain>
References: <20161209024357.GB4661@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161209024357.GB4661@jagdpanzerIV.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Nicolas Pitre <nico@linaro.org>, Jarod Wilson <jarod@redhat.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On (12/09/16 11:43), Sergey Senozhatsky wrote:
> 
> after 53924022d8a ("kbuild: fix building bzImage withCONFIG_TRIM_UNUSED_KSYMS
> enabled") all of my build scripts build the kernel without the modules.

[..]
> +# For the kernel to actually contain only the needed exported symbols,
> +# we have to build modules as well to determine what those symbols are.
> +# (this can be evaluated only once include/config/auto.conf has been included)
					^^^^^

ah, the config. so the patch is wrong.

	-ss
