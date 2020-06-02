Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail7.static.mailgun.info ([104.130.122.7]:23780 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgFBNZ4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Jun 2020 09:25:56 -0400
Subject: Re: [GIT PULL][PATCH v5 0/8] Add support for ZSTD-compressed kernel and initramfs
Message-Id: <20200602132051.A89BA6095180@huitzilopochtli.metztli-it.com>
Date: Tue,  2 Jun 2020 06:20:51 -0700 (PDT)
From: Metztli Information Technology <jose.r.r@metztli.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: nolange79@gmail.com
Cc: nickrterrell@gmail.com, akpm@linux-foundation.org, Kernel-team@fb.com, clm@fb.com, gregkh@linuxfoundation.org, keescook@chromium.org, kilobyte@angband.pl, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@kernel.org, oss@malat.biz, patrick@stwcx.xyz, patrickw3@fb.com, rmikey@fb.com, sedat.dilek@gmail.com, terrelln@fb.com, x86@kernel.org, reiserfs-devel@vger.kernel.org, edward.shishkin@gmail.com

On Mon, Jun 1, 2020 at 2:59 PM Norbert Lange <nolange79@gmail.com> wrote:
>
> The series seems to be stuck in limbo, and I got the hint to bring
> this to Andrew's attention [1].
> Hope this will finally end in upstream, been using these patches for ~2 years.
>
> Regards, Norbert
>
> [1] - https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=955469

Began using your patch for Debian Buster backport of 0.136 initramfs-tools, and Nick Terrel's kernel patch for 5.6 -- but modified for 5.5.17-19 in my reiser4 builds -- and set both defaults to zstd.

Thus far, as long as there exists 'a priori' the Zstd package, the combination works in both local and my custom Google cloud instances installations.

Best Professional Regards.


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.5.19 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
