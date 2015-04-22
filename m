Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46298 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932349AbbDVO2W (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2015 10:28:22 -0400
Date: Wed, 22 Apr 2015 16:28:19 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild/mkspec: Simplify vmlinux.bz2 creation
Message-ID: <20150422142819.GA19277@sepie.suse.cz>
References: <1429394714-9028-1-git-send-email-bp@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1429394714-9028-1-git-send-email-bp@alien8.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Sun, Apr 19, 2015 at 12:05:14AM +0200, Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
> 
> No need for the intermediary vmlinux.orig - bzip2 can keep the original
> files used for compression with --keep.
> 
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Cc: Michal Marek <mmarek@suse.cz>
> Cc: linux-kbuild@vger.kernel.org

Applied to kbuild.git#misc. I will push it after v4.1-rc1 becomes
available, though.

Michal
