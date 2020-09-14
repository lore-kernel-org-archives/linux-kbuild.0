Return-Path: <SRS0=rOOZ=CX=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7691C433E2
	for <linux-kbuild@archiver.kernel.org>; Mon, 14 Sep 2020 13:22:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C38E206DB
	for <linux-kbuild@archiver.kernel.org>; Mon, 14 Sep 2020 13:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600089737;
	bh=eDXyTgSyZLA07KG4y8gzUYxM2EcFms0du2447Fr3REE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=s0oqPJgImL1NmPH0sMpXcR0vbT3VbAAydTj2EcGhrBZE7WtmKmQNS/8tWMlgkFkMa
	 O/E4PqeQdQuhtY0sI074tUYoE284l4CxPACP8N0d56iPr8Drh+63F32C4J26Lc1UWD
	 +tF5CcEehY8n8cCpiZM96NGhKLXfbCOIMmLgLfnE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726577AbgINNWJ (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 14 Sep 2020 09:22:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:45094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726764AbgINNUJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 09:20:09 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0B3E2208E4;
        Mon, 14 Sep 2020 13:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600089609;
        bh=eDXyTgSyZLA07KG4y8gzUYxM2EcFms0du2447Fr3REE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0E0FBaqI2gVjLsCgTWWbEBhicvx/8W8sKEoRPU4RcXqIdRwDkJrB8XSxXcKvIaj/N
         lpijuoNzUsujtevr9e30J2njr/A6unC5wIUNSXne1GPReBrcBPhMaeTJLy+5xGktxr
         ikf6iqCBcXXe2b5t20bkCsnFRNPvQtxFtVYVLQB0=
Date:   Mon, 14 Sep 2020 14:20:03 +0100
From:   Will Deacon <will@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] kbuild: remove cc-option test of -fno-strict-overflow
Message-ID: <20200914132003.GE24441@willie-the-truck>
References: <20200910135120.3527468-1-masahiroy@kernel.org>
 <20200911152225.GB20374@willie-the-truck>
 <CAK7LNASijUXVmZ+AfuGOnAFnbfUpr3S2ncSxABt4bGF+agxg+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASijUXVmZ+AfuGOnAFnbfUpr3S2ncSxABt4bGF+agxg+A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 14, 2020 at 09:51:31PM +0900, Masahiro Yamada wrote:
> On Sat, Sep 12, 2020 at 12:22 AM Will Deacon <will@kernel.org> wrote:
> > On Thu, Sep 10, 2020 at 10:51:17PM +0900, Masahiro Yamada wrote:
> > > The minimal compiler versions, GCC 4.9 and Clang 10 support this flag.
> > >
> > > Here is the godbolt:
> > > https://godbolt.org/z/odq8h9
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  Makefile                          | 2 +-
> > >  arch/arm64/kernel/vdso32/Makefile | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > This, and the other patch (4/4 -- I didn't see 2 or 3), look good to me.
> > Are you taking them via the kbuild tree, or shall I queue them in the arm64
> > tree? Please just let me know what you prefer.
> 
> I will apply all to the kbuild tree.
> Your Ack is appreciated.

For both:

Acked-by: Will Deacon <will@kernel.org>

Will
