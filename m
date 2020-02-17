Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34355 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728428AbgBQPWG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 10:22:06 -0500
Received: by mail-wr1-f68.google.com with SMTP id n10so18261677wrm.1
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 07:22:03 -0800 (PST)
Date: Mon, 17 Feb 2020 15:22:01 +0000
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH v4 1/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200217152201.GA48466@google.com>
References: <20200212202140.138092-1-qperret@google.com>
 <20200212202140.138092-2-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200212202140.138092-2-qperret@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: masahiroy@kernel.org, nico@fluxnic.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kernel-team@android.com, jeyu@kernel.org, hch@infradead.org

On Wed, Feb 12, 2020 at 08:21:38PM +0000, Quentin Perret wrote:
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
>Kernel Image (GKI) for all vendors, which is a first step in the
>direction of getting all vendors to contribute their code upstream.
>
>As such, attempt to improve the situation by enabling users to specify a
>symbol 'whitelist' at compile time. Any symbol specified in this
>whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is set,
>even if it has no in-tree user. The whitelist is defined as a simple
>text file, listing symbols, one per line.
>
>Acked-by: Jessica Yu <jeyu@kernel.org>
>Signed-off-by: Quentin Perret <qperret@google.com>
>---
> init/Kconfig                | 13 +++++++++++++
> scripts/adjust_autoksyms.sh |  5 +++++
> 2 files changed, 18 insertions(+)
>
>diff --git a/init/Kconfig b/init/Kconfig
>index cfee56c151f1..58b672afceb2 100644
>--- a/init/Kconfig
>+++ b/init/Kconfig
>@@ -2210,6 +2210,19 @@ config TRIM_UNUSED_KSYMS
>
> 	  If unsure, or if you need to build out-of-tree modules, say N.
>
>+config UNUSED_KSYMS_WHITELIST
>+	string "Whitelist of symbols to keep in ksymtab"
>+	depends on TRIM_UNUSED_KSYMS
>+	help
>+	  By default, all unused exported symbols will be un-exported from the
>+	  build when TRIM_UNUSED_KSYMS is selected.
>+
>+	  UNUSED_KSYMS_WHITELIST allows to whitelist symbols that must be kept
>+	  exported at all times, even in absence of in-tree users. The value to
>+	  set here is the path to a text file containing the list of symbols,
>+	  one per line. The path can be absolute, or relative to the kernel
>+	  source tree.
>+
> endif # MODULES
>
> config MODULES_TREE_LOOKUP
>diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
>index a904bf1f5e67..93f4d10e66e6 100755
>--- a/scripts/adjust_autoksyms.sh
>+++ b/scripts/adjust_autoksyms.sh
>@@ -38,6 +38,10 @@ esac
> # We need access to CONFIG_ symbols
> . include/config/auto.conf
>
>+# Use 'eval' to expand the whitelist path and check if it is relative
>+eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
>+[ "${ksym_wl:0:1}" = "/" ] || ksym_wl="$abs_srctree/$ksym_wl"
>+
> # Generate a new ksym list file with symbols needed by the current
> # set of modules.
> cat > "$new_ksyms_file" << EOT
>@@ -48,6 +52,7 @@ cat > "$new_ksyms_file" << EOT
> EOT
> sed 's/ko$/mod/' modules.order |
> xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>+cat - "$ksym_wl" |

In case the whitelist file can't be found, the error message is

  cat: path/to/file: file not found

I wonder whether we can make this error message a bit more specific by
telling the user that the KSYMS_WHITELIST is missing.

With the above addressed (and your amend for the absolute path test),
please feel free to add

Tested-by: Matthias Maennich <maennich@google.com>
Reviewed-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

> sort -u |
> sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
>
>-- 
>2.25.0.225.g125e21ebc7-goog
>
