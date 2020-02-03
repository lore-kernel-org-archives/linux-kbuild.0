Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:46625 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgBCFUG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 00:20:06 -0500
MIME-Version: 1.0
References: <20200202050922.12402-1-masahiroy@kernel.org> <20200202050922.12402-3-masahiroy@kernel.org>
 <CAMrEMU9ZBAwOPsqeKw0sUF0EWnfO1-UtOKROD6T1AjYX_tWLXA@mail.gmail.com>
In-Reply-To: <CAMrEMU9ZBAwOPsqeKw0sUF0EWnfO1-UtOKROD6T1AjYX_tWLXA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Feb 2020 14:19:07 +0900
Message-ID: <CAK7LNASqGiYHJTsRFdanfxCXe7JYB7+qf=GmvnO3UcJ-uDsatw@mail.gmail.com>
Subject: Re: [PATCH 3/3] kallsyms: fix type of kallsyms_token_table[]
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Justin Capella <justincapella@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Feb 3, 2020 at 12:26 PM Justin Capella <justincapella@gmail.com> wrote:
>
> unsigned char maybe? I understand printable chars unlikely to cause
> any trouble and probably a non issue, but the domain is different for
> char, and while I don't know of supported implementations where sizeof
> char isn't a byte, I think it's a possibility and perhaps why u8 was
> in use?


As I said in the commit description,
this only contains ASCII, which is 7-bit code.

We do not care the signed-ness of char.


kallsyms_names[] has been u8 since the
following old commit:


commit e10392112d315c45f054c22c862e3a7ae27d17d4
Author: Paulo Marques <pmarques@grupopie.com>
Date:   Mon Oct 18 17:59:03 2004 -0700

    [PATCH] kallsyms data size reduction / lookup speedup



Probably, this is just coding mistake.



-- 
Best Regards
Masahiro Yamada
