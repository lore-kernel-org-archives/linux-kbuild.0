Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:31875 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgBHFFz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 8 Feb 2020 00:05:55 -0500
MIME-Version: 1.0
References: <20200207180755.100561-1-qperret@google.com> <20200207180755.100561-2-qperret@google.com>
In-Reply-To: <20200207180755.100561-2-qperret@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 8 Feb 2020 06:05:02 +0100
Message-ID: <CAK7LNASMeXjxaj2Hbh420bxBZqVUoa87PtBuu38+fB6aZgJTXg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYMS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Matthias Maennich <maennich@google.com>, "Cc: Android Kernel" <kernel-team@android.com>, Jessica Yu <jeyu@kernel.org>, Christoph Hellwig <hch@infradead.org>

Hi.



On Fri, Feb 7, 2020 at 7:08 PM Quentin Perret <qperret@google.com> wrote:
>
> CONFIG_TRIM_UNUSED_KSYMS currently removes all unused exported symbols
> from ksymtab. This works really well when using in-tree drivers, but
> cannot be used in its current form if some of them are out-of-tree.
>
> Indeed, even if the list of symbols required by out-of-tree drivers is
> known at compile time, the only solution today to guarantee these don't
> get trimmed is to set CONFIG_TRIM_UNUSED_KSYMS=n. This not only wastes
> space, but also makes it difficult to control the ABI usable by vendor
> modules in distribution kernels such as Android. Being able to control
> the kernel ABI surface is particularly useful to ship a unique Generic
> Kernel Image (GKI) for all vendors, which is a first step in the
> direction of getting all vendors to contribute their code upstream.
>
> As such, attempt to improve the situation by enabling users to specify a
> symbol 'whitelist' at compile time. Any symbol specified in this
> whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is set,
> even if it has no in-tree user. The whitelist is defined as a simple
> text file, listing symbols, one per line.
>
> Acked-by: Jessica Yu <jeyu@kernel.org>
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
> @Nicolas: I left your Reviewed-by behind as the code has changed a bit
> but let me know what you think
> ---
>  init/Kconfig                | 13 +++++++++++++
>  scripts/adjust_autoksyms.sh |  5 +++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index a34064a031a5..79fd976ce031 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2180,6 +2180,19 @@ config TRIM_UNUSED_KSYMS
>
>           If unsure, or if you need to build out-of-tree modules, say N.
>
> +config UNUSED_KSYMS_WHITELIST
> +       string "Whitelist of symbols to keep in ksymtab"
> +       depends on TRIM_UNUSED_KSYMS
> +       help
> +         By default, all unused exported symbols will be un-exported from the
> +         build when TRIM_UNUSED_KSYMS is selected.
> +
> +         UNUSED_KSYMS_WHITELIST allows to whitelist symbols that must be kept
> +         exported at all times, even in absence of in-tree users. The value to
> +         set here is the path to a text file containing the list of symbols,
> +         one per line. The path can be absolute, or relative to the kernel
> +         source tree.
> +
>  endif # MODULES
>
>  config MODULES_TREE_LOOKUP
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index a904bf1f5e67..58335eee4b38 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -38,6 +38,10 @@ esac
>  # We need access to CONFIG_ symbols
>  . include/config/auto.conf
>
> +# The symbol whitelist, relative to the source tree
> +eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"

What is this 'eval' needed for?

This worked for me without it.





> +[[ "$ksym_wl" =~ ^/ ]] || ksym_wl="$abs_srctree/$ksym_wl"
> +
>  # Generate a new ksym list file with symbols needed by the current
>  # set of modules.
>  cat > "$new_ksyms_file" << EOT
> @@ -48,6 +52,7 @@ cat > "$new_ksyms_file" << EOT
>  EOT
>  sed 's/ko$/mod/' modules.order |
>  xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> +cat - "$ksym_wl" |
>  sort -u |
>  sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
>
> --
> 2.25.0.341.g760bfbb309-goog
>


--
Best Regards
Masahiro Yamada
