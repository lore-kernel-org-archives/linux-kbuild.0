Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37294 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727806AbgBKFoj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 00:44:39 -0500
Received: by mail-wr1-f67.google.com with SMTP id w15so10650111wru.4
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Feb 2020 21:44:38 -0800 (PST)
Date: Tue, 11 Feb 2020 05:44:33 +0000
From: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH v3 1/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200211054433.GB72419@google.com>
References: <20200207180755.100561-1-qperret@google.com>
 <20200207180755.100561-2-qperret@google.com>
 <CAK7LNASMeXjxaj2Hbh420bxBZqVUoa87PtBuu38+fB6aZgJTXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASMeXjxaj2Hbh420bxBZqVUoa87PtBuu38+fB6aZgJTXg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Pitre <nico@fluxnic.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Matthias Maennich <maennich@google.com>, "Cc: Android Kernel" <kernel-team@android.com>, Jessica Yu <jeyu@kernel.org>, Christoph Hellwig <hch@infradead.org>

On Saturday 08 Feb 2020 at 06:05:02 (+0100), Masahiro Yamada wrote:
> On Fri, Feb 7, 2020 at 7:08 PM Quentin Perret <qperret@google.com> wrote:
> > diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> > index a904bf1f5e67..58335eee4b38 100755
> > --- a/scripts/adjust_autoksyms.sh
> > +++ b/scripts/adjust_autoksyms.sh
> > @@ -38,6 +38,10 @@ esac
> >  # We need access to CONFIG_ symbols
> >  . include/config/auto.conf
> >
> > +# The symbol whitelist, relative to the source tree
> > +eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
> 
> What is this 'eval' needed for?
> 
> This worked for me without it.

Right, it is there to expand the path in cases where the user sets the
option to "~/my_whitelist" for instance. That could most certainly use a
comment, though.

Thanks,
Quentin
