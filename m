Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:26703
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753924AbdKNJtT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Nov 2017 04:49:19 -0500
Date: Tue, 14 Nov 2017 10:49:12 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH v3] coccinelle: fix parallel build with
 CHECK=scripts/coccicheck
In-Reply-To: <1510650290-3363-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <alpine.DEB.2.20.1711141047350.2874@hadrien>
References: <1510650290-3363-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, cocci@systeme.lip6.fr, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>

> +
> +    # If -j option is given to Make, scripts/coccicheck runs in parallel.
> +    # If coccinelle also runs in parallel, it fails because multiple processes
> +    # try to get access to the same subdirectory that stores stdout/stderr.
> +    # No need to parallelize coccinelle in this case - this mode takes only
> +    # one file input.
> +    NPROC=1

Since I am also changing Coccinelle to avoid the problem, maybe it would
be better to just remove the explanation sentence (If coccinelle also runs
in parallel,...).

julia
