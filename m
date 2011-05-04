Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:51589 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751426Ab1EDUp1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 16:45:27 -0400
Date: Wed, 4 May 2011 22:45:26 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] Replace '-' in kernel version with '_'
Message-ID: <20110504204525.GA13293@sepie.suse.cz>
References: <20110503214543.GA25962@dev1756.snc6.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110503214543.GA25962@dev1756.snc6.facebook.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arun Sharma <asharma@fb.com>
Cc: linux-kbuild@vger.kernel.org

On Tue, May 03, 2011 at 02:45:43PM -0700, Arun Sharma wrote:
> Removing the '-' results in hard to read filenames such as:
> kernel-2.6.35.2000042g76e4caf-28.x86_64.rpm
> 
> kernel-2.6.35.2_000042_g76e4caf-28.x86_64.rpm is easier to
> read.

This makes sense, but please sign off the patch as per
Documentation/SubmittingPatches.

Thanks,
Michal
