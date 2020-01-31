Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39553 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728544AbgAaNPL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Jan 2020 08:15:11 -0500
Received: by mail-wr1-f65.google.com with SMTP id y11so8550027wrt.6
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Jan 2020 05:15:10 -0800 (PST)
Date: Fri, 31 Jan 2020 13:15:08 +0000
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH v2] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200131131508.GH102066@google.com>
References: <20200129181541.105335-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200129181541.105335-1-qperret@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: masahiroy@kernel.org, nico@fluxnic.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kernel-team@android.com, jeyu@kernel.org

On Wed, Jan 29, 2020 at 06:15:41PM +0000, Quentin Perret wrote:
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

Thank you for working on this! I like the idea!

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
>+
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

This handles absolute paths very well. I wonder whether we can make this
more useful for folks that want to maintain such a whitelist in their
copy of the tree. Lets say, I have in my sources
arch/x86/configs/x86_64_symbol_whitelist and in my config I have
CONFIG_UNUSED_KSYMS_WHITELIST="arch/x86/configs/x86_64_symbol_whitelist".

If I see it correctly, UNUSED_KSYMS_WHITELIST is currently either an
absolute path or a relative path to the current build directory. I would
prefer if relative paths would be relative to the source directory to
support the above use case. (Note, that scenario above works if I build
directly in the sources, but fails if I build O=/somewhere/else.)

Cheers,
Matthias

> sort -u |
> sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
>
>-- 
>2.25.0.341.g760bfbb309-goog
>
