Return-Path: <SRS0=yz/N=CM=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057F3C433E2
	for <linux-kbuild@archiver.kernel.org>; Thu,  3 Sep 2020 22:45:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C95522083B
	for <linux-kbuild@archiver.kernel.org>; Thu,  3 Sep 2020 22:45:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DWsncKoX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728107AbgICWpt (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 3 Sep 2020 18:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728506AbgICWpq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Sep 2020 18:45:46 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C87C061245
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Sep 2020 15:45:46 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id u13so3288576pgh.1
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Sep 2020 15:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JXlymsrIbyM7AjGm/2rfdOYB0H1CVU1h4Svm00pvuI0=;
        b=DWsncKoXfy4PxyNvBSrYQCxtYjY8jyteneTwkz6mlHPPEZFF7gp7715SOKmC4/qkxD
         q+SYZYmla2S9Ys6tFjcp4ODWzXwDrV++MfFs8CcN+DqLmMxXFZakptYE6CAUTvkVC5UV
         20qyxQyoX4j38sYtCuXlnZbJ2RYy/taCcoWgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JXlymsrIbyM7AjGm/2rfdOYB0H1CVU1h4Svm00pvuI0=;
        b=bmHE4vRfwFWSuNW/Z1CoiapEbg28ACLTu8YzQP1Lmd0Xk/L/nHAcD9+Ak5uzvuyWSr
         zjmgK65XP7iFOtlNm+qILX532799VXoAfRZpdmifjiISKJZHPb706QYGOxqCyDuKdBGB
         cFKG4Xz0D32DdzOmJSE7M/YXyH6iBWlymNhi5nj95dTsyixHNhzSql4yDvjw1JyBtsHd
         SreAxrIeAKK7Uo1DCNyZP96kPgoq9UXJP4jIV7yFXhRHbhYQ4tZNCJyvIxH6MbfcX5WC
         KpijJ/ovlcldEHo2qbb1Jf4++MjJkbYEB68j5NSXT+TkuFd4DBgZEkXJbUl3+WAK9cEI
         3J8g==
X-Gm-Message-State: AOAM530TzremsSHpZvsPHyYH3hed1wrB42C8GRvD/hpyH5p9nuf5eFxT
        OrHViif9t2LJ2c+8LCGL2AlGag==
X-Google-Smtp-Source: ABdhPJyzQQa+rbWQTOULGEXaVav+gnGRAy9CUx4utciFuxZtqNR92PboxBy66CUG56xUgxKlxz08hw==
X-Received: by 2002:a17:902:7609:: with SMTP id k9mr6059271pll.227.1599173146049;
        Thu, 03 Sep 2020 15:45:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c5sm3619987pgj.0.2020.09.03.15.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 15:45:45 -0700 (PDT)
Date:   Thu, 3 Sep 2020 15:45:44 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH v2 25/28] arm64: allow LTO_CLANG and THINLTO to be
 selected
Message-ID: <202009031545.559F27FAE@keescook>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200903203053.3411268-1-samitolvanen@google.com>
 <20200903203053.3411268-26-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903203053.3411268-26-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 03, 2020 at 01:30:50PM -0700, Sami Tolvanen wrote:
> Allow CONFIG_LTO_CLANG and CONFIG_THINLTO to be enabled.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
