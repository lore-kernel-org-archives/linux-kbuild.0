Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-proxy003.phy.lolipop.jp ([157.7.104.44]:56018 "EHLO
        smtp-proxy003.phy.lolipop.jp" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725885AbeIFKnh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Sep 2018 06:43:37 -0400
Subject: Re: [PATCH 08/11] UAPI: sound: Fix use of u32 and co. in UAPI headers
References: <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk>
 <153616293089.23468.13515059526628668970.stgit@warthog.procyon.org.uk>
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Message-ID: <ce6ac597-751c-8881-160d-28d62a898a3e@sakamocchi.jp>
Date: Thu, 6 Sep 2018 14:59:40 +0900
MIME-Version: 1.0
In-Reply-To: <153616293089.23468.13515059526628668970.stgit@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, moderated for non-subscribers <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>

Hi,

On Sep 6 2018 00:55, David Howells wrote:
> Fix the use of u32 and co. in UAPI headers as these are not defined.  Switch
> to using the __u32-style equivalents instead.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jaroslav Kysela <perex@perex.cz>
> cc: Takashi Iwai <tiwai@suse.com>
> cc: alsa-devel@alsa-project.org (moderated for non-subscribers)
> ---
> 
>   include/uapi/sound/skl-tplg-interface.h |  106 ++++++++++++++++---------------
>   1 file changed, 54 insertions(+), 52 deletions(-)

A similar patch was already proposed[1] and has been applied by Mark to
his tree[2]. Your issue (3) is going to be solved soon for v4.19
kernel.

[1] [alsa-devel] [PATCH] uapi: fix sound/skl-tplg-interface.h userspace 
compilation errors
http://mailman.alsa-project.org/pipermail/alsa-devel/2018-August/139392.html
[2] ASoC: uapi: fix sound/skl-tplg-interface.h userspace compilation errors
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/?h=for-4.19


Thanks

Takashi Sakamoto
