Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2337CC433B4
	for <linux-kbuild@archiver.kernel.org>; Sat, 15 May 2021 07:27:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1427613F1
	for <linux-kbuild@archiver.kernel.org>; Sat, 15 May 2021 07:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbhEOH3G (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 15 May 2021 03:29:06 -0400
Received: from smtprelay0168.hostedemail.com ([216.40.44.168]:46554 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231217AbhEOH3F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 15 May 2021 03:29:05 -0400
Received: from omf06.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 6060118026A05;
        Sat, 15 May 2021 07:27:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id B36F22448B4;
        Sat, 15 May 2021 07:27:46 +0000 (UTC)
Message-ID: <acff710e1cde66db686273d430a0798c4ea4f41e.camel@perches.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
From:   Joe Perches <joe@perches.com>
To:     Pavel Machek <pavel@ucw.cz>, Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Date:   Sat, 15 May 2021 00:27:45 -0700
In-Reply-To: <20210515071410.GA27201@amd>
References: <20210501151538.145449-1-masahiroy@kernel.org>
         <20210515071410.GA27201@amd>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: B36F22448B4
X-Stat-Signature: sk6bp1su8mgpmhdudeekd6zmd57nm8uk
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18VobztuKx5cPb+cCAmoDLIOZAXmsA6C+8=
X-HE-Tag: 1621063666-295586
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 2021-05-15 at 09:14 +0200, Pavel Machek wrote:
> On Sun 2021-05-02 00:15:38, Masahiro Yamada wrote:
> > The current minimum GCC version is 4.9 except ARCH=arm64 requiring
> > GCC 5.1.
> 
> Please don't. I'm still on 4.9 on machine I can't easily update,

Why is that?  Later compiler versions are available.
http://cdn.kernel.org/pub/tools/crosstool/

Is there some other reason your machine can not have the compiler
version updated?


