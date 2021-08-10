Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544B4C4338F
	for <linux-kbuild@archiver.kernel.org>; Tue, 10 Aug 2021 18:17:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3386460C3E
	for <linux-kbuild@archiver.kernel.org>; Tue, 10 Aug 2021 18:17:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234022AbhHJSR7 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 10 Aug 2021 14:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236679AbhHJSRH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Aug 2021 14:17:07 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFC8C059350
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Aug 2021 10:58:16 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z20so6113812lfd.2
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Aug 2021 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=jOtoBPdTetxURGXaH4p/edf3lKEpBVLNOZWC7CVT0Rg=;
        b=dm9N0vPWFbrcjRwEI9MQKP8yuSqsBl8oNyQGqJ5y7iHMviv88sjQoYrw7GJGGqb2Tj
         lYjMeBX83/nqzvs4mBL1WtuJnmSn5/sfmrf2kwmrTFOKS1bH7cGUTzdaNybAXmoXmdc6
         uEeKGODe3aagvLZhhylGco+qZO8gsIRFrCwDAxsaf6oMiA35pnoyQ4Cxxs8J/iQUviNZ
         v/OLZvmyj0Yui7MWEl72NIOpyuniWzgyDTiCl2+YrWd4X8S48MaM8YcTbCuzSIjpi0fz
         woHE+J+Rj3sBxlLHvqcgoH2B/xXLMv6Booee/jkTHHyVmVjACD9AU8Fz0Npz5Pwt3wpf
         BUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=jOtoBPdTetxURGXaH4p/edf3lKEpBVLNOZWC7CVT0Rg=;
        b=VyDbYfdW7qMLcx4BGQG3s6fHsBF0r2SU2u4SwHotnwMjnYC9+TNVL237/qL43d2sRT
         ULj0ZaHu6XQcHfs6ml5c7g+HZCbpE46+rMp93aYqxueoiPlLnA8JOJB81WLZNHutU+j3
         o7FiAuIHptOZ1ceUZ1HcJ4aafxt8wv5kULA5Gtx93Nwcf5FIk3NbT2SrdToc1i1X+mHb
         eGdI1XqC6G2tzzu2pkuU9hLdtx884fU9q3gMkmpnAgocQIr6DZtyQI2N5bjhcsP9OWPA
         QwK8agAKy+DewjQRMb5wy9f8fcqZCV+fbUBwjEQfrX8TaL8Z/9uCTxMk0Pu5lV9cW/Nk
         iLXg==
X-Gm-Message-State: AOAM533wn07tOSAAbxEhUtMIcyehz0XqYpYyE0on8DfJknWDUDOvMMKi
        b9olxx104ORX7oYVOQGbN2Rc/dEGtFgurLRipX2MCTB5aFyqC8LU
X-Google-Smtp-Source: ABdhPJz19/eIpqCYy/fTPnfLcatxCAIxsDs+JqpO2si9tAUwkyhU5mUyC5TXx4Mg1kBzLD3lYNuzt9fR4ZzQQrU+brI=
X-Received: by 2002:ac2:4e8c:: with SMTP id o12mr12176777lfr.374.1628618294686;
 Tue, 10 Aug 2021 10:58:14 -0700 (PDT)
MIME-Version: 1.0
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 10 Aug 2021 10:58:03 -0700
Message-ID: <CAKwvOdkPLrL6wkhSGaadAcj3HNi1W2q6TQHWFhSej8JvatSzfw@mail.gmail.com>
Subject: cc-option-yn necessary? (vs cc-option)
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro,
I was looking through the uses of cc-option, cc-option-yn, and
cc-disable-warning to see what we're missing support for in Clang.

I have a short list of places where cc-option can be removed at
https://github.com/ClangBuiltLinux/linux/issues/1436#issuecomment-895557491
because all supported versions of supported toolchains support these
flags.  These should remove a few unnecessary compiler invocations.

There are also a few cc-option tests that are very compiler specific,
so those might be convertible to just check CC_IS_* rather than
cc-option (I'll have to verify).

Another thing I noticed is that it seems that most uses of
cc-option-yn are replaceable with simply cc-option when they use
cc-option-yn but check that the result is equal to y. I think even the
cases that check against n could be converted to:

Examples:
arch/x86/Makefile
From:
ifeq ($(call cc-option-yn, -mfentry), n)
To:
ifeq ($(call cc-option,-mfentry),)
(Though technically, all supported versions of gcc and clang support
-mfentry, so this block should just be deleted)

arch/powerpc/Makefile
From:
ifeq ($(call cc-option-yn,-mcmodel=medium),y)
To:
ifneq ($(call cc-option,-mcmodel=medium),)

Then perhaps we could consolidate cc-option-yn into cc-option?  What
are your thoughts? Should I start sending you patches for all of the
above?
-- 
Thanks,
~Nick Desaulniers
