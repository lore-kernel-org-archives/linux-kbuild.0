Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727138AbgBFP46 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Feb 2020 10:56:58 -0500
Date: Thu, 6 Feb 2020 16:56:51 +0100
From: Jessica Yu <jeyu@kernel.org>
Subject: Re: [PATCH v2] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200206155651.GC16783@linux-8ccs>
References: <20200129181541.105335-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200129181541.105335-1-qperret@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: masahiroy@kernel.org, nico@fluxnic.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com

+++ Quentin Perret [29/01/20 18:15 +0000]:
>CONFIG_TRIM_UNUSED_KSYMS currently removes all unused exported symbols
>from ksymtab. This works really well when using in-tree drivers, but
>cannot be used in its current form if some of them are out-of-tree.
>
>Indeed, even if the list of symbols required by out-of-tree drivers is
>known at compile time, the only solution today to guarantee these don't
>get trimmed is to set CONFIG_TRIM_UNUSED_KSYMS=n. This not only wastes
>space, but also makes it difficult to control the ABI usable by vendor
>modules in distribution kernels such as Android. Being able to control
>the kernel ABI surface is particularly useful to ship a unique Generic
>Kernel Image (GKI) for all vendors.
>
>As such, attempt to improve the situation by enabling users to specify a
>symbol 'whitelist' at compile time. Any symbol specified in this
>whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is set,
>even if it has no in-tree user. The whitelist is defined as a simple
>text file, listing symbols, one per line.
>
>Signed-off-by: Quentin Perret <qperret@google.com>
>
>---
>v2: make sure to quote the whitelist path properly (Nicolas)
>---
> init/Kconfig                | 12 ++++++++++++
> scripts/adjust_autoksyms.sh |  1 +
> 2 files changed, 13 insertions(+)
>
>diff --git a/init/Kconfig b/init/Kconfig
>index a34064a031a5..d9c977ef7de5 100644
>--- a/init/Kconfig
>+++ b/init/Kconfig
>@@ -2180,6 +2180,18 @@ config TRIM_UNUSED_KSYMS
>
> 	  If unsure, or if you need to build out-of-tree modules, say N.
>
>+config UNUSED_KSYMS_WHITELIST
>+	string "Whitelist of symbols to keep in ksymtab"
>+	depends on TRIM_UNUSED_KSYMS
>+	help
>+	  By default, all unused exported symbols will be trimmed from the
>+	  build when TRIM_UNUSED_KSYMS is selected.

Hm, I thought TRIM_UNUSED_KSYMS just *unexports* unused symbols, no?
"Trimmed from the build" sounds like the symbols are not compiled in
or dropped completely. Please correct me if I misunderstood.

>+	  UNUSED_KSYMS_WHITELIST allows to whitelist symbols that must be kept
>+	  exported at all times, even in absence of in-tree users. The value to
>+	  set here is the path to a text file containing the list of symbols,
>+	  one per line.
>+
> endif # MODULES
>
> config MODULES_TREE_LOOKUP
>diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
>index a904bf1f5e67..8e1b7f70e800 100755
>--- a/scripts/adjust_autoksyms.sh
>+++ b/scripts/adjust_autoksyms.sh
>@@ -48,6 +48,7 @@ cat > "$new_ksyms_file" << EOT
> EOT
> sed 's/ko$/mod/' modules.order |
> xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>+cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |
> sort -u |
> sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"

In general, I agree with the motivation behind this patch, even though
we try not to provide too much support for out-of-tree modules.
However, in this particular case, I think it's fair to provide some
mechanism to keep some exported symbols around that we know will have
users, despite having no in-tree users for a particular
configuration/build. For example, livepatch exports symbols that have
no in-tree users (except for the sample livepatch module, but you'd
have to enable SAMPLES), and all livepatch users will always be out of
tree. 

I also agree with Matthias' feedback, so assuming that gets
incorporated into v3:

Acked-by: Jessica Yu <jeyu@kernel.org>

Thanks!
