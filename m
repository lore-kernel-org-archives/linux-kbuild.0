Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48356 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754492Ab3H1PL3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Aug 2013 11:11:29 -0400
Message-ID: <521E131E.6060503@suse.cz>
Date: Wed, 28 Aug 2013 17:11:26 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: Do not overwrite include/config/kernel.release
 needlessly
References: <1377611624-11570-1-git-send-email-mmarek@suse.cz>
In-Reply-To: <1377611624-11570-1-git-send-email-mmarek@suse.cz>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 27.8.2013 15:53, Michal Marek wrote:
> Use filechk to detect if the content changed or not.
> 
> Signed-off-by: Michal Marek <mmarek@suse.cz>
> ---
>  Makefile | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

I merged this to kbuild.git#kbuild now.

Thanks,
Michal

