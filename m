Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB34C11F64
	for <linux-kbuild@archiver.kernel.org>; Thu,  1 Jul 2021 08:55:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEC9761493
	for <linux-kbuild@archiver.kernel.org>; Thu,  1 Jul 2021 08:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235356AbhGAI5o (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 1 Jul 2021 04:57:44 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:57140 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235088AbhGAI5n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Jul 2021 04:57:43 -0400
X-UUID: 9cfc03a74eeb461082d1641529f2264f-20210701
X-UUID: 9cfc03a74eeb461082d1641529f2264f-20210701
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1520831154; Thu, 01 Jul 2021 16:55:10 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Jul 2021 16:55:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 1 Jul 2021 16:55:09 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <nathan@kernel.org>
CC:     <clang-built-linux@googlegroups.com>, <keescook@chromium.org>,
        <lecopzer.chen@mediatek.com>, <linux-kbuild@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <masahiroy@kernel.org>,
        <michal.lkml@markovi.net>, <samitolvanen@google.com>,
        <yj.chiang@mediatek.com>
Subject: Re: [PATCH 2/2] Kbuild: lto: add make version checking
Date:   Thu, 1 Jul 2021 16:55:09 +0800
Message-ID: <20210701085509.395-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <6d687b9a-c295-ce8b-9472-d2859977be2d@kernel.org>
References: <6d687b9a-c295-ce8b-9472-d2859977be2d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

 
> On 6/30/2021 5:14 AM, Lecopzer Chen wrote:
> > LTO with MODVERSION will fail in generating correct CRC because
> > the makefile rule doesn't work for make with version 3.8X.[1]
> > 
> > Thus we need to check make version during selecting on LTO Kconfig.
> > and the suitable version should be 4.2(40200) which release in 2016[2].
> > 
> > [1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
> > [2] https://ftp.gnu.org/gnu/make/
> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > ---
> >   arch/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index c45b770d3579..1571957bade5 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -632,6 +632,7 @@ config HAS_LTO_CLANG
> >   	def_bool y
> >   	# Clang >= 11: https://github.com/ClangBuiltLinux/linux/issues/510
> >   	depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD && AS_IS_LLVM
> > +	depends on MAKE_VERSION_INT >= 40200
> 
> If the bug depends on CONFIG_MODVERSIONS, should this be
> 
> depends on !MODVERSIONS || MAKE_VERSION >= 40200
> 
> ? Especially since the problematic block in your original report is 
> gated on CONFIG_LTO_CLANG + CONFIG_MODVERSIONS.
> 

You're right, I'll fix it in v2, thanks for reviewing.


> >   	depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
> >   	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
> >   	depends on ARCH_SUPPORTS_LTO_CLANG
> > 
