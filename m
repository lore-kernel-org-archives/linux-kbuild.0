Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76744C433F5
	for <linux-kbuild@archiver.kernel.org>; Mon, 23 May 2022 20:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233069AbiEWUbs (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 23 May 2022 16:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233057AbiEWUbr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 May 2022 16:31:47 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A92162127
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2022 13:31:45 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 27so13634096ljw.0
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2022 13:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wBaaj+XJRciWuzeB12Uou/3sT9TB3e1izvK2J/BvnGE=;
        b=dtDiRK5Zbt91iRXg8l3N/Bq0yx4h9NH0DItyIk9C5xS6kqHq8CLQx+mmxFi0hXgqAL
         CUICgTrYsIWayHyaEMwt/8nKiRqvWGh6ElUuzikGk/nuJp63SJJGiBkjChNAtKA5gdLB
         tA0mA8WqTpxsiHeCTA1vE0+VPWLunSHT74gIsw6GXKgqp426nxGAWMdb9TBCYXym4WxT
         tXUurH+EwydB+SxWnXDVTXLWbZwhHkziQ4ji51+bWD2JgDPoE5XbTlqdy9BQtmz2YTNZ
         Bj6tTJ3CymcZ6d6o07quXCIkFwBozaA22XGbl9jXu0TCtfY1ie0TdoVndMhFKEYPuWy0
         O7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wBaaj+XJRciWuzeB12Uou/3sT9TB3e1izvK2J/BvnGE=;
        b=R+ZArJI/wvtqxU7Fc+P6jkyKQnXVsABwkfutZRAqYC78HkQOx4BO7idzAFTNObeEwd
         ZxWlNliCjZwaCFdPzSH9TlArr7nU7NFFnRYsCqIZs/YQfGL8QsRIBAN+ee43Igs4eZtB
         UxQ29Dp/Rx5A1DkouK9fhZrElFyz43UcqdBICRy34m0JTuPD9huGMa7JPOt3pvlg8Sqs
         mGySoJ7/DolE7joBleVCVwoZzOjsoRP7Qb8GqAuvdKjmOxsOXiKeuaTGNqUnlS2HK38J
         HuaIxda9HuSjY2RjbsmFSMllK26og2HEf8ZSRXwI3qQrPCd4lQRG1E+1kExC6QUhW7lK
         EM1A==
X-Gm-Message-State: AOAM5310NrKGnT47pKHFtJhyA0ghaV4vV8TSzJWwRq8InBThmaMHvnU4
        pwayGAbZ8thlq652bTN9gaL4v/mpmjwfn6uazBafKg==
X-Google-Smtp-Source: ABdhPJzAEfRy1Ql25Px8odBfL4/7wsYQ6fbK1gT9iKKGTlkCS+cnyVcBWexyK6Mk7k89J7yDzcV723I9mipNjQQxmOM=
X-Received: by 2002:a2e:98d0:0:b0:253:e3a3:ec6c with SMTP id
 s16-20020a2e98d0000000b00253e3a3ec6cmr7088089ljj.493.1653337903584; Mon, 23
 May 2022 13:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <23e0ba7863d51ab629498762a97d477645aeafea.1653123744.git.christophe.jaillet@wanadoo.fr>
 <CAKwvOdneqUvq+Nz_zPmJmuPFfAvWQgnzrw1AJt=WqQF2hThF-A@mail.gmail.com> <00061a71-4d7c-0605-80b5-3d909fc3dfaa@wanadoo.fr>
In-Reply-To: <00061a71-4d7c-0605-80b5-3d909fc3dfaa@wanadoo.fr>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 23 May 2022 13:31:32 -0700
Message-ID: <CAKwvOdnDvrYo_PtMa+JW0FhmkZVDp7eVpR_BV9L2Om-jXPbBog@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: Add an option to enable -O1 and speed-up
 compilation time
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     dan.carpenter@oracle.com, Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 23, 2022 at 1:16 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Thanks for taking time for a full review, even on something you are not
> fan on. This is really appreciated.

Of course! It's still a question worth asking, and having a lore link
to refer back to should the question arise again in the future. Thanks
for asking.
-- 
Thanks,
~Nick Desaulniers
