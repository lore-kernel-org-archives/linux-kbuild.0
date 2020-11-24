Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B248EC63777
	for <linux-kbuild@archiver.kernel.org>; Tue, 24 Nov 2020 19:56:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3176B208FE
	for <linux-kbuild@archiver.kernel.org>; Tue, 24 Nov 2020 19:56:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XirMyMkw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbgKXTz6 (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 24 Nov 2020 14:55:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:37432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728991AbgKXTz5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 14:55:57 -0500
Received: from localhost (82-217-20-185.cable.dynamic.v4.ziggo.nl [82.217.20.185])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC93B208FE;
        Tue, 24 Nov 2020 19:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606247757;
        bh=qGOAI1sLWjai7eOy5zMsCxwwyS2qKGmb3V+spDs/Qcs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XirMyMkw74c8w+bv6QgyYOzgrtClRBDenkB0RX3LZEyB3Bpc2RbefkHzDTvxAH3SI
         SQXnKg5MNScs0hHx0hMYHRtrTdA83vITawVsvCEZ2/1RONvxbFjFGuhYlrudta+iIV
         Bap74FbD3crLIP2T/MzE2iSoNEWx5ZwvhUBkuyk4=
Date:   Tue, 24 Nov 2020 20:55:54 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Quentin Perret <qperret@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH] modpost: Make static exports fatal
Message-ID: <X71lSv25Zl3P0sFR@kroah.com>
References: <20201124182420.2202514-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124182420.2202514-1-qperret@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 24, 2020 at 06:24:09PM +0000, Quentin Perret wrote:
> Using EXPORT_SYMBOL*() on static functions is fundamentally wrong.
> Modpost currently reports that as a warning, but clearly this is not a
> pattern we should allow, and all in-tree occurences should have been
> fixed by now. So, promote the warn() message to fatal() to make sure
> this never happens again.
> 
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  scripts/mod/modpost.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index f882ce0d9327..70b0e825a139 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2663,9 +2663,9 @@ int main(int argc, char **argv)
>  
>  		for (s = symbolhash[n]; s; s = s->next) {
>  			if (s->is_static)
> -				warn("\"%s\" [%s] is a static %s\n",
> -				     s->name, s->module->name,
> -				     export_str(s->export));
> +				fatal("\"%s\" [%s] is a static %s\n",
> +				      s->name, s->module->name,
> +				      export_str(s->export));
>  		}
>  	}
>  

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
