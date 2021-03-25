Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F380C433C1
	for <linux-kbuild@archiver.kernel.org>; Thu, 25 Mar 2021 13:51:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0575861A1E
	for <linux-kbuild@archiver.kernel.org>; Thu, 25 Mar 2021 13:51:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhCYNut (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 25 Mar 2021 09:50:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:58458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230095AbhCYNum (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 09:50:42 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 74D9B61A1A;
        Thu, 25 Mar 2021 13:50:41 +0000 (UTC)
Date:   Thu, 25 Mar 2021 09:50:39 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "John (Warthog9) Hawley" <warthog9@kernel.org>
Subject: Re: [PATCH 2/2] streamline_config.pl: Add softtabstop=4 for vim
 users
Message-ID: <20210325095039.7202d675@gandalf.local.home>
In-Reply-To: <CAK7LNAQ4uRB+9M4h0KVwEQUnX1XZrsE30KP_pqJqYjF2FcsHZA@mail.gmail.com>
References: <20210322213806.089334551@goodmis.org>
        <20210322214032.293992979@goodmis.org>
        <CAK7LNAQh=zKVTwup5Kh39oTnVEUNotX-Ce7_+2uRO1GNVOaDbw@mail.gmail.com>
        <20210324095417.49c6377b@gandalf.local.home>
        <CAK7LNAQ4uRB+9M4h0KVwEQUnX1XZrsE30KP_pqJqYjF2FcsHZA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 25 Mar 2021 15:20:13 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> 
> The root cause of inconsistency is that
> you mix up space-indentation and tab-indentation.
> I do not know if it is a standard way either.

This is the default way emacs has edited perl files for as long as I can
remember (back to 1996). It became my standard of editing perl files just
because of that. For everything else, I use tabs.

> 
> For example, scripts/checkpatch.pl uses only tabs,
> which I think is more robust.

Probably because Joe probably uses vim ;-)

> 
> Unfortunately, we do not have standardized indentation style
> for scripts yet, and people can go in any direction.
> 
> The editorconfig patch [1] proposed to always use 4-space
> indentation for *.pl files.
> (that is, do not replace 8 spaces with a tab).

I rather have all tabs, or the tab and spaces. I find 8 spaces to be a
waste of memory and disk space.

> 
> I do not know whether the kernel will adopt .editorconfig or not,
> but if that patch is applied, your 1/2 will be a step backward.

My 1/2 only made it consistent, as the original code had the tab/spaces mix
and just a few lines that were modified by others broke it by adding all
spaces.

> 
> My got-feeling is, you will never reach the goal as long as
> you adopt a strange indentation style, which is obscure
> to other contributors.

I'm guessing this is not strange to other perl developers who uses emacs.

> 
> Not all people use vim.

I don't use it either. I was trying to make vim match emacs. Of course for
those that use something else, it wont help. I'm curious, what's your main
editor that you use?

> I am not interested in 1/2 either.

OK.

> 
> If you insist on this patch set, apply it to your tree
> and send a pull request by yourself.

I'm fine with that.

> 
> 
> [1]: https://lore.kernel.org/lkml/20200703073143.423557-1-danny@kdrag0n.dev/

Thanks for the link.

-- Steve
