Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat.scz.novell.com ([213.151.88.252]:34670 "EHLO pobox.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751691Ab0LOWr2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 17:47:28 -0500
Date: Wed, 15 Dec 2010 23:47:26 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 2/5] kconfig: add more S_INT and S_HEX consistency
	checks
Message-ID: <20101215224726.GB21436@pobox.suse.cz>
References: <1291530566-23531-1-git-send-email-lacombar@gmail.com> <1291530566-23531-2-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1291530566-23531-2-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Sun, Dec 05, 2010 at 01:29:25AM -0500, Arnaud Lacombe wrote:
> This patch add more number consistency checkg, trying to catch the following
> situation:
> 
> config FOO0
> 	hex
> 	default 42
> 
> config FOO1
> 	string
> 
> config BAR0
> 	int
> 	default FOO1
> 
> config BAR1
> 	hex
> 	default FOO1
> 
> config FOO2
> 	hex
> 	default 42h
> 
> config FOO3
> 	int
> 	default "1bar"
> 
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/menu.c |   15 ++++++++++++---
>  1 files changed, 12 insertions(+), 3 deletions(-)

Thanks, applied to kbuild-2.6.git#kconfig.

Michal
