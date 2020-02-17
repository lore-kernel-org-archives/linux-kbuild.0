Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41582 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728924AbgBQQfA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 11:35:00 -0500
Received: by mail-wr1-f65.google.com with SMTP id c9so20533242wrw.8
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 08:34:59 -0800 (PST)
Date: Mon, 17 Feb 2020 16:34:57 +0000
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH v4 3/3] kbuild: generate autoksyms.h early
Message-ID: <20200217163457.GC48466@google.com>
References: <20200212202140.138092-1-qperret@google.com>
 <20200212202140.138092-4-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200212202140.138092-4-qperret@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: masahiroy@kernel.org, nico@fluxnic.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kernel-team@android.com, jeyu@kernel.org, hch@infradead.org

On Wed, Feb 12, 2020 at 08:21:40PM +0000, Quentin Perret wrote:
>When doing a cold build, autoksyms.h starts empty, and is updated late
>in the build process to have visibility over the symbols used by in-tree
>drivers. But since the symbol whitelist is known upfront, it can be used
>to pre-populate autoksyms.h and maximize the amount of code that can be
>compiled to its final state in a single pass, hence reducing build time.
>
>Do this by using gen_autoksyms.sh to initialize autoksyms.h instead of
>creating an empty file.
>
>Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Matthias Maennich <maennich@google.com>
Tested-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

>---
> Makefile                 | 7 +++++--
> scripts/gen_autoksyms.sh | 3 ++-
> 2 files changed, 7 insertions(+), 3 deletions(-)
>
>diff --git a/Makefile b/Makefile
>index 84b71845c43f..17b7e7f441bd 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -1062,9 +1062,12 @@ endif
>
> autoksyms_h := $(if $(CONFIG_TRIM_UNUSED_KSYMS), include/generated/autoksyms.h)
>
>+quiet_cmd_autoksyms_h = GEN     $@
>+      cmd_autoksyms_h = mkdir -p $(dir $@); $(CONFIG_SHELL) \
>+			$(srctree)/scripts/gen_autoksyms.sh $@
>+
> $(autoksyms_h):
>-	$(Q)mkdir -p $(dir $@)
>-	$(Q)touch $@
>+	$(call cmd,autoksyms_h)
>
> ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>
>diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
>index 2cea433616a8..f52b93ad122c 100755
>--- a/scripts/gen_autoksyms.sh
>+++ b/scripts/gen_autoksyms.sh
>@@ -32,7 +32,8 @@ cat > "$output_file" << EOT
>
> EOT
>
>-sed 's/ko$/mod/' modules.order |
>+[ -f modules.order ] && modlist=modules.order || modlist=/dev/null
>+sed 's/ko$/mod/' $modlist |
> xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> cat - "$ksym_wl" |
> sort -u |
>-- 
>2.25.0.225.g125e21ebc7-goog
>
