Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34536 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbgBQOX2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 09:23:28 -0500
Received: by mail-wm1-f66.google.com with SMTP id s144so21180wme.1
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 06:23:27 -0800 (PST)
Date: Mon, 17 Feb 2020 14:23:22 +0000
From: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH v4 1/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200217142322.GA183353@google.com>
References: <20200212202140.138092-1-qperret@google.com>
 <20200212202140.138092-2-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212202140.138092-2-qperret@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: masahiroy@kernel.org, nico@fluxnic.net
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com, jeyu@kernel.org, hch@infradead.org

On Wednesday 12 Feb 2020 at 20:21:38 (+0000), Quentin Perret wrote:
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index a904bf1f5e67..93f4d10e66e6 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -38,6 +38,10 @@ esac
>  # We need access to CONFIG_ symbols
>  . include/config/auto.conf
>  
> +# Use 'eval' to expand the whitelist path and check if it is relative
> +eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
> +[ "${ksym_wl:0:1}" = "/" ] || ksym_wl="$abs_srctree/$ksym_wl"

Our internal CI just informed me that this is *still* not quite POSIX
compliant ... I believe that the following should (finally) solve this
issue:

  [ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"

The above seems to work with bash, zsh, dash, posh and, IIUC, complies
with https://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html.
I'll try other shells and stare at the doc some more, but if there is a
preferred pattern in the kernel I'm happy to change it.

Thanks,
Quentin
