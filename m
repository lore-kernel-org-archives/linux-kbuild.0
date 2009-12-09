Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54944 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753687AbZLIMsS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Dec 2009 07:48:18 -0500
Message-ID: <4B1F9C5D.6000902@suse.cz>
Date: Wed, 09 Dec 2009 13:47:25 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] gen_init_cpio: fixed fwrite warning
References: <1260359719-15744-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1260359719-15744-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

On 9.12.2009 12:55, Mike Frysinger wrote:
> On compilers with security warnings enabled by default, we get:
> 
> usr/gen_init_cpio.c: In function ‘cpio_mkfile’:
> usr/gen_init_cpio.c:357: warning: ignoring return value of ‘fwrite’,
>                                   declared with attribute warn_unused_result
> 
> So check the return value and handle errors accordingly.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Applied, thanks.

Michal
