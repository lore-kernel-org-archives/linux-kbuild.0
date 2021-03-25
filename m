Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09C8C433E0
	for <linux-kbuild@archiver.kernel.org>; Thu, 25 Mar 2021 15:11:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EAF861A1D
	for <linux-kbuild@archiver.kernel.org>; Thu, 25 Mar 2021 15:11:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhCYPKa (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 25 Mar 2021 11:10:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:35004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230438AbhCYPKH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 11:10:07 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 40FF261A13;
        Thu, 25 Mar 2021 15:10:06 +0000 (UTC)
Date:   Thu, 25 Mar 2021 11:10:04 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "John (Warthog9) Hawley" <warthog9@kernel.org>
Subject: Re: [PATCH 2/2] streamline_config.pl: Add softtabstop=4 for vim
 users
Message-ID: <20210325111004.410b7703@gandalf.local.home>
In-Reply-To: <CAK7LNASS70K6vWz6pxkvgPKmRGYvpt+OwAa2ZZT5OMGW4ZJW_Q@mail.gmail.com>
References: <20210322213806.089334551@goodmis.org>
        <20210322214032.293992979@goodmis.org>
        <CAK7LNAQh=zKVTwup5Kh39oTnVEUNotX-Ce7_+2uRO1GNVOaDbw@mail.gmail.com>
        <20210324095417.49c6377b@gandalf.local.home>
        <CAK7LNAQ4uRB+9M4h0KVwEQUnX1XZrsE30KP_pqJqYjF2FcsHZA@mail.gmail.com>
        <20210325095039.7202d675@gandalf.local.home>
        <CAK7LNASS70K6vWz6pxkvgPKmRGYvpt+OwAa2ZZT5OMGW4ZJW_Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 25 Mar 2021 23:09:38 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> > > Not all people use vim.  
> >
> > I don't use it either. I was trying to make vim match emacs. Of course for
> > those that use something else, it wont help. I'm curious, what's your main
> > editor that you use?  
> 
> 
> I use emacs.
> 
> I have some setups in my ~/.emacs
> although I am not an expert of emacs lisp.
> 
> 
> (defalias 'perl-mode 'cperl-mode)
> 
> (add-hook 'cperl-mode-hook
>           (lambda()
>                 (setq cperl-indent-level 8)
> (setq cperl-tab-always-indent t)
>             (setq tab-width 8)
>             (setq indent-tabs-mode t)
>             ))
> 
> 
> 
> 
> Then, emacs can understand that
> my preference is tab-indentation
> with 8 character width.

Ah, so you edited your perl-mode to not use the emacs default. I never did.

I was just letting you know where I picked up the "mix up space-indentation
and tab-indentation" from ;-)  I'm sure if you removed those lines, you
would then see why I use that "standard".

I've been doing it for so long on all my perl files, it's been engraved in
me to do it that way whenever I work on perl.

-- Steve
