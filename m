Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yk0-f170.google.com ([209.85.160.170]:34524 "EHLO
	mail-yk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754980AbbJ1Aqn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 20:46:43 -0400
Received: by ykdr3 with SMTP id r3so237432164ykd.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2015 17:46:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1445992931-28107-1-git-send-email-olof@lixom.net>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
Date: Wed, 28 Oct 2015 09:46:42 +0900
Message-ID: <CAOesGMhiOu5Pkf_-tot-4rvGOGOMmKiGgWQheGhQKTXptu977Q@mail.gmail.com>
Subject: Re: [PATCH 00/10] merge_config misc reworks and testcases
From: Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@linux.intel.com>

On Wed, Oct 28, 2015 at 9:42 AM, Olof Johansson <olof@lixom.net> wrote:
> Hi,
>
> Somewhat wide distribution list here, since I've added everyone who's
> touched the script, with the presumption that those have been the major
> users of it. Please make sure none of these changes break your use cases.

Actually, I dropped a handful of cc:s on this repost, so this isn't
necessarily true. Also, since Yann didn't respond on the last posting
I'm sending these to you now, Michal. :)

Hopefully Darren, who seems to be one of the major users of
merge_config, can ack these if they pass in his environment.


-Olof
