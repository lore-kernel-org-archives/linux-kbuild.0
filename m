Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33275 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751040AbcHYSMZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Aug 2016 14:12:25 -0400
Subject: Re: [PATCH] kbuild: genksyms fix for typeof handling
References: <20160825095308.23937-1-npiggin@gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <bcb02058-63e3-832a-f8a9-b6eafbc5d9c9@suse.com>
Date: Thu, 25 Aug 2016 20:11:52 +0200
MIME-Version: 1.0
In-Reply-To: <20160825095308.23937-1-npiggin@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org
Cc: Jan Beulich <jbeulich@suse.com>

On 2016-08-25 11:53, Nicholas Piggin wrote:
> The tokenizer misses counting an open-parenthesis when parsing a
> non-trivial typeof beginning with an open-parenthesis. This function
> in include/linux/ceph/libceph.h
> 
> static type *lookup_##name(struct rb_root *root,
>                            typeof(((type *)0)->keyfld) key)
> 
> When instantiated in net/ceph/mon_client.c, causes subsequent symbols
> including an EXPORT_SYMBOL in that file to be lost.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Thanks, applied to kbuild.git#kbuild.

Michal

