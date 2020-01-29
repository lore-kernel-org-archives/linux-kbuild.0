Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32846 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbgA2RhU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jan 2020 12:37:20 -0500
Received: by mail-wr1-f67.google.com with SMTP id b6so438138wrq.0
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Jan 2020 09:37:19 -0800 (PST)
Date: Wed, 29 Jan 2020 17:37:14 +0000
From: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH] kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYMS
Message-ID: <20200129173714.GA193443@google.com>
References: <20200129150612.19200-1-qperret@google.com>
 <nycvar.YSQ.7.76.2001291152540.1655@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.2001291152540.1655@knanqh.ubzr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com

On Wednesday 29 Jan 2020 at 12:11:12 (-0500), Nicolas Pitre wrote:
> > diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> > index a904bf1f5e67..1a6f7f377230 100755
> > --- a/scripts/adjust_autoksyms.sh
> > +++ b/scripts/adjust_autoksyms.sh
> > @@ -48,6 +48,7 @@ cat > "$new_ksyms_file" << EOT
> >  EOT
> >  sed 's/ko$/mod/' modules.order |
> >  xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> > +cat - $CONFIG_UNUSED_KSYMS_WHITELIST |
> 
> This is a nice trick, however it'll fail if the file path contains 
> spaces or other shell special characters.

Argh! Right, that's a very good point.

> You could try something like 
> this:
> 
> [ -z "$CONFIG_UNUSED_KSYMS_WHITELIST" ] \
> 	&& whitelist= \
> 	|| whitelist="\"$CONFIG_UNUSED_KSYMS_WHITELIST\""
> 
> And then...
> 
>   eval cat - $whitelist | ...
> 
> This way, if $CONFIG_UNUSED_KSYMS_WHITELIST is non empty, it'll get 
> quoted.

A shorter alternative would be something a little like so perhaps ?

diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index 1a6f7f377230..8e1b7f70e800 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -48,7 +48,7 @@ cat > "$new_ksyms_file" << EOT
 EOT
 sed 's/ko$/mod/' modules.order |
 xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
-cat - $CONFIG_UNUSED_KSYMS_WHITELIST |
+cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |
 sort -u |
 sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"

No strong opinion, though.

Thanks for the review,
Quentin
