Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39002 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751986AbcLKKwK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Dec 2016 05:52:10 -0500
Date: Sun, 11 Dec 2016 11:52:07 +0100
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH] kbuild: cmd_export_list: tighten the sed script
Message-ID: <20161211105207.GB30135@sepie.suse.cz>
References: <alpine.LFD.2.20.1611161924280.22196@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1611161924280.22196@knanqh.ubzr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Nov 16, 2016 at 07:28:39PM -0500, Nicolas Pitre wrote:
> 
> When LTO is used, some ___ksymtab_string sections are seen by this sed
> script, creating lines containing a single ) such as:
> 
> EXPORT(foo)
> )
> )
> EXPORT(bar)
> 
> Let's make it so the + character is also required for any line to be
> printed.
> 
> Signed-off-by: Nicolas Pitre <nico@linaro.org>

Applied to kbuild.git#kbuild.

Michal
