Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33204 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbgBDOoT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Feb 2020 09:44:19 -0500
Received: by mail-wm1-f68.google.com with SMTP id m10so2368105wmc.0
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Feb 2020 06:44:17 -0800 (PST)
Date: Tue, 4 Feb 2020 14:44:15 +0000
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH v2] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200204144415.GC42496@google.com>
References: <20200129181541.105335-1-qperret@google.com>
 <20200131131508.GH102066@google.com>
 <20200131174055.GA8425@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200131174055.GA8425@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: masahiroy@kernel.org, nico@fluxnic.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kernel-team@android.com, jeyu@kernel.org

On Fri, Jan 31, 2020 at 05:40:55PM +0000, Quentin Perret wrote:
>On Friday 31 Jan 2020 at 13:15:08 (+0000), 'Matthias Maennich' via kernel-team wrote:
>> On Wed, Jan 29, 2020 at 06:15:41PM +0000, Quentin Perret wrote:
>> > diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
>> > index a904bf1f5e67..8e1b7f70e800 100755
>> > --- a/scripts/adjust_autoksyms.sh
>> > +++ b/scripts/adjust_autoksyms.sh
>> > @@ -48,6 +48,7 @@ cat > "$new_ksyms_file" << EOT
>> > EOT
>> > sed 's/ko$/mod/' modules.order |
>> > xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>> > +cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |
>>
>> This handles absolute paths very well. I wonder whether we can make this
>> more useful for folks that want to maintain such a whitelist in their
>> copy of the tree. Lets say, I have in my sources
>> arch/x86/configs/x86_64_symbol_whitelist and in my config I have
>> CONFIG_UNUSED_KSYMS_WHITELIST="arch/x86/configs/x86_64_symbol_whitelist".
>>
>> If I see it correctly, UNUSED_KSYMS_WHITELIST is currently either an
>> absolute path or a relative path to the current build directory. I would
>> prefer if relative paths would be relative to the source directory to
>> support the above use case. (Note, that scenario above works if I build
>> directly in the sources, but fails if I build O=/somewhere/else.)
>
>Right, that is an interesting use case. I suppose something like the
>below should work (with appropriate documentation of the config option).
>
>---8<---
>diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
>index 8e1b7f70e800..d37803fd75ce 100755
>--- a/scripts/adjust_autoksyms.sh
>+++ b/scripts/adjust_autoksyms.sh
>@@ -38,6 +38,12 @@ esac
> # We need access to CONFIG_ symbols
> . include/config/auto.conf
>
>+ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
>+# If the path is relative, it must be relative to the source tree
>+if [ "$ksym_wl" == "${ksym_wl#/}" ]; then
>+       ksym_wl="$abs_srctree/$ksym_wl"
>+fi
>+
> # Generate a new ksym list file with symbols needed by the current
> # set of modules.
> cat > "$new_ksyms_file" << EOT
>@@ -48,7 +54,7 @@ cat > "$new_ksyms_file" << EOT
> EOT
> sed 's/ko$/mod/' modules.order |
> xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>-cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |
>+cat - "$ksym_wl" |
> sort -u |
> sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
>--->8---
>
>Thoughts ?

That definitely looks like I would expect that config option to work.
Thanks for looking into that!

Cheers,
Matthias

>
>Thanks,
>Quentin
