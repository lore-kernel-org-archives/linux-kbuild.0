Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43430 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725819AbeIFMvv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Sep 2018 08:51:51 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ce6ac597-751c-8881-160d-28d62a898a3e@sakamocchi.jp>
References: <ce6ac597-751c-8881-160d-28d62a898a3e@sakamocchi.jp> <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk> <153616293089.23468.13515059526628668970.stgit@warthog.procyon.org.uk>
Subject: Re: [PATCH 08/11] UAPI: sound: Fix use of u32 and co. in UAPI headers
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <21301.1536221853.1@warthog.procyon.org.uk>
Date: Thu, 06 Sep 2018 09:17:33 +0100
Message-ID: <21302.1536221853@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: dhowells@redhat.com, linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, moderated for non-subscribers <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>

Takashi Sakamoto <o-takashi@sakamocchi.jp> wrote:

> A similar patch was already proposed[1] and has been applied by Mark to
> his tree[2]. Your issue (3) is going to be solved soon for v4.19
> kernel.

Thanks, I've pulled the branch leading up to that commit into the base of
mine.  It seems the changes were identical:-)

David
