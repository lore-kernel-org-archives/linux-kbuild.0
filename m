Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F42C433ED
	for <linux-kbuild@archiver.kernel.org>; Fri,  9 Apr 2021 03:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D567B600D1
	for <linux-kbuild@archiver.kernel.org>; Fri,  9 Apr 2021 03:08:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233184AbhDIDIr (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 8 Apr 2021 23:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233153AbhDIDIo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 23:08:44 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F74C061761
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 20:08:32 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id f29so2816688pgm.8
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 20:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VtuEueWcaC1955LnaOVqKunKMhIKwbtn+Mdlogx6zxA=;
        b=EqcbqDa8gNnAl2FpALvPwEaZBOSBw3B00uafrozwofFF7zUxWJPEcj4EwCeolZfrU6
         pngVNlHOvWEyWAQRDO7Y3rMNpkJSqeMPSXNm/O3SiYqqARSgr9qf4uvC1rL4uLa/Tbs4
         Hi3r+041t58NT5ggp4N4WWvytcyhpngZqhKdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VtuEueWcaC1955LnaOVqKunKMhIKwbtn+Mdlogx6zxA=;
        b=qDd/asZ1xUjQTYy/hfsIU7GIv1FdU7dhTw9qQAXnI4cp2D400rijRIqIGXAEspt5ha
         XRHS7NYGgYjXM0WlquYmzoPlSje19R9cKvrcgYjJK962hxqPxmW23y4Lne+DPifw/MAG
         EUsSpuN36R00HsaRNfT1OknMEtWlaKT9u75/lQjP0bUpSlc6d8gXm3vIHbsPZRMeYw+p
         7M/yZ0cxEhPazkHrRhp2xXxgL/QpUhz4qo2F5BHJewCZ0WabHSwdKVsPzRfGUZ/wcctW
         8qq4mWzcM7frJ+5l3QPXkbS37FI8BKC1f8vzS3z9hrlTxmL1B6WiWMf5YiiaXg2yqmyx
         bROA==
X-Gm-Message-State: AOAM531FKKfi2yEk9EHNjqOnv1vHLX7UHAaWEcdikRhsEMspC0g8jVAZ
        aaJUwycQ7xmNyTOX+z8vXmXt1g==
X-Google-Smtp-Source: ABdhPJwesH3bAYyHHBi1JZroy1EOahpCZwAfNZZ8/KQHG8nL5f52UVChwFkDMulHU1F6U8rhq3tPXg==
X-Received: by 2002:a63:485b:: with SMTP id x27mr11211392pgk.0.1617937712141;
        Thu, 08 Apr 2021 20:08:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q19sm641873pgv.38.2021.04.08.20.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 20:08:31 -0700 (PDT)
Date:   Thu, 8 Apr 2021 20:08:30 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org
Subject: Re: [PATCH 01/20] kbuild: move x86 install script to
 scripts/install.sh
Message-ID: <202104082008.780F179FC@keescook>
References: <20210407053419.449796-1-gregkh@linuxfoundation.org>
 <20210407053419.449796-2-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407053419.449796-2-gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 07, 2021 at 07:34:00AM +0200, Greg Kroah-Hartman wrote:
> To unify the different architecture kernel installation scripts, start
> out with the one they all were based on, the x86 script.  Move it from
> arch/x86/boot/ into scripts/ so that all architectures can call it in
> the future.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: x86@kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
