Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:50240 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751892AbZLNXlj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Dec 2009 18:41:39 -0500
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] modpost: fix segfault with short symbol names
Date: Tue, 15 Dec 2009 10:11:23 +1030
References: <1260615744-23165-1-git-send-email-mmarek@suse.cz>
In-Reply-To: <1260615744-23165-1-git-send-email-mmarek@suse.cz>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200912151011.26537.rusty@rustcorp.com.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernek@vger.kernel.org

On Sat, 12 Dec 2009 09:32:24 pm Michal Marek wrote:
> memcmp() is wrong here, the symbol name can be shorter than KSYMTAB_PFX
> or CRC_PFX.
> 
> Signed-off-by: Michal Marek <mmarek@suse.cz>

Thanks, applied.

Rusty.
