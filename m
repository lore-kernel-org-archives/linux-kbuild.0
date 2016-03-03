Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60849 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757960AbcCCWOm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Mar 2016 17:14:42 -0500
Subject: Re: [PATCH v4 6/8] create/adjust generated/autoksyms.h
References: <1456717691-28298-1-git-send-email-nicolas.pitre@linaro.org>
 <1456717691-28298-7-git-send-email-nicolas.pitre@linaro.org>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56D8B74F.3040903@suse.com>
Date: Thu, 3 Mar 2016 23:14:39 +0100
MIME-Version: 1.0
In-Reply-To: <1456717691-28298-7-git-send-email-nicolas.pitre@linaro.org>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Nicolas,

sorry for the late review.

Dne 29.2.2016 v 04:48 Nicolas Pitre napsal(a):
> +set -e
> +
> +cur_ksyms_file="include/generated/autoksyms.h"
> +new_ksyms_file="include/generated/autoksyms.h.tmpnew"
> +
> +info() { [ "$quiet" != "silent_" ] && printf "  %-7s %s\n" "$1" "$2"; }

Using && as a shorthand for if-statements does not work when running in
-e mode. This particular line causes the script to fail in silent mode.
There other uses of && in the script are inside sub-shells, so they do
work, but it would be good to convert them to avoid breakage if the
script is edited later.


> +# Extract changes between old and new list and touch corresponding
> +# dependency files.
> +# Note: sort -m doesn't work well with underscore prefixed symbols so we
> +# use 'cat ... | sort' instead.
> +changed=$(
> +count=0
> +cat "$cur_ksyms_file" "$new_ksyms_file" | sort | uniq -u |

sort "$cur_ksyms_file" "$new_ksyms_file" ? sort -m probably does not
work, because the input files are not sorted.

Michal
