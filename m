Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2B6C433E6
	for <linux-kbuild@archiver.kernel.org>; Fri, 22 Jan 2021 19:44:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 225FC23AF8
	for <linux-kbuild@archiver.kernel.org>; Fri, 22 Jan 2021 19:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbhAVTly (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 22 Jan 2021 14:41:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730201AbhAVTYg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jan 2021 14:24:36 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B64C061794
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Jan 2021 11:23:56 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id cq1so4453915pjb.4
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Jan 2021 11:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7qLtZEw46MuUNIjgfTBmQVdFoDCzD4gSGophFRfdj9c=;
        b=bGs9+RQfEZapH5a6I/1sAlxe6lblz17BbDMoY8hk8D51nuXTqTlFFPMyDuDfmy6gET
         rfbZANKErdA7BepjLInotLIqN/JDkxzqGrIafLjzcoaHk8W1PBvXutMoCveAieUleL3Q
         h5iVo1yVNFeoJpjXCmXq7wvFHfJyDRr7p0jiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7qLtZEw46MuUNIjgfTBmQVdFoDCzD4gSGophFRfdj9c=;
        b=itnpBE0IlajbePK62dHUv8zqj9FJRbkvRtckyQw4Z1SI5OcJK2Nn9UX/glxoRUAGGR
         H3GJqrdnz9TCtIJcmtYlwlhTsI56l4lHMMLZrTTb/WM5eBzR+LBieiD4P5Nq3/USFiMo
         JcMQUeJEZzDf+TEIvBtTfY4tzOGR/u5VcNMtIwDeLGBDiF3nBx3foZSkxYJ1uE/au4wY
         4j8l2uzCcvM0BhoSZyrfmZStEjhtgMSpe/4A0Qp07XEOZfKSCE1uyFY6SGlKDQ0/HQ/o
         MKp6D+KHDFUmJcINJHE3m0a+rQcCIy/FylNl3sQb79nbpdrMfpn/ggZ8KnXB3xeI9gcS
         u3Kw==
X-Gm-Message-State: AOAM531hlzTGSt2Fy69tIBMzDlcW1NDbf8V5cfP6NADnbA2qmAWhH8gl
        QlEA889YoFe0VMCp/dRAIQ97jg==
X-Google-Smtp-Source: ABdhPJwWPLudcsSrSLClh8DTzDJxX4J0dgf3E1K4QJTquK5uVVrb0Hfo9aMXXqcH+ClQbrHFJWsa0Q==
X-Received: by 2002:a17:90a:9414:: with SMTP id r20mr6874931pjo.222.1611343436131;
        Fri, 22 Jan 2021 11:23:56 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v1sm10639957pjd.26.2021.01.22.11.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 11:23:55 -0800 (PST)
Date:   Fri, 22 Jan 2021 11:23:54 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Robert Karszniewicz <r.karszniewicz@phytec.de>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Philipp Rudo <prudo@linux.ibm.com>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, Robert Karszniewicz <avoidr@posteo.de>
Subject: Re: [PATCH] Documentation/Kbuild: Remove references to gcc-plugin.sh
Message-ID: <202101221123.23BA3181@keescook>
References: <1611338653-175404-1-git-send-email-r.karszniewicz@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611338653-175404-1-git-send-email-r.karszniewicz@phytec.de>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 22, 2021 at 07:04:13PM +0100, Robert Karszniewicz wrote:
> gcc-plugin.sh has been removed in commit
> 1e860048c53e ("gcc-plugins: simplify GCC plugin-dev capability test").
> 
> Signed-off-by: Robert Karszniewicz <r.karszniewicz@phytec.de>

Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
