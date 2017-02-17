Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outbound1.eu.mailhop.org ([52.28.251.132]:37113 "EHLO
        outbound1.eu.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934148AbdBQOOW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Feb 2017 09:14:22 -0500
Date: Fri, 17 Feb 2017 13:58:10 +0000
From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] scripts: objdiff: Ignore debug info when comparing
Message-ID: <20170217135810.GJ25924@io.lakedaemon.net>
References: <20170216211820.4337-1-stephen.boyd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170216211820.4337-1-stephen.boyd@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.m@jp.panasonic.com>

Hi Stephen,

On Thu, Feb 16, 2017 at 01:18:20PM -0800, Stephen Boyd wrote:
> If the kernel is configured to be built with debug symbols, or
> has bug tables, comparing files may not work if line numbers
> change. This makes comparing object files with these options
> harder to do. Let's strip out the debug info and drop the
> __bug_table here so that we don't see false positives. There may
> be other things to drop later, and it may be architecture
> specific, but this works for me with my ARM64 build.
> 
> Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>

Reviewed-by: Jason Cooper <jason@lakedaemon.net>

I'm glad it's useful!

thx,

Jason.
