Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46999 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752362Ab1ANXn6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jan 2011 18:43:58 -0500
Date: Sat, 15 Jan 2011 00:43:57 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] deb-pkg: Use $SRCARCH for include path
Message-ID: <20110114234356.GB27291@sepie.suse.cz>
References: <1294929260-9511-1-git-send-email-max@stro.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1294929260-9511-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org

On Thu, Jan 13, 2011 at 03:34:20PM +0100, maximilian attems wrote:
> Fix x86 centric path to allow building kernel-header packages for
> other architecture.
> 
> Thanks: Michal Marek <mmarek@suse.cz>
> Signed-off-by: maximilian attems <max@stro.at>

Thanks, applied to kbuild-2.6.git#packaging.

Michal
