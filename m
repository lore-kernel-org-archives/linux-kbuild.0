Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54889 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753775AbaA1KQt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Jan 2014 05:16:49 -0500
Message-ID: <52E7838E.2070503@suse.cz>
Date: Tue, 28 Jan 2014 11:16:46 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH V2 2/3] frv: Remove redundant debugging info flag
References: <cover.1386804405.git.geoff@infradead.org>	 <fb11b985956d286c2cece8a843c2ff6121c0e78a.1386804405.git.geoff@infradead.org> <1390873714.5027.55.camel@smoke>
In-Reply-To: <1390873714.5027.55.camel@smoke>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geoff Levand <geoff@infradead.org>
Cc: linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

On 28.1.2014 02:48, Geoff Levand wrote:
> The generic makefile now sets '-Wa,--gdwarf2' in KBUILD_AFLAGS, so
> this setting is no longer needed in arch makefiles.
> 
> Also remove a commented out addition of a -O1 to KBUILD_CFLAGS, and
> comment text relating to these removed lines.
> 
> Cc: David Howells <dhowells@redhat.com>
> Signed-off-by: Geoff Levand <geoff@infradead.org> for Huawei, Linaro
> ---
> v2: Removed unused CONFIG_DEBUG_INFO conditional and related text comment.

Thanks, I added v2 of 2/3 and 3/3 to kbuild.git#kbuild.

Michal

