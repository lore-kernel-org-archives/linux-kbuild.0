Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35075 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbgBFQRb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Feb 2020 11:17:31 -0500
Received: by mail-wm1-f65.google.com with SMTP id b17so706437wmb.0
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Feb 2020 08:17:30 -0800 (PST)
Date: Thu, 6 Feb 2020 16:17:25 +0000
From: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH v2] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200206161725.GA235676@google.com>
References: <20200129181541.105335-1-qperret@google.com>
 <20200206155651.GC16783@linux-8ccs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206155651.GC16783@linux-8ccs>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jessica Yu <jeyu@kernel.org>
Cc: masahiroy@kernel.org, nico@fluxnic.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com

Hi Jessica,

On Thursday 06 Feb 2020 at 16:56:51 (+0100), Jessica Yu wrote:
> +++ Quentin Perret [29/01/20 18:15 +0000]:
> > +config UNUSED_KSYMS_WHITELIST
> > +	string "Whitelist of symbols to keep in ksymtab"
> > +	depends on TRIM_UNUSED_KSYMS
> > +	help
> > +	  By default, all unused exported symbols will be trimmed from the
> > +	  build when TRIM_UNUSED_KSYMS is selected.
> 
> Hm, I thought TRIM_UNUSED_KSYMS just *unexports* unused symbols, no?

Right.

> "Trimmed from the build" sounds like the symbols are not compiled in
> or dropped completely. Please correct me if I misunderstood.

Good point. I tried to re-use the wording from the help text of
TRIM_UNUSED_KSYMS ("This option allows for unused exported symbols
to be dropped from the build"), but I agree this is a bit confusing.

I'll re-write the help text in v3.

> 
> > +	  UNUSED_KSYMS_WHITELIST allows to whitelist symbols that must be kept
> > +	  exported at all times, even in absence of in-tree users. The value to
> > +	  set here is the path to a text file containing the list of symbols,
> > +	  one per line.
> > +
> > endif # MODULES
> > 
> > config MODULES_TREE_LOOKUP
> > diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> > index a904bf1f5e67..8e1b7f70e800 100755
> > --- a/scripts/adjust_autoksyms.sh
> > +++ b/scripts/adjust_autoksyms.sh
> > @@ -48,6 +48,7 @@ cat > "$new_ksyms_file" << EOT
> > EOT
> > sed 's/ko$/mod/' modules.order |
> > xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> > +cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |
> > sort -u |
> > sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
> 
> In general, I agree with the motivation behind this patch, even though
> we try not to provide too much support for out-of-tree modules.
> However, in this particular case, I think it's fair to provide some
> mechanism to keep some exported symbols around that we know will have
> users, despite having no in-tree users for a particular
> configuration/build. For example, livepatch exports symbols that have
> no in-tree users (except for the sample livepatch module, but you'd
> have to enable SAMPLES), and all livepatch users will always be out of
> tree.
> 
> I also agree with Matthias' feedback, so assuming that gets
> incorporated into v3:
> 
> Acked-by: Jessica Yu <jeyu@kernel.org>

Thanks for the review!
Quentin
