Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:38747 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751686AbcLKVhg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Dec 2016 16:37:36 -0500
Date: Sun, 11 Dec 2016 22:37:29 +0100
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH] kbuild: fix scripts/adjust_autoksyms.sh* for the no
 modules case
Message-ID: <20161211213729.GC3812@sepie.suse.cz>
References: <alpine.LFD.2.20.1612081410570.1657@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1612081410570.1657@knanqh.ubzr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-kbuild@vger.kernel.org

On Thu, Dec 08, 2016 at 02:17:03PM -0500, Nicolas Pitre wrote:
> When CONFIG_TRIM_UNUSED_KSYMS=y and no modules are actually selected,
> the adjust_autoksyms.sh script fails with:
> 
> sed: can't read .tmp_versions/*.mod: No such file or directory
> 
> Let's cope with that case gracefully.
> 
> Signed-off-by: Nicolas Pitre <nico@linaro.org>

Applied to kbuild.git#kbuild.

Michal
