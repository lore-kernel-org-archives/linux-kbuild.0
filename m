Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36014 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755488Ab1EDVI1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 17:08:27 -0400
Date: Wed, 4 May 2011 23:08:25 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] Replace '-' in kernel version with '_'
Message-ID: <20110504210825.GC13293@sepie.suse.cz>
References: <20110504204811.GA1803@dev1756.snc6.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110504204811.GA1803@dev1756.snc6.facebook.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arun Sharma <asharma@fb.com>
Cc: linux-kbuild@vger.kernel.org

On Wed, May 04, 2011 at 01:48:11PM -0700, Arun Sharma wrote:
> Removing the '-' results in hard to read filenames such as:
> kernel-2.6.35.2000042g76e4caf-28.x86_64.rpm
> 
> kernel-2.6.35.2_000042_g76e4caf-28.x86_64.rpm is easier to
> read.
> 
> Signed-off-by: Arun Sharma <asharma@fb.com>

Pushed to kbuild-2.6.git#packaging, thanks.

Michal
