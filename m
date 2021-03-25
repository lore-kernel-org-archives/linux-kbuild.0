Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CAFC433C1
	for <linux-kbuild@archiver.kernel.org>; Thu, 25 Mar 2021 00:07:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9C5B61A1B
	for <linux-kbuild@archiver.kernel.org>; Thu, 25 Mar 2021 00:07:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235065AbhCYAHA (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 24 Mar 2021 20:07:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:41236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232062AbhCYAGi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Mar 2021 20:06:38 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5D6661A19;
        Thu, 25 Mar 2021 00:06:37 +0000 (UTC)
Date:   Wed, 24 Mar 2021 20:06:36 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "John (Warthog9) Hawley" <warthog9@kernel.org>
Subject: Re: [PATCH 2/2] streamline_config.pl: Add softtabstop=4 for vim
 users
Message-ID: <20210324200636.0ae28505@oasis.local.home>
In-Reply-To: <20210324095417.49c6377b@gandalf.local.home>
References: <20210322213806.089334551@goodmis.org>
        <20210322214032.293992979@goodmis.org>
        <CAK7LNAQh=zKVTwup5Kh39oTnVEUNotX-Ce7_+2uRO1GNVOaDbw@mail.gmail.com>
        <20210324095417.49c6377b@gandalf.local.home>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 24 Mar 2021 09:54:17 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> This code doesn't change much, so I'm fine with that. But for ktest.pl, I'm
> adding it.

Anyway, I'm not going to ask you to take the second patch if you don't
like it, but would you take the first patch?

-- Steve
