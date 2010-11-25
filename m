Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41027 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752045Ab0KYOlF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Nov 2010 09:41:05 -0500
Date: Thu, 25 Nov 2010 15:41:03 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: document UTS_MACHINE environment variable
Message-ID: <20101125144103.GD8192@sepie.suse.cz>
References: <1288877651-7378-1-git-send-email-asbjorn@asbjorn.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1288877651-7378-1-git-send-email-asbjorn@asbjorn.biz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Asbjoern Sloth Toennesen <asbjorn@asbjorn.biz>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 04, 2010 at 01:34:11PM +0000, Asbjoern Sloth Toennesen wrote:
> Add UTS_MACHINE to the documentation of kbuild enviroment variables.
> Description contributed by Michal Marek.
> 
> LKML-Reference: <4CD2A8BC.3010500@suse.cz>
> Signed-off-by: Asbjoern Sloth Toennesen <asbjorn@asbjorn.biz>
> ---
>  Documentation/kbuild/kbuild.txt |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)

This is an internal kbuild variable, while the file lists variables that
are set by the user from outside. There is already a comment in the
Makefile, which is enough IMO.

Michal
