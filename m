Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E8AC38159
	for <linux-kbuild@archiver.kernel.org>; Wed, 18 Jan 2023 08:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjARIsL (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 18 Jan 2023 03:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbjARIri (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Jan 2023 03:47:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5326D93722;
        Wed, 18 Jan 2023 00:01:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DF79EB81B89;
        Wed, 18 Jan 2023 08:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CACC433EF;
        Wed, 18 Jan 2023 08:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674028831;
        bh=ufQqDQretGXtNxqadTF2D5r1H7mo3exV2T85ESGLwEk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J/uoNlyocuw/7Am960Rt18PsSiThqGyxsvpIw35gk/z3NjuVrmLokNkSKdDuJCv/+
         K7JiVZx9lnMLLd3S8cr/d75brBMsA/qEPKZmoKfvOdo4+jozjocsF/U53YX/4XJ37h
         M+hFR9vANvEf4DdAJrulSqtMu2YoIkpL+xr3JHYMTxL8JImGvuKOlqVssFp02qPLWS
         RCc5NjZzYq69ebRA17mrmPZh65Ukc91A7Bqy8PM9zjnjEtxVNJym/s7lRjQU3ZAw8H
         MII2dz6iNG5N9ssQBycTPccukTaAM/u8jtE94aiCaR3FS33U1tvZJ0EYntNd/FZSyk
         7AZulhotmypNw==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-15bb8ec196aso22900176fac.3;
        Wed, 18 Jan 2023 00:00:31 -0800 (PST)
X-Gm-Message-State: AFqh2krGZ8FNCPO7Jq8oOjH3mNenJcA7TsvM7SmPWB9hbGBC4unT4W2B
        vAzXLToDkyeH5Ws09kxdP3nZg2WqRs5AzQsAEUU=
X-Google-Smtp-Source: AMrXdXtkmLEk075uBgGVC5FyELhD/qqb9Tq9gvEiLrmKoUeE8PoVprvmqZ5vDQbvaxfSnr4AmOLKfoDjBvEBZGkDjo8=
X-Received: by 2002:a05:6870:c20b:b0:15f:1e44:71fd with SMTP id
 z11-20020a056870c20b00b0015f1e4471fdmr401447oae.194.1674028830827; Wed, 18
 Jan 2023 00:00:30 -0800 (PST)
MIME-Version: 1.0
References: <20230117095946.2042832-1-jani.nikula@intel.com>
In-Reply-To: <20230117095946.2042832-1-jani.nikula@intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 18 Jan 2023 16:59:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQoLuyO6GJBhSTQcLPRFFj4fdVmR8POqzi_cUXQkr3bzA@mail.gmail.com>
Message-ID: <CAK7LNAQoLuyO6GJBhSTQcLPRFFj4fdVmR8POqzi_cUXQkr3bzA@mail.gmail.com>
Subject: Re: [PATCH 0/6] docs: kbuild makefile documentation cleanups
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 17, 2023 at 7:00 PM Jani Nikula <jani.nikula@intel.com> wrote:
>
> I usually shy away from making rst updates, but the makefiles.rst file
> always bugs me when I look at it, so here goes. Even I usually look at
> the rst file in the editor instead of html in the browser, but the
> editor knows about rst...
>
> This is based on the kbuild branch of linux-kbuild.git, and there's a
> MAINTAINERS update too to fix the branch name. ;)
>
> BR,
> Jani.


All applied to linux-kbuild. Thanks.


>
> Jani Nikula (6):
>   MAINTAINERS: fix kbuild repo branch
>   docs/kbuild/makefiles: fix header underline
>   docs/kbuild/makefiles: throw out the local table of contents
>   docs/kbuild/makefiles: drop section numbering, use references
>   docs/kbuild/makefiles: clean up indentation and whitespace
>   docs/kbuild/makefiles: unify quoting
>
>  Documentation/kbuild/makefiles.rst | 2148 ++++++++++++++--------------
>  MAINTAINERS                        |    2 +-
>  2 files changed, 1060 insertions(+), 1090 deletions(-)
>
> --
> 2.34.1
>


-- 
Best Regards
Masahiro Yamada
