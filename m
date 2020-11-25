Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E33FC5519F
	for <linux-kbuild@archiver.kernel.org>; Wed, 25 Nov 2020 10:35:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF2F820857
	for <linux-kbuild@archiver.kernel.org>; Wed, 25 Nov 2020 10:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B7+XMHnK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgKYKfh (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 25 Nov 2020 05:35:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgKYKfh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Nov 2020 05:35:37 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFCBC0613D4
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Nov 2020 02:35:36 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id h21so1666519wmb.2
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Nov 2020 02:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5AdhqJPNqJ4ajsPBDb7aBTdCZqenqeNmdluQ3fHyVw8=;
        b=B7+XMHnKQxb4VWWBAPKFNlaE35cZxK4xHOpGVCq6sHJocVauhvpSfEqDixJGQ4hvZ/
         863iw/Vpe4F2YgyRe8Lt+7qMPMu/PFQE+oW2jzIR+xVvLqIIf/Kg7WIH7Ro4DacYL3jX
         K4SHXxSmpBNfCt++ykfeZcfs0KXslMkq0ePWc8DMjah/BGgL5U/23cH5FQ+W9QZ7ABX8
         tglf1tO3dm2zoZU7UvGSxwhmD5lyxISAZWRf1AeVVSJQbs0SDaKGjRXcZ9epRNvdyiVr
         gSSxL0Q/ZiJJ1dF9FBdIG26+12TMLfyDd9IOzokNNRSaYuRjW0LnaKh+0tbZatYaulMx
         B7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5AdhqJPNqJ4ajsPBDb7aBTdCZqenqeNmdluQ3fHyVw8=;
        b=WinbOEpbx46GfNvx94ADTlj+xthd4lGPO2fCXaUAk5yt6ZPB9iny1C70YdJ6nXXpnt
         HhdxnjbwUO9jKWA2hhjbB+LfG6VUJrWG+uI3MLanTpESw2kdnaxgL6kzJ4z9CP58wsgY
         RG4m99L+BnTl9odGHjbb4+27GzMCgu7XS/br/tksa+Gw/zg1bGUr84jcu2orpZ11iGYk
         rhkn8dsQA8OXWdXnAhBaNfETMnVlPqNihVpxgy+kWL9/2J12sFFsw8hnEgosqYN812gY
         0/E7ZDcAIBlknA7eli40k8faKwgspUZTnW3dRm1eewkP6aJ9T0bt1C45GVg+mVzanjT4
         p4aw==
X-Gm-Message-State: AOAM533Tx1O5XpFH2FHY4FeS37sF+zO38UnYgSu8Gr1m30Lykqd/Xgag
        03r/m1xNSMVV1ti8x6kncANXhQ==
X-Google-Smtp-Source: ABdhPJwsRjx6KKEXcNdzIPS4xp2DBxwoiR2l9nmoiZkQY7Lwp1FKiVXAb5vbXTQVMkhCl2vy7hW+xA==
X-Received: by 2002:a1c:4b10:: with SMTP id y16mr3232942wma.10.1606300535324;
        Wed, 25 Nov 2020 02:35:35 -0800 (PST)
Received: from google.com ([2a00:79e0:d:210:7220:84ff:fe09:a3aa])
        by smtp.gmail.com with ESMTPSA id j8sm4031336wrx.11.2020.11.25.02.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 02:35:34 -0800 (PST)
Date:   Wed, 25 Nov 2020 10:35:34 +0000
From:   Matthias Maennich <maennich@google.com>
To:     Quentin Perret <qperret@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, kernel-team@android.com
Subject: Re: [PATCH] modpost: Make static exports fatal
Message-ID: <20201125103534.GA2112262@google.com>
References: <20201124182420.2202514-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201124182420.2202514-1-qperret@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 24, 2020 at 06:24:09PM +0000, Quentin Perret wrote:
>Using EXPORT_SYMBOL*() on static functions is fundamentally wrong.
>Modpost currently reports that as a warning, but clearly this is not a
>pattern we should allow, and all in-tree occurences should have been
>fixed by now. So, promote the warn() message to fatal() to make sure
>this never happens again.
>
>Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

>---
> scripts/mod/modpost.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>index f882ce0d9327..70b0e825a139 100644
>--- a/scripts/mod/modpost.c
>+++ b/scripts/mod/modpost.c
>@@ -2663,9 +2663,9 @@ int main(int argc, char **argv)
>
> 		for (s = symbolhash[n]; s; s = s->next) {
> 			if (s->is_static)
>-				warn("\"%s\" [%s] is a static %s\n",
>-				     s->name, s->module->name,
>-				     export_str(s->export));
>+				fatal("\"%s\" [%s] is a static %s\n",
>+				      s->name, s->module->name,
>+				      export_str(s->export));
> 		}
> 	}
>
>-- 
>2.29.2.454.gaff20da3a2-goog
>
