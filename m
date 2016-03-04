Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f54.google.com ([209.85.192.54]:34727 "EHLO
	mail-qg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755699AbcCDBxc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Mar 2016 20:53:32 -0500
Received: by mail-qg0-f54.google.com with SMTP id w104so33047597qge.1
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Mar 2016 17:53:30 -0800 (PST)
Date: Thu, 3 Mar 2016 20:53:27 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v4 6/8] create/adjust generated/autoksyms.h
In-Reply-To: <56D8B74F.3040903@suse.com>
Message-ID: <alpine.LFD.2.20.1603031809120.13632@knanqh.ubzr>
References: <1456717691-28298-1-git-send-email-nicolas.pitre@linaro.org> <1456717691-28298-7-git-send-email-nicolas.pitre@linaro.org> <56D8B74F.3040903@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 3 Mar 2016, Michal Marek wrote:

> Hi Nicolas,
> 
> sorry for the late review.
> 
> Dne 29.2.2016 v 04:48 Nicolas Pitre napsal(a):
> > +set -e
> > +
> > +cur_ksyms_file="include/generated/autoksyms.h"
> > +new_ksyms_file="include/generated/autoksyms.h.tmpnew"
> > +
> > +info() { [ "$quiet" != "silent_" ] && printf "  %-7s %s\n" "$1" "$2"; }
> 
> Using && as a shorthand for if-statements does not work when running in
> -e mode. This particular line causes the script to fail in silent mode.
> There other uses of && in the script are inside sub-shells, so they do
> work, but it would be good to convert them to avoid breakage if the
> script is edited later.

OK.

> > +# Extract changes between old and new list and touch corresponding
> > +# dependency files.
> > +# Note: sort -m doesn't work well with underscore prefixed symbols so we
> > +# use 'cat ... | sort' instead.
> > +changed=$(
> > +count=0
> > +cat "$cur_ksyms_file" "$new_ksyms_file" | sort | uniq -u |
> 
> sort "$cur_ksyms_file" "$new_ksyms_file" ?

Ah, indeed. Somehow I understood that you could use two files only
with -m.

> sort -m probably does not work, because the input files are not 
> sorted.

They used to at some point as as the content comes from the earlier 
"sort -u".  I had test samples but I can't find them anymore.

Anyway I prefer not to rely on a pre-existing ordering if possible, and 
with the addition of the file header and the CONFIG_MODVERSIONS case 
that came afterwards the content is no longer 100% sorted.  With "sort 
file1 file2" the comment is not very relevant anymore.


Nicolas

