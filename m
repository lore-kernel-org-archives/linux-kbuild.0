Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:55284 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752478Ab0KYP1V (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Nov 2010 10:27:21 -0500
Date: Thu, 25 Nov 2010 16:27:20 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] scripts/genksyms: fix header usage
Message-ID: <20101125152719.GC9418@sepie.suse.cz>
References: <1289259113-16758-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1289259113-16758-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Mon, Nov 08, 2010 at 06:31:53PM -0500, Arnaud Lacombe wrote:
> FreeBSD does not like <malloc.h> when __STDC__ is defined, use the standard
> <stdlib.h> instead.
> 
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/genksyms/parse.c_shipped |    2 +-
>  scripts/genksyms/parse.y         |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to kbuild-2.6.git#kbuild, thanks.

Michal
